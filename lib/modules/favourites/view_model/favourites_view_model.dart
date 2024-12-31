import 'package:flutter/foundation.dart';
import 'package:the_movie_databases/data/repositories/favourites/favourites_repository.dart';

import '../../../data/local/databases/entity/movies.dart';
import '../../../data/local/databases/entity/tv_shows.dart';
import '../../../utils/result.dart';

class FavouritesViewModel with ChangeNotifier {
  FavouritesViewModel({
    required FavouritesRepository favouritesRepository,
  }) : _favouritesRepository = favouritesRepository;

  final FavouritesRepository _favouritesRepository;

  List<Movies> _listOfFavouritesMovies = [];
  List<TvShows> _listOfFavouritesTvShows = [];

  bool _isMoviesLoading = false;
  bool _isTvShowsLoading = false;
  
  bool _isMoviesLoadingMore = false;
  bool _isTvShowsLoadingMore = false;

  int _currentPage = 1;
  int _currentTvShowsPage = 1;

  List<Movies> get listOfFavouritesMovies => _listOfFavouritesMovies;
  List<TvShows> get listOfFavouritesTvShows => _listOfFavouritesTvShows;
  bool get isMoviesLoading => _isMoviesLoading;
  bool get isTvShowsLoading => _isTvShowsLoading;
  bool get isMoviesLoadingMore => _isMoviesLoadingMore;
  bool get isTvShowsLoadingMore => _isTvShowsLoadingMore;

  Future<void> fetchFavourites() async {
    await Future.wait([
      fetchFavouritesMovies(),
      fetchFavouritesTvShows(),
    ]);
  }

  Future<Result<void>> fetchFavouritesMovies() async {
    _isMoviesLoading = true;
    notifyListeners();

    try {
      _currentPage = 1;
      _listOfFavouritesMovies.clear();

      final response =
          await _favouritesRepository.fetchFavouritesMovies(page: _currentPage);

      if (response is Ok<List<Movies>>) {
        _listOfFavouritesMovies = response.value;
        _isMoviesLoading = false;
        notifyListeners();
        return response;
      }

      _isMoviesLoading = false;
      notifyListeners();
      return Result.error(Exception('Error when fetch favorites movies'));
    } catch (e) {
      _isMoviesLoading = false;
      notifyListeners();
      return Result.error(Exception(e.toString()));
    }
  }

  Future<void> refreshFavouritesMovies() async {
    clearListsMovies();
    await fetchFavouritesMovies();
  }

  Future<Result<void>> loadMoreMovies() async {
    _isMoviesLoadingMore = true;
    notifyListeners();

    try{
      final nextPage = _currentPage + 1;
      final response = await _favouritesRepository.fetchFavouritesMovies(page: nextPage);

      if (response is Ok<List<Movies>>) {
        if (response.value.isEmpty) {
          _isMoviesLoadingMore = false;
          notifyListeners();
          return response;
        }

        final newMovies = response.value.where(
          (newMovie) => !_listOfFavouritesMovies.any((existing) => existing.id == newMovie.id)
        ).toList();
        
        if (newMovies.isNotEmpty) {
          _listOfFavouritesMovies.addAll(newMovies);
          _currentPage = nextPage;
        }
        
        _isMoviesLoadingMore = false;
        notifyListeners();
        return response;
      }

      _isMoviesLoadingMore = false;
      notifyListeners();
      return Result.error(Exception('Error when loading more favorites movies'));
    } catch (e) {
      _isMoviesLoadingMore = false;
      notifyListeners();
      return Result.error(Exception(e.toString()));
    }
    }
  

  Future<void> refreshFavouritesTvShows() async {
    clearListsTvShows();
    await fetchFavouritesTvShows();
  }

  Future<Result<void>> fetchFavouritesTvShows() async {
    _isTvShowsLoading = true;
    notifyListeners();

    try{
      final response = await _favouritesRepository.fetchFavouritesTvShows(page: _currentTvShowsPage);

      if(response is Ok<List<TvShows>>){
        _listOfFavouritesTvShows = response.value;
        _isTvShowsLoading = false;
        notifyListeners();
        return response;
      }

      _isTvShowsLoading = false;
      notifyListeners();
      return Result.error(Exception('Error when fetch favorites tv shows'));
    } catch (e) {
      _isTvShowsLoading = false;
      notifyListeners();
      return Result.error(Exception(e.toString()));
    }
  }

  Future<Result<void>> loadMoreTvShows() async {
    _isTvShowsLoadingMore = true;
    notifyListeners();

    try{  
      final nextPage = _currentTvShowsPage + 1;
      final response = await _favouritesRepository.fetchFavouritesTvShows(page: nextPage);

      if(response is Ok<List<TvShows>>){
        if(response.value.isEmpty){
          _isTvShowsLoadingMore = false;
          notifyListeners();
          return response;
        }

        final newTvShows = response.value.where(
          (newTvShow) => !_listOfFavouritesTvShows.any((existing) => existing.id == newTvShow.id)
        ).toList();

        if(newTvShows.isNotEmpty){
          _listOfFavouritesTvShows.addAll(newTvShows);
          _currentTvShowsPage = nextPage;
        }

        _isTvShowsLoadingMore = false;
        notifyListeners();
        return response;
      }

      _isTvShowsLoadingMore = false;
      notifyListeners();
      return Result.error(Exception('Error when loading more favorites tv shows'));
    } catch (e) {
      _isTvShowsLoadingMore = false;
      notifyListeners();
      return Result.error(Exception(e.toString()));
    }
  }

  void clearListsMovies() {
    _listOfFavouritesMovies.clear();
    _currentPage = 1;
    notifyListeners();
  }

  void clearListsTvShows() {
    _listOfFavouritesTvShows.clear();
    _currentTvShowsPage = 1;
    notifyListeners();
  }
}
