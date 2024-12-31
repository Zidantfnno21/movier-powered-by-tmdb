import 'package:the_movie_databases/data/local/databases/app_databases.dart';
import 'package:the_movie_databases/data/local/databases/entity/genres.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client.dart';
import 'package:the_movie_databases/data/network/videos.dart';
import 'package:the_movie_databases/data/repositories/details/details_repository.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../network/response/api_response.dart';

class DetailsRepositoryImpl implements DetailsRepository {
  DetailsRepositoryImpl({required TmdbClient tmdbClient})
      : _tmdbClient = tmdbClient;

  final TmdbClient _tmdbClient;

  @override
  Future<void> fetchGenres() async {
    final movieResponse = await _tmdbClient.fetchMovieGenre();
    final tvResponse = await _tmdbClient.fetchTvShowsGenre();
    insertGenreToDb(movieResponse.genreList);
    insertGenreToDb(tvResponse.genreList);
  }

  @override
  Future<Genres?> findNameById(int id) async {
    final database =
        await $FloorAppDatabases.databaseBuilder('app_database.db').build();
    final name = database.genresDao.findGenreNameByGenreIds(id);
    return name;
  }

  @override
  Future<void> insertGenreToDb(List<Genres> genreList) async {
    final database =
        await $FloorAppDatabases.databaseBuilder('app_database.db').build();
    for (var genres in genreList) {
      await database.genresDao.insertGenres(genres);
    }
  }

  @override
  Future<Result<List<Videos>>> fetchMovieVideos(int id) async {
    final result = await _tmdbClient.fetchMovieVideos(id: id);
    if (result is Ok<ApiResponseVideos>) {
      return Result.ok(result.value.results);
    } else {
      return Result.error(Exception('Failed to fetch movie videos'));
    }
  }

  @override
  Future<Result<List<Videos>>> fetchTvShowsVideos(int id) async {
    final result = await _tmdbClient.fetchTvShowsVideos(id: id);
    if (result is Ok<ApiResponseVideos>) {
      return Result.ok(result.value.results);
    } else {
      return Result.error(Exception('Failed to fetch tv shows videos'));
    }
  }
}
