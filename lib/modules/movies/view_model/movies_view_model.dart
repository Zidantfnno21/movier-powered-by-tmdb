
import 'package:flutter/material.dart';
import 'package:the_movie_databases/data/local/databases/app_databases.dart';
import 'package:the_movie_databases/data/network/response/api_response.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../../data/local/databases/entity/movies.dart';
import '../../../data/network/service/tmdb_client.dart';
import '../../../data/network/service/tmdb_client_impl.dart';

class MoviesViewModel with ChangeNotifier {
  late final TmdbClient tmdbClient;

  MoviesViewModel() {
    tmdbClient = TmdbClientImpl();
  }

  final List<Movies> _movies = [];
  bool _isLoading = false;
  bool _hasMore = false;
  int _currentPage = 1;

  List<Movies> get movies => _movies;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  Future<void> fetchMovies({int page = 1}) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await tmdbClient.fetchPopularMovies(page);

      if(response is Ok<ApiResponse<Movies>>){
        await insertMoviesToDb(response.value.results);
      }else if(response is Error<ApiResponse<Movies>>){
        print('Error fetching movies data view model: ${response.error}');
        await getMoviesFromDb();
      }
    } catch (e) {
      await getMoviesFromDb();
      print('Error fetching popular movies data: $e');
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    _isLoading = true;
    notifyListeners();
    _currentPage = 1;
    _hasMore = true;
    _movies.clear();
    fetchMovies(page: _currentPage);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMore() async {
    if (_isLoading) return;

    notifyListeners();

    int nextPage = _currentPage + 1;
    try {
      final response = await tmdbClient.fetchPopularMovies(nextPage);
      _currentPage = nextPage;
      if(response is Ok<ApiResponse<Movies>>){
        if(response.value.results.isNotEmpty){
          insertMoviesToDb(response.value.results);
        }
      }else if(response is Error<ApiResponse<Movies>>){
        getMoviesFromDb();
        print('Error fetching loadmore movies data view model: ${response.error}');
      }

    } catch (e) {
      print("Error loading more movies: $e");
    } finally {
      notifyListeners();
    }
  }

  Future<void> insertMoviesToDb(List<Movies> moviesList) async {
    final database =
        await $FloorAppDatabases.databaseBuilder('app_database.db').build();

    for (var movie in moviesList) {
      await database.moviesDao.insertMovies(movie);
    }
    getMoviesFromDb();
  }

  Future<void> getMoviesFromDb() async {
    try {
      final database =
          await $FloorAppDatabases.databaseBuilder('app_database.db').build();
      final movies = await database.moviesDao.getAllMovies();
      final existingIds = _movies.map((movie) => movie.id).toSet();
      final uniqueMovies = movies.where((movie) => !existingIds.contains(movie.id)).toList();
      _movies.addAll(uniqueMovies);
      notifyListeners();
    } catch (e) {
      print('Error fetching popular movies data from DB: $e');
    }
  }
}
