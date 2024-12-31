import 'package:the_movie_databases/data/local/databases/entity/movies.dart';
import 'package:the_movie_databases/data/local/databases/entity/tv_shows.dart';

import '../../../utils/result.dart';
import '../../network/response/api_response.dart';

abstract class FavouritesRepository {
  Future<ApiPostResponse> addToFavourites({
    required int accountId,
    required int mediaId,
    required String mediaType,
    required bool isFavourite,
  });
  Future<Result<bool>> isItemFavorites(
      {required int mediaId, required String mediaType});
  Future<Result<List<Movies>>> fetchFavouritesMovies({
    int page,
});
  Future<Result<List<TvShows>>> fetchFavouritesTvShows({
    int page,
});
}
