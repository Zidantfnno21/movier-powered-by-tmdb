import '../../../utils/result.dart';
import '../../local/databases/entity/genres.dart';
import '../../network/videos.dart';

abstract class DetailsRepository {
  Future<void> fetchGenres();
  Future<Genres?> findNameById(int id);
  Future<void> insertGenreToDb(List<Genres> genreList);
  Future<Result<List<Videos>>> fetchMovieVideos(int id);
  Future<Result<List<Videos>>> fetchTvShowsVideos(int id);
}
