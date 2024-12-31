import 'package:logging/logging.dart';
import 'package:the_movie_databases/data/local/databases/entity/account/account_details.dart';
import 'package:the_movie_databases/data/local/databases/entity/movies.dart';
import 'package:the_movie_databases/data/local/databases/entity/tv_shows.dart';
import 'package:the_movie_databases/data/network/response/api_response.dart';
import 'package:the_movie_databases/data/shared_preferences_service.dart';

import '../../../utils/result.dart';
import '../../network/service/tmdb_client.dart';
import 'favourites_repository.dart';

class FavouritesRepositoryImpl implements FavouritesRepository {
  FavouritesRepositoryImpl({
    required TmdbClient tmdbClient,
    required SharedPreferencesService sharedPreferencesService,
  })  : _tmdbClient = tmdbClient,
        _sharedPreferencesService = sharedPreferencesService {
    _initializeSession();
  }

  final SharedPreferencesService _sharedPreferencesService;
  final TmdbClient _tmdbClient;
  final _log = Logger('FavouritesRepositoryImpl');
  String? _sessionId;
  int? _accountId;

  Future<void> _initializeSession() async {
    await loadSessionId();
    await getAccountId();
  }

  Future<void> loadSessionId() async {
    final result = await _sharedPreferencesService.fetchSessionId();
    if (result is Ok<String?>) {
      _sessionId = result.value;
      _log.fine('Got session ID: ${result.value}');
    }
  }

  Future<void> getAccountId() async {
    final result = await _sharedPreferencesService.fetchAccountId();
    if (result is Ok<int?>) {
      _accountId = result.value;
      if (_accountId == null || _accountId == 0) {
        _accountId = await loadAccountId();
      }
    }
  }

  Future<int> loadAccountId() async {
    if (_sessionId!.isEmpty && _sessionId == null) {
      loadSessionId();
    }

    final response = await _tmdbClient.fetchAccountDetails(_sessionId!);
    if (response is Ok<AccountDetails>) {
      final accountId = response.value.id;
      await _sharedPreferencesService.saveAccountId(accountId);
      return accountId;
    }
    return 0;
  }

  @override
  Future<Result<bool>> isItemFavorites(
      {required int mediaId, required String mediaType}) async {
    loadSessionId();

    if (_sessionId == null) {
      _log.severe('Session ID is null when checking favorites status');
      return Result.error(Exception('No active session'));
    }

    final isFavorites = await _tmdbClient.isItemFavourites(
        sessionId: _sessionId!, mediaId: mediaId, mediaType: mediaType);
    return isFavorites;
  }

  @override
  Future<ApiPostResponse> addToFavourites(
      {required int accountId,
      required int mediaId,
      required String mediaType,
      required bool isFavourite}) async {
    _log.fine(
        'Adding to favourites: $_sessionId, $accountId, $mediaId, $mediaType, $isFavourite');

    loadSessionId();

    final response = await _tmdbClient.addToFavourites(
        sessionId: _sessionId!,
        accountId: accountId,
        mediaId: mediaId,
        mediaType: mediaType,
        isFavourite: !isFavourite);

    try {
      if (response.statusMessage == 'success') {
        _log.fine(
            'Added to favourites: $response.statusMessage ${response.statusCode}');
        return response;
      } else {
        _log.severe(
            'Failed to add to favourites: $response.statusMessage ${response.statusCode}');
        return response;
      }
    } catch (e) {
      _log.severe('Failed to add to favourites: $e');
      return response;
    }
  }

  @override
  Future<Result<List<Movies>>> fetchFavouritesMovies({int? page}) async {
    try {
      await _initializeSession();

      if (_sessionId == null || _accountId == null) {
        return Result.error(Exception('No active session or account'));
      }

      final response = await _tmdbClient.fetchFavouritesMovies(
        sessionId: _sessionId!,
        accountId: _accountId!,
        page: page,
      );

      if (response is Ok<ApiResponse<Movies>>) {
        return Result.ok(response.value.results);
      }

      return Result.error(Exception('Failed to fetch favourites movies'));
    } catch (e) {
      _log.severe('Failed to fetch favourites movies: $e');
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<TvShows>>> fetchFavouritesTvShows({int? page}) async {
    try {
      await _initializeSession();

      if (_sessionId == null || _accountId == null) {
        return Result.error(Exception('No active session or account'));
      }

      final response = await _tmdbClient.fetchFavouritesTvShows(
        sessionId: _sessionId!,
        accountId: _accountId!,
        page: page,
      );

      if (response is Ok<ApiResponse<TvShows>>) {
        return Result.ok(response.value.results);
      }

      return Result.error(Exception('Failed to fetch favourites tv shows'));
    } catch (e) {
      _log.severe('Failed to fetch favourites tv shows: $e');
      return Result.error(Exception('Failed to fetch favourites tv shows'));
    }
  }
}
