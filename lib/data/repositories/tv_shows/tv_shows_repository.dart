import 'package:the_movie_databases/data/local/databases/entity/tv_shows.dart';
import 'package:the_movie_databases/utils/result.dart';


abstract class TvShowsRepository{
  Future<Result<List<TvShows>>> fetchTvShows(int page);
  Future<void> insertTvShowsToDb(List<TvShows> moviesList);
  Future<List<TvShows>> fetchTvShowsFromDb();
}