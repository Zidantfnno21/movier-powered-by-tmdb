import '../../../utils/result.dart';
import '../../local/databases/entity/movies.dart';

abstract class MoviesRepository{
  Future<Result<List<Movies>>> fetchMovies(int page, String filter);
}