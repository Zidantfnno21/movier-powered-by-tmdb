// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:the_movie_databases/data/local/databases/app_databases.dart';
import 'package:the_movie_databases/data/network/response/api_response.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../../data/local/databases/entity/movies.dart';
import '../../../data/local/databases/entity/people.dart';
import '../../../data/local/databases/entity/trending.dart';
import '../../../data/local/databases/entity/tv_shows.dart';
import '../../../data/network/service/tmdb_client.dart';
import '../../../data/network/service/tmdb_client_impl.dart';
import '../../../utils/constant.dart';


class HomeViewModel with ChangeNotifier {
  late final TmdbClient tmdbClient;

  HomeViewModel() {
    tmdbClient = TmdbClientImpl();
  }
  Result<List<Trending>> trendingState = const Result.ok([]);
  Result<List<Movies>> popularMoviesState = const Result.ok([]);
  Result<List<TvShows>> popularTvShowsState = const Result.ok([]);
  Result<List<People>> popularPeopleState = const Result.ok([]);

  List<Trending> _trendingList = [];
  List<Movies> _popularMovies = [];
  List<TvShows> _popularTvShows = [];
  List<People> _people = [];
  String _selectedTrendingFilter = Constant.trendingFilter[0]['value']!;
  String _selectedPopularFilter = Constant.popularFilter[0]['value']!;
  bool _isTrendingLoading = false;
  bool _isPopularLoading = false;
  bool _isPeopleLoading = false;

  List<Trending> get trendingList => _trendingList;
  List<Movies> get popularMoviesList => _popularMovies;
  List<TvShows> get popularTvShowsList => _popularTvShows;
  List<People> get popularPeopleList => _people;
  String get selectedTrendingFilter => _selectedTrendingFilter;
  String get selectedPopularFilter => _selectedPopularFilter;
  bool get isTrendingLoading => _isTrendingLoading;
  bool get isPopularLoading => _isPopularLoading;
  bool get isPeopleLoading => _isPeopleLoading;

  void updateSelectedTrendingFilter(String selectedFilter) {
    _selectedTrendingFilter = selectedFilter;
    notifyListeners();
    fetchTrending();
  }

  void updateSelectedPopularFilter(String selectedFilter) {
    _selectedPopularFilter = selectedFilter;
    notifyListeners();
    fetchPopular();
  }

  Future<void> fetchTrending() async {
    _isTrendingLoading = true;
    notifyListeners();

    final response = await tmdbClient.fetchTrending(_selectedTrendingFilter);

    try {

      if (response is Error<ApiResponse<Trending>>) {
        print('Error fetching trending data view model: ${response.error}');
        _trendingList = await getTrendingFromDb();
        trendingState = Result.ok(_trendingList);
      }

      if (response is Ok<ApiResponse<Trending>>) {
        final result = response.value.results;

        await insertTrendingToDb(result);

        final item = await getTrendingFromDb();
        _trendingList = item;

        trendingState = Result.ok(_trendingList);
      }
    } catch (e) {
      print('Error fetching trending data view model: $e');

      _trendingList = await getTrendingFromDb();
      trendingState = Result.ok(_trendingList);
    } finally {
      _isTrendingLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPopular() async {
    try {
      if(_selectedPopularFilter == Constant.popularFilter[0]['value']){
        fetchPopularMovies();
      }
      else if(_selectedPopularFilter == Constant.popularFilter[1]['value']){
        fetchPopularTvShows();
      }
      else {
        fetchPopularMovies();
      }
    } catch (e) {
      print('Error fetching popular data: $e');
    }
  }

  Future<void> insertTrendingToDb(List<Trending> trendingList) async {
    final database =
        await $FloorAppDatabases.databaseBuilder('app_database.db').build();
    database.trendingDao.deleteAllTrending();
    if (trendingList.isEmpty) {
      print('No trending data to insert into DB.');
      return;
    }

    for (var trending in trendingList) {
      await database.trendingDao.insertTrending(trending);
    }
    getTrendingFromDb();
  }

  Future<List<Trending>> getTrendingFromDb() async {
    try {
      final database =
          await $FloorAppDatabases.databaseBuilder('app_database.db').build();
      final trending = await database.trendingDao.getAllTrending();
      return trending;
    } catch (e) {
      print('Error fetching trending data from DB: $e');
      return [];
    }
  }

  Future<void> fetchPopularMovies() async {
    _isPopularLoading = true;
    notifyListeners();

    try {
      final response = await tmdbClient.fetchPopularMovies(1);

      if(response is Ok<ApiResponse<Movies>>){
        insertPopularMoviesToDb(response.value.results);
        popularMoviesState = Result.ok(_popularMovies);
      }

      if(response is Error<ApiResponse<Movies>>) {
        print('Error fetching trending data view model: ${response.error}');
        getPopularMoviesFromDb();
        popularMoviesState = Result.ok(_popularMovies);
      }

    } catch (e) {
      getPopularMoviesFromDb();
      popularMoviesState = Result.ok(_popularMovies);
      print('Error fetching trending data view model: $e');
    }finally{
      _isPopularLoading = false;
      notifyListeners();
    }
  }

  Future<void> insertPopularMoviesToDb(List<Movies> moviesList) async {
    final database =
    await $FloorAppDatabases.databaseBuilder('app_database.db').build();
    database.moviesDao.deleteAllMovies();
    for (var movie in moviesList) {
      await database.moviesDao.insertMovies(movie);
    }
    getPopularMoviesFromDb();
  }

  Future<void> getPopularMoviesFromDb() async {
    try {
      final database =
      await $FloorAppDatabases.databaseBuilder('app_database.db').build();
      final movies = await database.moviesDao.getAllMovies();
      _popularMovies = movies;
      notifyListeners();
    } catch (e) {
      print('Error fetching popular movies data from DB: $e');
    }
  }

  Future<void> fetchPopularTvShows() async {
    _isPopularLoading = true;
    notifyListeners();

    try {
      final response = await tmdbClient.fetchPopularTvShows(1);

      if(response is Ok<ApiResponse<TvShows>>){
        insertPopularTvShowsToDb(response.value.results);
        popularTvShowsState = Result.ok(response.value.results);
      } else if(response is Error<ApiResponse<TvShows>>) {
        print('Error fetching popular TV shows data view model: ${response.error}');
        getPopularTvShowsFromDb();
        popularTvShowsState = Result.ok(_popularTvShows);
      }
    } catch (e) {
      getPopularTvShowsFromDb();
      popularTvShowsState = Result.ok(_popularTvShows);
      print('Error fetching popular TV shows data: $e');
    } finally {
      _isPopularLoading = false;
      notifyListeners();
    }
  }

  Future<void> insertPopularTvShowsToDb(List<TvShows> tvShowsList) async {
    final database =
    await $FloorAppDatabases.databaseBuilder('app_database.db').build();
    database.tvShowsDao.deleteAllTvShows();
    for (var tvShow in tvShowsList) {
      await database.tvShowsDao.insertTvShows(tvShow);
    }
    getPopularTvShowsFromDb();
  }

  Future<void> getPopularTvShowsFromDb() async {
    try {
      final database =
      await $FloorAppDatabases.databaseBuilder('app_database.db').build();
      final tvShows = await database.tvShowsDao.getAllTvShows();
      _popularTvShows = tvShows;
      notifyListeners();
    } catch (e) {
      print('Error fetching popular TV shows data from DB: $e');
    }
  }

  Future<void> fetchPopularPeople() async {
    _isPeopleLoading = true;
    notifyListeners();

    try {
      final response = await tmdbClient.fetchPeople(1);

      if(response is Ok<ApiResponse<People>>){
        insertPopularPeopleToDb(response.value.results);
        popularPeopleState = Result.ok(response.value.results);
      } else if(response is Error<ApiResponse<People>>) {
        print('Error fetching popular people data: ${response.error}');
        getPopularPeopleFromDb();
        popularPeopleState = Result.ok(_people);
      }
    } catch (e) {
      getPopularPeopleFromDb();
      popularPeopleState = Result.ok(_people);
      print('Error fetching popular people data: $e');
    } finally {
      _isPeopleLoading = false;
      notifyListeners();
    }
  }

  Future<void> insertPopularPeopleToDb(List<People> peopleList) async {
    final database =
    await $FloorAppDatabases.databaseBuilder('app_database.db').build();
    database.peopleDao.deleteAllPeople();
    for (var person in peopleList) {
      await database.peopleDao.insertPeople(person);
    }
    getPopularPeopleFromDb();
  }

  Future<void> getPopularPeopleFromDb() async {
    try {
      final database =
      await $FloorAppDatabases.databaseBuilder('app_database.db').build();
      final people = await database.peopleDao.getAllPeople();
      _people = people;
      notifyListeners();
    } catch (e) {
      print('Error fetching popular people data from DB: $e');
    }
  }
}
