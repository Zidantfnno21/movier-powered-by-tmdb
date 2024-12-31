import 'package:the_movie_databases/data/local/databases/entity/people.dart';
import 'package:the_movie_databases/utils/result.dart';

abstract class PeopleRepository{
  Future<Result<List<People>>> fetchPeople({required int page});
  Future<void> insertPeopleToDb(List<People> peopleList);
  Future<List<People>> fetchPeopleFromDb();
}