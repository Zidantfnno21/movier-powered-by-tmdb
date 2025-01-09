import 'package:logging/logging.dart';
import 'package:the_movie_databases/data/network/model/details_people/details_people.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client.dart';
import 'package:the_movie_databases/data/repositories/details/details_repository.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../network/model/details_movie/details_movies.dart';
import '../../network/model/details_tv_shows/details_tv_shows.dart';

class DetailsRepositoryImpl implements DetailsRepository {
  DetailsRepositoryImpl({required TmdbClient tmdbClient})
      : _tmdbClient = tmdbClient;

  final TmdbClient _tmdbClient;
  final _log = Logger('DetailsRepositoryImpl');

  @override
  Future<Result<DetailsMovies>> fetchMovieDetails(int id) async {
    try {
      _log.finer('Fetching movie details for id: $id');
      final response = await _tmdbClient.fetchMovieDetails(id);
      _log.finer('Raw response: $response');

      try {
        if (response is Ok<DetailsMovies>) {
          final details = response.value;
          _log.finer('Successfully parsed movie details');
          return Result.ok(details);
        } else {
          return Result.error(Exception('Failed to fetch movie details'));
        }
      } catch (parseError) {
        _log.warning('JSON parsing error: $parseError');
        return Result.error(
            Exception('Failed to parse movie details: $parseError'));
      }
    } catch (e) {
      _log.severe('Error fetching movie details: $e');
      return Result.error(Exception('Failed to fetch movie details: $e'));
    }
  }

  @override
  Future<Result<DetailsTvShows>> fetchTvShowsDetails(int id) async {
    try {
      _log.finer('Fetching tv shows details for id: $id');
      final response = await _tmdbClient.fetchTvShowsDetails(id);
      _log.finer('Raw response: $response');

      try {
        if (response is Ok<DetailsTvShows>) {
          final details = response.value;
          _log.finer('Successfully parsed tv shows details');
          return Result.ok(details);
        } else {
          return Result.error(Exception('Failed to fetch tv shows details'));
        }
      } catch (e) {
        _log.warning('Error fetching tv shows details: $e');
        return Result.error(Exception('Failed to fetch tv shows details: $e'));
      }
    } catch (e) {
      _log.severe('Error fetching tv shows details: $e');
      return Result.error(Exception('Failed to fetch tv shows details: $e'));
    }
  }

  @override
  Future<Result<DetailsPeople>> fetchPeopleDetails(int id) async {
    try {
      _log.finer('Fetching people details for id: $id');
      final response = await _tmdbClient.fetchPeopleDetails(id);
      _log.finer('Raw response: $response');

      if (response is Ok<DetailsPeople>) {
        final details = response.value;
        _log.finer('Successfully parsed people details');
        return Result.ok(details);
      } else {
        return Result.error(Exception('Failed to fetch people details'));
      }
    } catch (e) {
      _log.severe('Error fetching people details: $e');
      return Result.error(Exception('Failed to fetch people details: $e'));
    }
  }

  // @override
  // Future<void> fetchGenres() async {
  //   final movieResponse = await _tmdbClient.fetchMovieGenre();
  //   final tvResponse = await _tmdbClient.fetchTvShowsGenre();
  //   insertGenreToDb(movieResponse.genreList);
  //   insertGenreToDb(tvResponse.genreList);
  // }

  // @override
  // Future<Genres?> findNameById(int id) async {
  //   final database =
  //       await $FloorAppDatabases.databaseBuilder('app_database.db').build();
  //   final name = database.genresDao.findGenreNameByGenreIds(id);
  //   return name;
  // }

  // @override
  // Future<void> insertGenreToDb(List<Genres> genreList) async {
  //   final database =
  //       await $FloorAppDatabases.databaseBuilder('app_database.db').build();
  //   for (var genres in genreList) {
  //     await database.genresDao.insertGenres(genres);
  //   }
  // }

  // @override
  // Future<Result<List<Video>>> fetchMovieVideos(int id) async {
  //   final result = await _tmdbClient.fetchMovieVideos(id: id);
  //   if (result is Ok<ApiResponseVideos>) {
  //     return Result.ok(result.value.results);
  //   } else {
  //     return Result.error(Exception('Failed to fetch movie videos'));
  //   }
  // }

  // @override
  // Future<Result<List<Video>>> fetchTvShowsVideos(int id) async {
  //   final result = await _tmdbClient.fetchTvShowsVideos(id: id);
  //   if (result is Ok<ApiResponseVideos>) {
  //     return Result.ok(result.value.results);
  //   } else {
  //     return Result.error(Exception('Failed to fetch tv shows videos'));
  //   }
  // }
}
