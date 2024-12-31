import 'package:logging/logging.dart';
import 'package:the_movie_databases/data/local/databases/entity/tv_shows.dart';
import 'package:the_movie_databases/data/network/response/api_response.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client.dart';
import 'package:the_movie_databases/data/repositories/tv_shows/tv_shows_repository.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../local/databases/app_databases.dart';


class TvShowsRepositoryImpl implements TvShowsRepository{
  TvShowsRepositoryImpl({
    required TmdbClient tmdbClient
}) : _tmdbClient = tmdbClient;

  final TmdbClient _tmdbClient;
  final _log = Logger('TvShowsRepositoryImpl');

  @override
  Future<Result<List<TvShows>>> fetchTvShows (int page) async {
    try{
      final response = await _tmdbClient.fetchPopularTvShows(page);
      
      if(response is Ok<ApiResponse<TvShows>>){
        _log.info('Fetched ${response.value.results.length} tv shows');
        await insertTvShowsToDb(response.value.results);
      }
      final tvShows = await fetchTvShowsFromDb();
      _log.info('Fetched ${tvShows.length} tv shows from DB');
      return Result.ok(tvShows);
    }catch(e){
     throw Exception('Error fetching tvShows repositories: $e');
    }
  }

  @override
  Future<List<TvShows>> fetchTvShowsFromDb() async {
    try {
      final database = await $FloorAppDatabases.databaseBuilder('app_database.db').build();
      final tvShows = await database.tvShowsDao.getAllTvShows();
      return tvShows;
    } catch (e) {
      throw Exception('Error fetching tv shows from DB: $e');
    }
  }

  @override
  Future<void> insertTvShowsToDb(List<TvShows> tvShowList) async {
    final database = await $FloorAppDatabases.databaseBuilder('app_database.db').build();
    for (var tvShow in tvShowList) {
      await database.tvShowsDao.insertTvShows(tvShow);
    }
  }

}