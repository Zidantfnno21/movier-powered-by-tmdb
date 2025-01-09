import 'package:flutter/material.dart';

import '../../../data/local/databases/entity/movies.dart';
import '../../../data/local/databases/entity/people.dart';
import '../../../data/local/databases/entity/tv_shows.dart';
import '../../../data/network/response/api_response.dart';
import '../../../data/repositories/search/search_repository.dart';
import '../../../utils/result.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository _searchRepository;

  SearchViewModel(this._searchRepository);

  List<dynamic> _searchResults = [];
  List<Map<String, String>> _suggestionResults = [];
  bool _isLoading = false;
  String _query = '';
  String _lastQuery = '';
  int _currentPage = 1;

  List<dynamic> get searchResults => _searchResults;
  List<Map<String, String>> get suggestionResults => _suggestionResults;
  bool get isLoading => _isLoading;
  String get query => _query;
  String get lastQuery => _lastQuery;

  Future<Result<ApiResponse<dynamic>>> fetchSearch(
      String query, int page) async {
    return await _searchRepository.fetchSearch(query, page);
  }

  void restoreSearchResults(List<dynamic> savedResults) {
    _searchResults = savedResults;
    notifyListeners();
  }

  void clearResults() {
    _searchResults = [];
    _suggestionResults = [];
    _lastQuery = '';
    notifyListeners();
  }

  void setQuery(String query) {
    _query = query;
    notifyListeners();
  }

  Future<List<Map<String, String>>> suggestion(String query) async {
    try {
      final result = await fetchSearch(query, 1);
      if (result is Ok<ApiResponse<dynamic>>) {
        _suggestionResults = result.value.results.map<Map<String, String>>((item) {
          final mediaType = item['media_type'] as String? ?? 'unknown';
          final nameOrTitle = mediaType == 'movie'
              ? item['title'] as String? ?? 'Unknown Movie'
              : mediaType == 'tv'
              ? item['name'] as String? ?? 'Unknown TV Show'
              : mediaType == 'person'
              ? item['name'] as String? ?? 'Unknown Person'
              : 'Unknown';
          return {
            'name': nameOrTitle,
            'media_type': mediaType,
          };
        }).toList();
      }
    } catch (e) {
      print('Error fetching suggestions: $e');
    }

    return [];
  }


  Future<Iterable<dynamic>> search(String query) async {
    _isLoading = true;
    _lastQuery = query;
    _currentPage = 1;
    notifyListeners();

    final result = await fetchSearch(query, _currentPage);

    if (result is Ok<ApiResponse<dynamic>>) {
      if (_currentPage == 1) {
        _searchResults = result.value.results;
        _lastQuery = query;
      } else {
        _searchResults.addAll(result.value.results);
      }
      _query = query;
      _isLoading = false;
      notifyListeners();
      return _searchResults;
    }

    if (result is Error<ApiResponse<dynamic>>) {
      _isLoading = false;
      notifyListeners();
      throw Exception(Result.error(result.error));
    }

    _isLoading = false;
    notifyListeners();
    return [];
  }

  void loadMore() {
    if (!_isLoading && _query.isNotEmpty) {
      fetchSearch(_query, _currentPage + 1).then((result) {
        if (result is Ok<ApiResponse<dynamic>>) {
          _searchResults.addAll(result.value.results);
          _currentPage++;
        }
        notifyListeners();
      });
    }
  }

  Movies convertToMovie(Map<String, dynamic> item) {
    return Movies(
      id: item['id'],
      title: item['title'] ?? '',
      overview: item['overview'] ?? '',
      posterPath: item['poster_path'] ?? '',
      releaseDate: item['release_date'] ?? '',
      voteAverage: (item['vote_average'] ?? 0.0).toDouble(),
      voteCount: item['vote_count'] ?? 0,
      popularity: (item['popularity'] ?? 0.0).toDouble(),
      genreIds: List<int>.from(item['genre_ids'] ?? []),
      adult: item['adult'] ?? false,
      backdropPath: item['backdrop_path'] ?? '',
      originalLanguage: item['original_language'] ?? '',
      originalTitle: item['original_title'] ?? '',
      video: item['video'] ?? false,
    );
  }

  TvShows convertToTvShow(Map<String, dynamic> item) {
    return TvShows(
      id: item['id'],
      name: item['name'] ?? '',
      overview: item['overview'] ?? '',
      posterPath: item['poster_path'] ?? '',
      firstAirDate: item['first_air_date'] ?? '',
      voteAverage: (item['vote_average'] ?? 0.0).toDouble(),
      voteCount: item['vote_count'] ?? 0,
      popularity: (item['popularity'] ?? 0.0).toDouble(),
      genreIds: List<int>.from(item['genre_ids'] ?? []),
      adult: false,
      backdropPath: item['backdrop_path'] ?? '',
      originalLanguage: item['original_language'] ?? '',
      originalName: item['original_name'] ?? '',
    );
  }

  People convertToPerson(Map<String, dynamic> item) {
    return People(
      id: item['id'],
      name: item['name'] ?? '',
      profilePath: item['profile_path'] ?? '',
      knownForDepartment: item['known_for_department'] ?? '',
      gender: item['gender'] ?? 0,
      popularity: (item['popularity'] ?? 0.0).toDouble(),
      adult: false,
      originalName: item['original_name'] ?? '',
    );
  }
}
