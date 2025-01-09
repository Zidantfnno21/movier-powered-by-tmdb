import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:the_movie_databases/utils/constant.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../../data/local/databases/entity/movies.dart';
import '../../../data/repositories/movies/movies_repository.dart';

class MoviesViewModel with ChangeNotifier {
  MoviesViewModel({required moviesRepository})
      : _moviesRepository = moviesRepository;

  final MoviesRepository _moviesRepository;

  final _log = Logger('MoviesViewModel');

  List<Movies> _movies = [];
  String _selectedFilter = Constant.movieFilter[0]['value']!;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _currentPage = 1;

  List<Movies> get movies => _movies;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  String get selectedFilter => _selectedFilter;
  bool get hasMore => _hasMore;

  void updateSelectedFilter(String selectedFilter) {
    _selectedFilter = selectedFilter;
    notifyListeners();
    fetchMovies(isRefresh: true);
  }

  Future<void> fetchMovies({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      _movies.clear();
      _hasMore = true;
    }

    if (!_hasMore || _isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final response = await _moviesRepository.fetchMovies(_currentPage, _selectedFilter);

      if (response is Ok<List<Movies>>) {
        if(response.value.isNotEmpty){
          _log.info('Movies fetched successfully: ${response.value}');
          _movies = response.value;
        }
      } else if (response is Error<List<Movies>>) {
        _log.severe('Error fetching movies data view model: ${response.error}');
      }
    } catch (e) {
      _log.severe('Error fetching popular movies data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    fetchMovies(isRefresh: true);
  }

  Future<void> loadMore() async {
    if (!_hasMore||_isLoadingMore) return;

    _isLoadingMore = true;
    notifyListeners();

    final nextPage = _currentPage + 1;
    try {
      final response = await _moviesRepository.fetchMovies(nextPage, _selectedFilter);
      if (response is Ok<List<Movies>>) {
        final newResponse = response.value.where((newResponse) =>
        !_movies.any((existing) => existing.id == newResponse.id))
            .toList();

        if (newResponse.isNotEmpty) {
          _movies.addAll(newResponse);
          _currentPage = nextPage;
        }else if (newResponse.isEmpty){
          _hasMore = false;
        }
      } else if (response is Error<List<Movies>>) {
        _log.severe(
            'Error fetching loadmore movies data view model: ${response.error}');
      }
    } catch (e) {
      _log.severe("Error loading more movies: $e");
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }
}
