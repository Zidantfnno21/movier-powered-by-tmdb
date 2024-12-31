import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:the_movie_databases/data/local/databases/entity/account/account_details.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client.dart';
import 'package:the_movie_databases/data/network/videos.dart';
import 'package:the_movie_databases/utils/result.dart';
import '../../local/databases/entity/movies.dart';
import '../../local/databases/entity/people.dart';
import '../../local/databases/entity/trending.dart';
import '../../local/databases/entity/tv_shows.dart';
import '../response/api_response.dart';

class TmdbClientImpl implements TmdbClient {
  final String baseUrl = 'https://api.themoviedb.org/3';
  final String apiKey = dotenv.env['TMDB_API_KEY'] ?? '';
  final Dio dio;

  TmdbClientImpl({Dio? dio}) : dio = dio ?? Dio();
  final _log = Logger('Tmdb Client Impl');

  @override
  SessionIdsProvider? sessionIdsProvider;

  @override
  setSessionIdsProvider(SessionIdsProvider provider) {
    sessionIdsProvider = provider;
  }

  @override
  Future<Result<ApiResponse<Trending>>> fetchTrending(String timeWindow) async {
    final String url = '$baseUrl/trending/all/$timeWindow?api_key=$apiKey';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<Trending>.fromJson(
          response.data,
          (json) => Trending.fromJson(json as Map<String, dynamic>),
        );
        return Result.ok(apiResponse);
      } else {
        return Result.error('Failed to load trending data' as Exception);
      }
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<ApiResponse<Movies>>> fetchPopularMovies(int page) async {
    final String url = '$baseUrl/movie/popular?api_key=$apiKey&page=$page';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final apiResponse = ApiResponse<Movies>.fromJson(
          response.data,
          (json) => Movies.fromJson(json as Map<String, dynamic>),
        );

        return Result.ok(apiResponse);
      } else {
        return Result.error('Failed to load popular movies data' as Exception);
      }
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<ApiResponse<TvShows>>> fetchPopularTvShows(int page) async {
    final String url = '$baseUrl/tv/popular?api_key=$apiKey&page=$page';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return Result.ok(ApiResponse<TvShows>.fromJson(
          response.data,
          (json) => TvShows.fromJson(json as Map<String, dynamic>),
        ));
      } else {
        return Result.error(
            'Failed to load popular tv shows data' as Exception);
      }
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<ApiResponse<People>>> fetchPeople(int page) async {
    final String url = '$baseUrl/person/popular?api_key=$apiKey&page=$page';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return Result.ok(ApiResponse<People>.fromJson(
          response.data,
          (json) => People.fromJson(json as Map<String, dynamic>),
        ));
      } else {
        return Result.error('Failed to load popular people data' as Exception);
      }
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<ApiResponseGenre> fetchMovieGenre() async {
    final String url = '$baseUrl/genre/movie/list?api_key=$apiKey';

    try {
      final response = await dio.get(url);
      print('Raw Response Data: ${response.data}');

      if (response.statusCode == 200) {
        if (response.data != null && response.data['genres'] != null) {
          return ApiResponseGenre.fromJson(response.data);
        } else {
          throw Exception('Missing or null "genres" field in the response');
        }
      } else {
        throw Exception('Failed to get genre list: ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = 'Unknown Dio Error';

      if (e.response != null) {
        errorMessage =
            'DioException: ${e.response?.statusCode} - ${e.response?.data}';
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection Timeout Error: ${e.message}';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Receive Timeout Error: ${e.message}';
      } else if (e.type == DioExceptionType.cancel) {
        errorMessage = 'Request Canceled: ${e.message}';
      } else {
        errorMessage = 'DioException: ${e.message}';
      }

      throw Exception('Error getting genre list: $errorMessage');
    } catch (e) {
      throw Exception('Error getting genre list: $e');
    }
  }

  @override
  Future<ApiResponseGenre> fetchTvShowsGenre() async {
    final String url = '$baseUrl/genre/tv/list?api_key=$apiKey';

    try {
      final response = await dio.get(url);
      print('Raw Response Data: ${response.data}');

      if (response.statusCode == 200) {
        if (response.data != null && response.data['genres'] != null) {
          return ApiResponseGenre.fromJson(response.data);
        } else {
          throw Exception('Missing or null "genres" field in the response');
        }
      } else {
        throw Exception('Failed to get genre list: ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = 'Unknown Dio Error';

      if (e.response != null) {
        errorMessage =
            'DioException: ${e.response?.statusCode} - ${e.response?.data}';
      } else if (e.type == DioExceptionType.connectionTimeout) {
        errorMessage = 'Connection Timeout Error: ${e.message}';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        errorMessage = 'Receive Timeout Error: ${e.message}';
      } else if (e.type == DioExceptionType.cancel) {
        errorMessage = 'Request Canceled: ${e.message}';
      } else {
        errorMessage = 'DioException: ${e.message}';
      }

      throw Exception('Error getting genre list: $errorMessage');
    } catch (e) {
      throw Exception('Error getting genre list: $e');
    }
  }

  @override
  Future<Result<AccountDetails>> fetchAccountDetails(String sessionId) async {
    final String url = '$baseUrl/account?api_key=$apiKey&session_id=$sessionId';
    try {
      final response = await dio.get(url);
      print('Raw Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        _log.fine(jsonResponse);

        if (jsonResponse is! Map<String, dynamic>) {
          return Result.error(Exception('Invalid response format'));
        }

        try {
          final accountDetails = AccountDetails.fromJson(jsonResponse);
          _log.fine('Parsed account details: ${accountDetails.toJson()}');
          return Result.ok(accountDetails);
        } catch (parseError) {
          _log.severe('Error parsing account details: $parseError');
          return Result.error(
              Exception('Failed to parse account details: $parseError'));
        }
      } else {
        _log.severe('HTTP Error: ${response.statusCode}');
        return Result.error(Exception('HTTP Error: ${response.statusCode}'));
      }
    } catch (e) {
      _log.warning('Network error: $e');
      return Result.error(Exception('Network error: $e'));
    }
  }

  @override
  Future<Result<ApiResponse<dynamic>>> fetchSearch(
      String query, int page) async {
    final String url =
        '$baseUrl/search/multi?api_key=$apiKey&query=$query&page=$page';
    try {
      final response = await dio.get(url);
      print('Raw Response Data: ${response.data}');

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        _log.fine(jsonResponse);
        return Result.ok(ApiResponse<dynamic>.fromJson(
          jsonResponse,
          (json) => json,
        ));
      } else {
        return Result.error(Exception(
            'Failed to fetch search results: ${response.statusCode}'));
      }
    } catch (e) {
      _log.warning(e);
      return Result.error(Exception('$e'));
    }
  }

  @override
  Future<ApiPostResponse> addToFavourites({
    required String sessionId,
    required int accountId,
    required int mediaId,
    required String mediaType,
    required bool isFavourite,
  }) async {
    final String url =
        '$baseUrl/account/$accountId/favorite?api_key=$apiKey&session_id=$sessionId';

    final Map<String, dynamic> body = {
      'media_type': mediaType,
      'media_id': mediaId,
      'favorite': isFavourite,
    };

    try {
      final response = await dio.post(
        url,
        data: jsonEncode(body),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        _log.fine(response.data);
        return ApiPostResponse.fromJson(response.data);
      } else {
        _log.severe(response.data);
        return ApiPostResponse.fromJson(response.data);
      }
    } catch (e) {
      _log.warning(e);
      return ApiPostResponse.fromJson(e as Map<String, dynamic>);
    }
  }

  @override
  Future<Result<bool>> isItemFavourites(
      {required String sessionId,
      required int mediaId,
      required String mediaType}) async {
    final String url =
        '$baseUrl/$mediaType/$mediaId/account_states?api_key=$apiKey&session_id=$sessionId';
    try {
      final response = await dio.get(url);
      print('Raw Response Data: ${response.data}');
      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        _log.fine(jsonResponse);
        return Result.ok(jsonResponse['favorite'] as bool);
      } else {
        _log.severe(response.data);
        return Result.error(Exception('Failed to check if item is favourites'));
      }
    } catch (e) {
      _log.warning(e);
      return Result.error(Exception('$e'));
    }
  }

  @override
  Future<Result<ApiResponse<Movies>>> fetchFavouritesMovies(
      {int? page, required String sessionId, required int accountId}) async {
    final String url =
        '$baseUrl/account/$accountId/favorite/movies?api_key=$apiKey&session_id=$sessionId&page=$page';

    try {
      final response = await dio.get(url);
      _log.finer('raw json(favourites movies): ${response.data}');
      if (response.statusCode == 200) {
        return Result.ok(ApiResponse<Movies>.fromJson(
          response.data,
          (json) => Movies.fromJson(json as Map<String, dynamic>),
        ));
      } else {
        return Result.error(
            'Failed to load popular tv shows data' as Exception);
      }
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<ApiResponse<TvShows>>> fetchFavouritesTvShows(
      {int? page, required String sessionId, required int accountId}) async {
    final String url =
        '$baseUrl/account/$accountId/favorite/tv?api_key=$apiKey&session_id=$sessionId&page=$page';

    try {
      final response = await dio.get(url);
      _log.finer('raw json(favourites tv): ${response.data}');
      if (response.statusCode == 200) {
        return Result.ok(ApiResponse<TvShows>.fromJson(
          response.data,
          (json) => TvShows.fromJson(json as Map<String, dynamic>),
        ));
      } else {
        return Result.error(
            'Failed to load popular tv shows data' as Exception);
      }
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }

  @override
  Future<Result<ApiResponseVideos>> fetchMovieVideos({required int id}) async  {
    final String url = '$baseUrl/movie/$id/videos?api_key=$apiKey';
    try {
      final response = await dio.get(url);
      _log.finer('raw json(movie videos): ${response.data}');
      if (response.statusCode == 200) {
        return Result.ok(
          ApiResponseVideos.fromJson(
            response.data,
          ),
        );
      } else {
        return Result.error(Exception('Failed to fetch movie videos'));
      }
    } catch (e) {
      return Result.error(Exception('$e'));
    }
  }

  @override
  Future<Result<ApiResponseVideos>> fetchTvShowsVideos({required int id}) async {
    final String url = '$baseUrl/tv/$id/videos?api_key=$apiKey';
    try {
      final response = await dio.get(url);
      _log.finer('raw json(tv shows videos): ${response.data}');
      if (response.statusCode == 200) {
        return Result.ok(
          ApiResponseVideos.fromJson(
            response.data,
          ),
        );
      } else {
        return Result.error(Exception('Failed to fetch tv shows videos'));
      }
    } catch (e) {
      return Result.error(Exception('$e'));
    }
  }
}
