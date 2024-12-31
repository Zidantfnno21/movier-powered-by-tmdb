import 'package:floor/floor.dart';

import '../entity/movies.dart';


@dao
abstract class MoviesDao{
  @Query('SELECT * FROM movies')
  Future<List<Movies>> getAllMovies();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateMovies(Movies movies);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovies(Movies movies);

  @Query('DELETE FROM movies')
  Future<void> deleteAllMovies();
}