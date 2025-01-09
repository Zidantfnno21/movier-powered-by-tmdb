
import 'package:the_movie_databases/data/network/model/details_people/details_people.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../local/databases/entity/account/account_details.dart';
import '../../local/databases/entity/movies.dart';
import '../../local/databases/entity/people.dart';
import '../../local/databases/entity/trending.dart';
import '../../local/databases/entity/tv_shows.dart';
import '../model/details_movie/details_movies.dart';
import '../model/details_tv_shows/details_tv_shows.dart';
import '../response/api_response.dart';

typedef SessionIdsProvider = String? Function();
typedef IsoCountryCodeProvider = Map<String, String?> Function();

abstract class TmdbClient{
  SessionIdsProvider? sessionIdsProvider;
  IsoCountryCodeProvider? isoCountryCodeProvider;

  setSessionIdsProvider(SessionIdsProvider provider) {
    sessionIdsProvider = provider;
  }

  setIsoCountryCodeProvider(IsoCountryCodeProvider provider){
    isoCountryCodeProvider = provider;
  }

  Future<Result<ApiResponse<Trending>>> fetchTrending(String timeWindow);
  Future<Result<ApiResponse<Movies>>> fetchMovies(int page, String filter);
  Future<Result<ApiResponse<TvShows>>> fetchTvShows(int page, String filter);
  Future<Result<ApiResponse<People>>> fetchPeople(int page);
  Future<ApiResponseGenre> fetchMovieGenre();
  Future<ApiResponseGenre> fetchTvShowsGenre();
  Future<Result<AccountDetails>> fetchAccountDetails(String sessionId);
  Future<Result<DetailsMovies>> fetchMovieDetails(int id);
  Future<Result<DetailsTvShows>> fetchTvShowsDetails(int id);
  Future<Result<DetailsPeople>> fetchPeopleDetails(int id);
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