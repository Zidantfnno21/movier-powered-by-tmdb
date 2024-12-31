import 'package:floor/floor.dart';

import '../entity/trending.dart';

@dao
abstract class TrendingDao{
  @Query('SELECT * FROM trending')
  Future<List<Trending>> getAllTrending();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTrending(Trending trending);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTrending(Trending trending);

  @Query('DELETE FROM trending')
  Future<void> deleteAllTrending();
}