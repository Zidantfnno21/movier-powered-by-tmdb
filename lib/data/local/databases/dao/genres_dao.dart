
import 'package:floor/floor.dart';

import '../entity/genres.dart';

@dao
abstract class GenresDao{
  @Query('SELECT name FROM genres WHERE id = :id ')
  Future<Genres?> findGenreNameByGenreIds(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGenres(Genres genres);

  @Query('DELETE FROM genres')
  Future<void> deleteAllGenres();
}