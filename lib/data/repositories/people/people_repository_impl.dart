import 'package:the_movie_databases/data/local/databases/app_databases.dart';
import 'package:the_movie_databases/data/local/databases/entity/people.dart';
import 'package:the_movie_databases/data/network/response/api_response.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client.dart';
import 'package:the_movie_databases/data/repositories/people/people_repository.dart';
import 'package:the_movie_databases/utils/result.dart';

class PeopleRepositoryImpl implements PeopleRepository {
  PeopleRepositoryImpl(
      {required TmdbClient tmdbClient, required AppDatabases appDatabases})
      : _tmdbClient = tmdbClient,
        _appDatabases = appDatabases;

  final TmdbClient _tmdbClient;
  final AppDatabases _appDatabases;

  @override
  Future<Result<List<People>>> fetchPeople({required int page}) async {
    try {
      final response = await _tmdbClient.fetchPeople(page);
      if (response is Ok<ApiResponse<People>>) {
        await insertPeopleToDb(response.value.results);
      }
      final people = await fetchPeopleFromDb();
      return Result.ok(people);
    } catch (e) {
      throw Exception('Error fetching people repositories: $e');
    }
  }

  @override
  Future<List<People>> fetchPeopleFromDb() async {
    try {
      final people = await _appDatabases.peopleDao.getAllPeople();
      return people;
    } catch (e) {
      throw Exception('Error fetching tv shows from DB: $e');
    }
  }

  @override
  Future<void> insertPeopleToDb(List<People> peopleList) async {
    await _appDatabases.peopleDao.deleteAllPeople();
    for (var people in peopleList) {
      await _appDatabases.peopleDao.insertPeople(people);
    }
  }
}
