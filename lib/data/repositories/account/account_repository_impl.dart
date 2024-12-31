import 'package:logging/logging.dart';
import 'package:the_movie_databases/data/local/databases/app_databases.dart';
import 'package:the_movie_databases/data/local/databases/entity/account/account.dart';
import 'package:the_movie_databases/data/local/databases/entity/account/account_details.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client.dart';
import 'package:the_movie_databases/data/repositories/account/account_repository.dart';
import 'package:the_movie_databases/data/shared_preferences_service.dart';
import 'package:the_movie_databases/utils/result.dart';

class AccountRepositoryImpl implements AccountRepository{
  AccountRepositoryImpl({
    required AppDatabases appDatabases,
    required TmdbClient tmdbClient,
    required SharedPreferencesService sharedPreferencesService,
  }) : _tmdbClient = tmdbClient,
  _appDatabases = appDatabases,
  _sharedPreferencesService = sharedPreferencesService{
    _tmdbClient.sessionIdsProvider = _sessionIdsProvider;
  }

  String? _sessionId;
  final _log = Logger('AccountRepository');
  final TmdbClient _tmdbClient;
  final AppDatabases _appDatabases;
  final SharedPreferencesService _sharedPreferencesService;
  AccountDetails? _cachedAccountDetails;

  Future<void> loadSessionId() async {
    final result = await _sharedPreferencesService.fetchSessionId();
    if (result is Ok<String?>) {
      _sessionId = result.value;
      _log.fine('Got session ID from shared: ${result.value}');
    } else {
      throw Exception('Failed to load session ID: $result');
    }
  }

  Future<void> saveAccountId(int accountId) async {
    _log.fine('Saving account ID: $accountId');
    await _sharedPreferencesService.saveAccountId(accountId);
  }

  @override
  Future<Result<AccountDetails>> fetchAccount() async {
    try {

      if (_cachedAccountDetails != null) {
        return Result.ok(_cachedAccountDetails!);
      }

      await loadSessionId();

      if (_sessionId == null) {
        _log.severe('Session id is null');
        throw Exception('Session ID is null');
      }

      // First try to fetch from network
      final response = await _tmdbClient.fetchAccountDetails(_sessionId!);
      if (response is Ok<AccountDetails>) {
        final accountDetails = response.value;
        _log.fine('Network Account Details: ${accountDetails.toJson()}');
        
        // Store in DB
        final account = Account.fromEntity(accountDetails);
        await insertAccountToDb(account);
        await saveAccountId(accountDetails.id);
        _cachedAccountDetails = accountDetails;

        return Result.ok(accountDetails);
      } 

      // Always return from DB (Single Source of Truth)
      final fromDb = await fetchAccountFromDb();
      if (fromDb != null) {
        final accountDetails = fromDb.toEntity();
        _cachedAccountDetails = accountDetails;
      
        return Result.ok(accountDetails);
      }
      
      return Result.error(Exception('No account data available'));
    } catch (e) {
      _log.warning('Error occurred: $e');
      
      // Try to fetch from DB as fallback
      final accountFromDb = await fetchAccountFromDb();
      if (accountFromDb != null) {
        final accountDetails = accountFromDb.toEntity();
        _cachedAccountDetails = accountDetails;
        return Result.ok(accountDetails);
      }
      return Result.error(Exception('Failed to fetch account details: $e'));
    }
  }

  String? _sessionIdsProvider() =>
      _sessionId != null ? 'session_id=$_sessionId' : null;

  @override
  Future<Account?> fetchAccountFromDb() async {
    try {
      final account = await _appDatabases.accountDao.getAccount();
      if (account == null) {
        _log.warning("No account found in DB");
      } else {
        _log.fine("Successfully fetched account from DB");
      }
      return account;
    } catch (e) {
      _log.warning("Error getting account from db: $e");
      return null;
    }
  }

  @override
  Future<void> insertAccountToDb(Account account) async {
    try {
      await _appDatabases.accountDao.deleteAccount();
      await _appDatabases.accountDao.insertAccount(account);
      _log.fine('Successfully inserted account into DB with avatar path: ${account.avatarPath}');
    } catch (e) {
      _log.severe("Failed to insert account into DB: $e");
      throw Exception("Database error: $e");
    }
  }

}