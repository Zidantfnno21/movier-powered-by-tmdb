import 'package:floor/floor.dart';

import '../entity/tv_shows.dart';

@dao
abstract class TvShowsDao{
  @Query('SELECT * FROM tv_shows')
  Future<List<TvShows>> getAllTvShows();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTvShows(TvShows tvShows);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTvShows(TvShows tvShows);

  @Query('DELETE FROM tv_shows')
  Future<void> deleteAllTvShows();
}