import 'package:the_movie_databases/data/network/model/details_people/details_people.dart';

import '../../../utils/result.dart';
import '../../network/model/details_movie/details_movies.dart';
import '../../network/model/details_tv_shows/details_tv_shows.dart';

abstract class DetailsRepository {
  // Future<void> fetchGenres();
  // Future<Genres?> findNameById(int id);
  // Future<void> insertGenreToDb(List<Genres> genreList);
  // Future<Result<List<Video>>> fetchMovieVideos(int id);
  // Future<Result<List<Video>>> fetchTvShowsVideos(int id);
  Future<Result<DetailsMovies>> fetchMovieDetails(int id);
  Future<Result<DetailsTvShows>> fetchTvShowsDetails(int id);
  Future<Result<DetailsPeople>> fetchPeopleDetails(int id);
}
