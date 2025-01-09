import 'package:flutter/foundation.dart';
import 'package:the_movie_databases/data/network/model/details_movie/details_movies.dart';
import 'package:the_movie_databases/data/network/model/details_people/details_people.dart';
import 'package:the_movie_databases/data/network/model/details_tv_shows/details_tv_shows.dart';
import 'package:the_movie_databases/data/repositories/details/details_repository.dart';
import 'package:the_movie_databases/data/repositories/favourites/favourites_repository.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../../data/network/model/videos/video.dart';
import '../../../data/shared_preferences_service.dart';

class DetailsViewModel with ChangeNotifier {
  DetailsViewModel({
    required DetailsRepository detailsRepository,
    required FavouritesRepository favouritesRepository,
    required SharedPreferencesService sharedPreferencesService,
  })  : _detailsRepository = detailsRepository,
        _favouritesRepository = favouritesRepository,
        _sharedPreferencesService = sharedPreferencesService;

  final DetailsRepository _detailsRepository;
  final FavouritesRepository _favouritesRepository;
  final SharedPreferencesService _sharedPreferencesService;

  List<String> _listOfGenreName = [];
  List<Video> _listOfVideos = [];
  List<MovieCast> _movieCast = [];
  List<Cast> _tvShowCast = [];
  List<CastWithCharacter> _peopleCast = [];

  DetailsMovies? _movieDetails;
  DetailsTvShows? _tvShowsDetails;
  DetailsPeople? _peopleDetails;

  bool _isLoading = false;
  bool _isFavorites = false;
  bool _isLoadingVideos = false;
  String? _error;

  List<String> get listOfGenreName => _listOfGenreName;
  List<Video> get listOfVideos => _listOfVideos;
  DetailsMovies? get movieDetails => _movieDetails;
  DetailsTvShows? get tvShowsDetails => _tvShowsDetails;
  DetailsPeople? get peopleDetails => _peopleDetails;
  bool get isLoading => _isLoading;
  bool get isLoadingVideos => _isLoadingVideos;
  bool get isFavorites => _isFavorites;
  String? get error => _error;
  List<MovieCast> get movieCast => _movieCast;
  List<Cast> get tvShowCast => _tvShowCast;
  List<CastWithCharacter> get peopleCast => _peopleCast;

  // Future<void> fetchGenres() async {
  //   try {
  //     await _detailsRepository.fetchGenres();
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error fetching genre: $e');
  //     }
  //   }
  // }
  //
  // Future<Genres?> findGenresNameByIds(int id) async {
  //   final genre = await _detailsRepository.findNameById(id);
  //   return genre;
  // }
  //
  // Future<void> findListOfGenresNames(List<int> listOfId) async {
  //   _listOfGenreName.clear();
  //   for (var id in listOfId) {
  //     final genre = await findGenresNameByIds(id);
  //     if (genre != null) {
  //       _listOfGenreName.add(genre.name);
  //     }
  //   }
  //   notifyListeners();
  // }
  //
  Future<int> getAccountId() async {
    final result = await _sharedPreferencesService.fetchAccountId();
    if (result is Ok<int>) {
      return result.value;
    }
    return 0;
  }
  //
  // Future<bool> isItemFavorites(int mediaId, String mediaType) async {
  //   _isLoading = true;
  //   notifyListeners();
  //
  //   final response = await _favouritesRepository.isItemFavorites(
  //       mediaId: mediaId, mediaType: mediaType);
  //   if (response is Ok<bool>) {
  //     _isFavorites = response.value;
  //     _isLoading = false;
  //     notifyListeners();
  //     return response.value;
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return false;
  // }
  //

  Future<String?> toggleFavourites(int mediaId, String mediaType) async {
    _isLoading = true;
    notifyListeners();

    final accountId = await getAccountId();
    final response = await _favouritesRepository.addToFavourites(
      mediaId: mediaId,
      mediaType: mediaType,
      isFavourite: _isFavorites,
      accountId: accountId,
    );

    _isFavorites = !_isFavorites;
    _isLoading = false;
    notifyListeners();

    return response.statusMessage;
  }
  //
  // Future<Result<List<Video>>> fetchMovieVideos(int id) async {
  //   _listOfVideos.clear();
  //   _isLoadingVideos = true;
  //   notifyListeners();
  //
  //   final result = await _detailsRepository.fetchMovieVideos(id);
  //   if (result is Ok<List<Video>>) {
  //     _listOfVideos = result.value;
  //   }
  //   _isLoadingVideos = false;
  //   notifyListeners();
  //   return result;
  // }
  //
  // Future<Result<List<Video>>> fetchTvShowsVideos(int id) async {
  //   _listOfVideos.clear();
  //   _isLoadingVideos = true;
  //   notifyListeners();
  //
  //   final result = await _detailsRepository.fetchTvShowsVideos(id);
  //   if (result is Ok<List<Video>>) {
  //     _listOfVideos = result.value;
  //   }
  //   _isLoadingVideos = false;
  //   notifyListeners();
  //   return result;
  // }

  Future<Result<void>> fetchMovieDetails(int id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _detailsRepository.fetchMovieDetails(id);

      if (result is Ok<DetailsMovies>) {
        _movieDetails = result.value;

        if (_movieDetails!.videos!.results.isNotEmpty) {
          _listOfVideos = _movieDetails!.videos!.results;
        }

        if (_movieDetails!.genres.isNotEmpty) {
          _listOfGenreName = _movieDetails!.genres.map((e) => e.name).toList();
        }

        if (_movieDetails!.credits!.cast.isNotEmpty) {
          _movieCast = List.from(_movieDetails!.credits!.cast)
            ..sort((a, b) => (a.order).compareTo(b.order));
        }
        _isFavorites = _movieDetails!.accountStates?.favorite ?? false;
        return const Result.ok(null);
      }

      return Result.error(Exception('error to fetch details'));
    } catch (e) {
      _error = e.toString();
      return Result.error(Exception(e.toString()));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Result<void>> fetchTvShowsDetails(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _detailsRepository.fetchTvShowsDetails(id);
      if (result is Ok<DetailsTvShows>) {
        _tvShowsDetails = result.value;

        if (_tvShowsDetails!.videos!.results.isNotEmpty) {
          _listOfVideos = _tvShowsDetails!.videos!.results;
        }

        if (_tvShowsDetails!.genres!.isNotEmpty) {
          _listOfGenreName =
              _tvShowsDetails!.genres!.map((e) => e.name).toList();
        }

        if (_tvShowsDetails!.aggregateCredits!.cast.isNotEmpty) {
          _tvShowCast = List.from(_tvShowsDetails!.aggregateCredits!.cast)
            ..sort((a, b) => (a.order).compareTo(b.order));
        }

        _isFavorites = _tvShowsDetails!.accountStates?.favorite ?? false;
        return const Result.ok(null);
      }

      return Result.error(Exception('error to fetch details'));
    } catch (e) {
      _error = e.toString();
      return Result.error(Exception(e.toString()));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Result<void>> fetchPeopleDetails(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      final result = await _detailsRepository.fetchPeopleDetails(id);
      if (result is Ok<DetailsPeople>) {
        _peopleDetails = result.value;

        if (_peopleDetails != null && _peopleDetails!.combinedCredits != null) {
          if (_peopleDetails!.combinedCredits!.cast != null) {
            _peopleCast = List.from(_peopleDetails!.combinedCredits!.cast!)
              ..sort((a, b) => (a.order ?? 0).compareTo(b.order ?? 0));
          } else {
            _peopleCast = [];
          }
        } else {
          _peopleCast = [];
        }

        return const Result.ok(null);
      }
      return Result.error(Exception('error to fetch details'));
    } catch (e) {
      _error = e.toString();
      return Result.error(Exception(e.toString()));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearDetails() {
    _movieDetails = null;
    _tvShowsDetails = null;
    _listOfVideos.clear();
    _listOfGenreName.clear();
    _error = null;
    notifyListeners();
  }
}
