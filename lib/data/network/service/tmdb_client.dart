
import 'package:the_movie_databases/utils/result.dart';

import '../../local/databases/entity/account/account_details.dart';
import '../../local/databases/entity/movies.dart';
import '../../local/databases/entity/people.dart';
import '../../local/databases/entity/trending.dart';
import '../../local/databases/entity/tv_shows.dart';
import '../response/api_response.dart';
import '../videos.dart';

typedef SessionIdsProvider = String? Function();

abstract class TmdbClient{
  SessionIdsProvider? sessionIdsProvider;

  setSessionIdsProvider(SessionIdsProvider provider) {
    sessionIdsProvider = provider;
  }

  Future<Result<ApiResponse<Trending>>> fetchTrending(String timeWindow);
  Future<Result<ApiResponse<Movies>>> fetchPopularMovies(int page);
  Future<Result<ApiResponse<TvShows>>> fetchPopularTvShows(int page);
  Future<Result<ApiResponse<People>>> fetchPeople(int page);
  Future<ApiResponseGenre> fetchMovieGenre();
  Future<ApiResponseGenre> fetchTvShowsGenre();
  Future<Result<AccountDetails>> fetchAccountDetails(String sessionId);
  Future<Result<ApiResponse<dynamic>>> fetchSearch(String query, int page);
  Future<ApiPostResponse> addToFavourites({
    required String sessionId,
    required int accountId,
    required int mediaId,
    required String mediaType,
    required bool isFavourite,
  });
  Future<Result<bool>> isItemFavourites({
   required String sessionId,
    required int mediaId,
    required String mediaType
});
  Future<Result<ApiResponse<Movies>>> fetchFavouritesMovies({int? page, required String sessionId, required int accountId});
  Future<Result<ApiResponse<TvShows>>> fetchFavouritesTvShows({int? page,required String sessionId, required int accountId});
  Future<Result<ApiResponseVideos>> fetchMovieVideos({required int id});
  Future<Result<ApiResponseVideos>> fetchTvShowsVideos({required int id});
}