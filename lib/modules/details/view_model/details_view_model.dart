
import 'package:flutter/foundation.dart';
import 'package:the_movie_databases/data/local/databases/entity/genres.dart';
import 'package:the_movie_databases/data/repositories/details/details_repository.dart';
import 'package:the_movie_databases/data/repositories/favourites/favourites_repository.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../../data/network/videos.dart';
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
  List<Videos> _listOfVideos = [];
  bool _isLoading = false;
  bool _isFavorites = false;
  bool _isLoadingVideos = false;

  List<String> get listOfGenreName => _listOfGenreName;
  List<Videos> get listOfVideos => _listOfVideos;
  bool get isLoading => _isLoading;
  bool get isLoadingVideos => _isLoadingVideos;
  bool get isFavorites => _isFavorites;

  Future<void> fetchGenres() async {
    try {
      await _detailsRepository.fetchGenres();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching genre: $e');
      }
    }
  }

  Future<Genres?> findGenresNameByIds(int id) async {
    final genre = await _detailsRepository.findNameById(id);
    return genre;
  }

  Future<void> findListOfGenresNames(List<int> listOfId) async {
    _listOfGenreName.clear();
    for (var id in listOfId) {
      final genre = await findGenresNameByIds(id);
      if (genre != null) {
        _listOfGenreName.add(genre.name);
      }
    }
    notifyListeners();
  }

  Future<int> getAccountId() async {
    final result = await _sharedPreferencesService.fetchAccountId();
    if (result is Ok<int>) {
      return result.value;
    }
    return 0;
  }

  Future<bool> isItemFavorites(int mediaId, String mediaType) async {
    _isLoading = true;
    notifyListeners();

    final response = await _favouritesRepository.isItemFavorites(
        mediaId: mediaId, mediaType: mediaType);
    if (response is Ok<bool>) {
      _isFavorites = response.value;
      _isLoading = false;
      notifyListeners();
      return response.value;
    }
    _isLoading = false;
    notifyListeners();
    return false;
  }

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

  Future<Result<List<Videos>>> fetchMovieVideos(int id) async {
    _listOfVideos.clear();
    _isLoadingVideos = true;
    notifyListeners();

    final result = await _detailsRepository.fetchMovieVideos(id);
    if (result is Ok<List<Videos>>) {
      _listOfVideos = result.value;
    }
    _isLoadingVideos = false;
    notifyListeners();
    return result;
  }

  Future<Result<List<Videos>>> fetchTvShowsVideos(int id) async {
    _listOfVideos.clear();
    _isLoadingVideos = true;
    notifyListeners();

    final result = await _detailsRepository.fetchTvShowsVideos(id);
    if (result is Ok<List<Videos>>) {
      _listOfVideos = result.value;
    }
    _isLoadingVideos = false;
    notifyListeners();
    return result;
  }
}
