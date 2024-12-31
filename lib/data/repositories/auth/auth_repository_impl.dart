import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:the_movie_databases/config/auth_state.dart';
import 'package:the_movie_databases/data/local/databases/app_databases.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client.dart';
import 'package:the_movie_databases/data/network/service/tmdb_service.dart';
import 'package:the_movie_databases/data/repositories/auth/auth_repository.dart';
import 'package:the_movie_databases/data/shared_preferences_service.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../network/response/api_response.dart';

class AuthRepositoryImpl extends ChangeNotifier implements AuthRepository {
  AuthRepositoryImpl({
    required TmdbService tmdbService,
    required TmdbClient tmdbClient,
    required SharedPreferencesService sharedPreferencesService,
    required AppDatabases appDatabase,
  })  : _tmdbService = tmdbService,
        _tmdbClient = tmdbClient,
        _appDatabase = appDatabase,
        _sharedPreferencesService = sharedPreferencesService {
    _tmdbClient.sessionIdsProvider = _sessionIdsProvider;
  }

  final TmdbClient _tmdbClient;
  final TmdbService _tmdbService;
  final SharedPreferencesService _sharedPreferencesService;
  final AppDatabases _appDatabase;
  final _log = Logger('AuthRepository');

  String? _sessionId;
  bool? _isAuth;
  Timer? _expirationTimer;

  AuthState _authState = AuthState.unauthenticated;

  @override
  AuthState get authState => _authState;

  @override
  String? get sessionId => _sessionId;

  @override
  Future<bool> get isAuth async {
    if (_isAuth != null) {
      return _isAuth!;
    }

    await _fetch();
    return _isAuth ?? false;
  }

  

  Future<void> _fetch() async {
    final result = await _sharedPreferencesService.fetchSessionId();
    switch (result) {
      case Ok<String?>():
        _sessionId = result.value;
        _isAuth = _sessionId != null;
        notifyListeners();
      case Error<String?>():
        _log.severe(
            'Failed to fetch Token from SharedPreferences', result.error);
        _isAuth = false;
        notifyListeners();
    }
  }

  @override
  Future<Result<void>> createSessionId(String requestToken) async {
    try {
      final sessionId = await _tmdbService.createSessionId(requestToken);
      _sessionId = sessionId;
      await _sharedPreferencesService.saveSessionId(sessionId);
      _isAuth = true;
      _authState = AuthState.authenticated;
      notifyListeners();
      return const Result.ok(null);
    } on Exception catch (err) {
      return Result.error(err);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logOut() async {
    try {
      final success = await _tmdbService.deleteSession(_sessionId);
      if (success) {
        _sessionId = null;
        _isAuth = false;
        _authState = AuthState.unauthenticated;
        await _sharedPreferencesService.saveSessionId(_sessionId);
        await _sharedPreferencesService.saveAccountId(0);
        await _clearData();
        _expirationTimer?.cancel();
        notifyListeners();
        return const Result.ok(null);
      } else {
        return Result.error(Exception("Error occurred when deleting session"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      notifyListeners();
    }
  }

  Future<void> _clearData() async {
    await _appDatabase.clearAllTables();
  }

  @override
  Future<Result<void>> login() async {
    try {
      final requestToken = await _tmdbService.createRequestToken();
      final login = await _tmdbService.startTmdbAuth(requestToken);
      return Result.ok(login);
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> createGuestSession() async {
    try {
      final guestSession = await _tmdbService.createGuestSession();

      if (guestSession is Ok<ApiResponseGuestSession>) {
        final guestSessionData = guestSession.value;
        _sessionId = guestSessionData.guestSessionId;
        await _sharedPreferencesService.saveSessionId(_sessionId);
        _isAuth = true;
        _authState = AuthState.guestSession;

        final test = DateTime.now().toUtc().add(const Duration(seconds: 1000));
        _setupExpirationTimer(test.toString());

        notifyListeners();
        return const Result.ok(null);
      } else {
        return Result.error(Exception('Failed to create guest session'));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<void> _setupExpirationTimer(String expiresAt) async {
    final now = DateTime.now().toUtc();
    final expiresAtConverted = DateTime.parse(expiresAt);
    final timeUntilExpiration = expiresAtConverted.difference(now);

    _log.info('Current time (UTC): $now');
    _log.info('Expires at (UTC): $expiresAtConverted');
    _log.info(
        'Time until expiration: ${timeUntilExpiration.inSeconds} seconds');

    _expirationTimer?.cancel();

    if (timeUntilExpiration.isNegative) {
      _log.warning('Session already expired!');
      _isAuth = false;
      _authState = AuthState.unauthenticated;
      await _sharedPreferencesService.saveSessionId(null);
      await _sharedPreferencesService.saveAccountId(0);
      await _clearData();
      notifyListeners();
    } else {
      _log.info('Setting timer for auto-logout');
      _expirationTimer = Timer(timeUntilExpiration, () async {
        _log.info('Session expired - logging out');
        _isAuth = false;
        _authState = AuthState.unauthenticated;
        await _sharedPreferencesService.saveSessionId(null);
        await _sharedPreferencesService.saveAccountId(0);
        await _clearData();
        notifyListeners();
      });
    }
  }

  String? _sessionIdsProvider() =>
      _sessionId != null ? 'session_id=$_sessionId' : null;

  final List<VoidCallback> _listeners = [];

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  bool get hasListeners => _listeners.isNotEmpty;

  @override
  void notifyListeners() {
    for (var listener in _listeners) {
      listener(); // Notify all listeners
    }
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  @override
  void dispose() {
    _expirationTimer?.cancel();
    _listeners.clear();
    super.dispose();
  }
}
