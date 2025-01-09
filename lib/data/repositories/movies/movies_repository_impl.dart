import 'package:logging/logging.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client.dart';

import '../../../utils/result.dart';
import '../../local/databases/app_databases.dart';
import '../../local/databases/entity/movies.dart';
import '../../network/response/api_response.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final TmdbClient _tmdbClient;
  final AppDatabases _appDatabases;
  final _log = Logger('TvShowsRepositoryImpl');

  MoviesRepositoryImpl({required tmdbClient, required appDatabases}) : _tmdbClient = tmdbClient, _appDatabases = appDatabases;

  Future<void> insertMoviesToDb(List<Movies> moviesList) async {
    await _appDatabases.moviesDao.deleteAllMovies();
    for (var movie in moviesList) {
      await _appDatabases.moviesDao.insertMovies(movie);
    }
  }

  Future<List<Movies>> fetchMoviesFromDb() async {
    try{
      final movies = await _appDatabases.moviesDao.getAllMovies();
      return movies;
    } catch (e) {
      throw Exception('Error fetching movies from DB: $e');
    }
  }

  @override
  Future<Result<List<Movies>>> fetchMovies(int page, String filter) async {
    try {
      final response = await _tmdbClient.fetchMovies(page, filter);

      if (response is Ok<ApiResponse<Movies>>) {
        _log.info('Fetched ${response.value.results.length} tv shows');
        await insertMoviesToDb(response.value.results);
      }
      final movies = await fetchMoviesFromDb();
      _log.info('Fetched ${movies.length} tv shows from DB');
      return Result.ok(movies);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
