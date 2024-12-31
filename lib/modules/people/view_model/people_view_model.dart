import 'package:flutter/material.dart';
import 'package:the_movie_databases/data/local/databases/entity/tv_shows.dart';
import 'package:the_movie_databases/data/repositories/people/people_repository.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../../data/local/databases/entity/people.dart';

class PeopleViewModel with ChangeNotifier {
  PeopleViewModel({
    required PeopleRepository peopleRepository,
  }) : _peopleRepository = peopleRepository;

  final PeopleRepository _peopleRepository;

  List<People> _people = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  int _currentPage = 1;

  List<People> get people => _people;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;

  Future<Result<void>> fetchPeople({bool isRefresh = false}) async {
    _currentPage = 1;
    _isLoading = true;
    notifyListeners();

    if (isRefresh) {
      _currentPage = 1;
      _people.clear();
    }

    final response = await _peopleRepository.fetchPeople(page: _currentPage);

    if (response is Ok<List<People>>) {
      if (response.value.isNotEmpty) {
        _people = response.value;
      }
    }
    _isLoading = false;
    notifyListeners();

    return response;
  }

  Future<void> refreshPeople() async {
    await fetchPeople(isRefresh: true);
  }

  Future<Result<void>> loadMorePeople() async {
    _isLoadingMore = true;
    notifyListeners();

    final nextPage = _currentPage + 1;
    final response = await _peopleRepository.fetchPeople(page: nextPage);

    try {
      if (response is Ok<List<People>>) {

        if(response.value.isEmpty){
          _isLoadingMore = false;
          notifyListeners();
          return response;
        }

        final newPeople = response.value
            .where((newPeople) =>
                !_people.any((existing) => existing.id == newPeople.id))
            .toList();

        if (newPeople.isNotEmpty) {
          _people.addAll(newPeople);
          _currentPage = nextPage;
        }

        _isLoadingMore = false;
        notifyListeners();
        return response;
      }

      _isLoadingMore = false;
      notifyListeners();
      return Result.error(Exception('Error when loading more people'));
    } catch (e) {
      _isLoadingMore = false;
      notifyListeners();
      return Result.error(Exception(e.toString()));
    }
  }

}
