import 'package:flutter/widgets.dart';
import 'package:the_movie_databases/data/repositories/tv_shows/tv_shows_repository.dart';
import 'package:the_movie_databases/utils/constant.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../../data/local/databases/entity/tv_shows.dart';

class TvShowsViewModel with ChangeNotifier {
  TvShowsViewModel({
    required TvShowsRepository tvShowRepos,
  }) : _tvShowsRepository = tvShowRepos;

  final TvShowsRepository _tvShowsRepository;

  List<TvShows> _tvShows = [];
  String _selectedFilter = Constant.tvFilter[0]['value']!;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMore = true;
  int _currentPage = 1;

  List<TvShows> get tvShows => _tvShows;
  String get selectedFilter => _selectedFilter;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;

  void updateSelectedFilter(String selectedFilter) {
    _selectedFilter = selectedFilter;
    notifyListeners();
    fetchTvShows(isRefresh: true);
  }

  Future<Result<void>> fetchTvShows({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      _tvShows.clear();
    }

    _isLoading = true;
    notifyListeners();

    final response = await _tvShowsRepository.fetchTvShows(_currentPage, _selectedFilter);

    if (response is Ok<List<TvShows>>) {
      if (response.value.isNotEmpty) {
        _tvShows = response.value;
      }
    }

    _isLoading = false;
    notifyListeners();

    return response;
  }

  Future<Result<void>> loadMoreTvShows() async {
    if (!_hasMore || _isLoadingMore) return const Result.ok(null);

    _isLoadingMore = true;
    notifyListeners();

    final nextPage = _currentPage + 1;
    final response = await _tvShowsRepository.fetchTvShows(nextPage, _selectedFilter);

    if (response is Ok<List<TvShows>>) {
      if (response.value.isNotEmpty) {
        final newShows = response.value
            .where((newShow) =>
                !_tvShows.any((existing) => existing.id == newShow.id))
            .toList();

        if (newShows.isNotEmpty) {
          _tvShows.addAll(newShows);
          _currentPage = nextPage;
        }else if (newShows.isEmpty){
          _hasMore = false;
        }
      }
    }

    _isLoadingMore = false;
    notifyListeners();
    return response;
  }

  void refresh() {
    fetchTvShows(isRefresh: true);
  }
}
