import 'package:floor/floor.dart';

import '../entity/people.dart';

@dao
abstract class PeopleDao{
  @Query('SELECT * FROM people')
  Future<List<People>> getAllPeople();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updatePeople(People people);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPeople(People people);

  @Query('DELETE FROM people')
  Future<void> deleteAllPeople();
}