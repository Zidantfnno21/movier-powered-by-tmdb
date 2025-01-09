import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:the_movie_databases/config/auth_state.dart';
import 'package:the_movie_databases/data/local/databases/app_databases.dart';
import 'package:the_movie_databases/data/location_service.dart';
import 'package:the_movie_databases/data/network/service/tmdb_client.dart';
import 'package:the_movie_databases/data/network/service/tmdb_service.dart';
import 'package:the_movie_databases/data/repositories/auth/auth_repository.dart';
import 'package:the_movie_databases/data/shared_preferences_service.dart';
import 'package:the_movie_databases/utils/result.dart';

import '../../network/response/api_response.dart';

class AuthRepositoryImpl extends ChangeNotifier implements AuthRepository {
  AuthRepositoryImpl({
    required TmdbService tmdbService,
    required TmdbClient tmdbClient,
    required SharedPreferencesService sharedPreferencesService,
    required AppDatabases appDatabase,
  })  : _tmdbService = tmdbService,
        _tmdbClient = tmdbClient,
        _appDatabase = appDatabase,
        _sharedPreferencesService = sharedPreferencesService {
    _tmdbClient.sessionIdsProvider = _sessionIdsProvider;
    _tmdbClient.isoCountryCodeProvider = _isoCountryCodeProvider;
    _initializeAuthState();
  }

  final TmdbClient _tmdbClient;
  final TmdbService _tmdbService;
  final SharedPreferencesService _sharedPreferencesService;
  final AppDatabases _appDatabase;
  final _log = Logger('AuthRepository');

  String? _sessionId;
  Map<String, String?> _locationData = {'' : 'US'};
  Timer? _expirationTimer;
  AuthState _authState = AuthState.unauthenticated;

  Future<void> _initializeAuthState() async {
    await _getIsoCountryCodeFromLocation();

    _log.info('Initializing auth state...');
    await _fetch();
    final result = await _sharedPreferencesService.fetchAuthState();
    switch (result) {
      case Ok<AuthState>():
        _authState = result.value;
      case Error<AuthState>():
        _authState = AuthState.unauthenticated;
    }
    _log.info('Auth state initialized: $_authState');

    await _checkGuestSessionExpiration();

    notifyListeners();
  }

  Future<void> _checkGuestSessionExpiration() async {
    final expirationDate =
        await _sharedPreferencesService.fetchGuestExpiredTime();
    if (expirationDate is Ok<String?>) {
      _setupExpirationTimer(expirationDate.value!);
    }
  }

  @override
  Future<AuthState> get authState async => _authState;

  @override
  String? get sessionId => _sessionId;

  @override
  Map<String, String?> get region => _locationData;

  Future<void> _fetch() async {
    final result = await _sharedPreferencesService.fetchSessionId();
    switch (result) {
      case Ok<String?>():
        _sessionId = result.value;
        notifyListeners();
      case Error<String?>():
        _sessionId = null;
        notifyListeners();
    }
  }

  @override
  Future<Result<void>> createSessionId(String requestToken) async {
    try {
      final sessionId = await _tmdbService.createSessionId(requestToken);
      _sessionId = sessionId;
      await _sharedPreferencesService.saveSessionId(sessionId);
      _authState = AuthState.authenticated;
      notifyListeners();
      return const Result.ok(null);
    } on Exception catch (err) {
      return Result.error(err);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logOut() async {
    try {
      if (_authState == AuthState.guestSession) {
        await _sharedPreferencesService.saveSessionId(null);
        _expirationTimer?.cancel();
        await _sharedPreferencesService.saveGuestExpiredTime(null);
        await _clearData();
        _authState = AuthState.unauthenticated;
        notifyListeners();
        return const Result.ok(null);
      }

      final success = await _tmdbService.deleteSession(_sessionId);
      if (success) {
        _sessionId = null;
        _authState = AuthState.unauthenticated;
        await _sharedPreferencesService.saveSessionId(_sessionId);
        await _sharedPreferencesService.saveAccountId(0);
        await _clearData();
        await _sharedPreferencesService.saveAuthState(_authState);
        _expirationTimer?.cancel();
        notifyListeners();
        return const Result.ok(null);
      } else {
        return Result.error(Exception("Error occurred when deleting session"));
      }
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      notifyListeners();
    }
  }

  Future<void> _clearData() async {
    await _appDatabase.clearAllTables();
  }

  @override
  Future<Result<void>> login() async {
    try {
      final requestToken = await _tmdbService.createRequestToken();
      final login = await _tmdbService.startTmdbAuth(requestToken);
      return Result.ok(login);
    } on Exception catch (error) {
      return Result.error(error);
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> createGuestSession() async {
    try {
      final guestSession = await _tmdbService.createGuestSession();

      if (guestSession is Ok<ApiResponseGuestSession>) {
        final guestSessionData = guestSession.value;
        _sessionId = guestSessionData.guestSessionId;
        await _sharedPreferencesService.saveSessionId(_sessionId);
        _authState = AuthState.guestSession;
        await _sharedPreferencesService.saveAuthState(_authState);

        await _sharedPreferencesService
            .saveGuestExpiredTime(guestSessionData.expiresAt);
        _setupExpirationTimer(guestSessionData.expiresAt);

        notifyListeners();
        return const Result.ok(null);
      } else {
        return Result.error(Exception('Failed to create guest session'));
      }
    } on Exception catch (error) {
      return Result.error(error);
    }
  }

  Future<void> _setupExpirationTimer(String expiresAt) async {
    final now = DateTime.now().toUtc();
    final formattedExpiresAt = expiresAt.replaceAll(' UTC', 'Z');
    final expiresAtConverted = DateTime.parse(formattedExpiresAt);

    final timeUntilExpiration = expiresAtConverted.difference(now);

    _log.info('Current time (UTC): $now');
    _log.info('Expires at (UTC): $expiresAtConverted');
    _log.info(
        'Time until expiration: ${timeUntilExpiration.inSeconds} seconds');

    _expirationTimer?.cancel();

    if (timeUntilExpiration.isNegative) {
      _log.warning('Session already expired!');
      _authState = AuthState.unauthenticated;
      await _sharedPreferencesService.saveAuthState(_authState);
      await _sharedPreferencesService.saveSessionId(null);
      await _sharedPreferencesService.saveAccountId(0);
      await _clearData();
      notifyListeners();
    } else {
      _log.info('Setting timer for auto-logout');
      _expirationTimer = Timer(timeUntilExpiration, () async {
        _log.info('Session expired - logging out');
        _authState = AuthState.unauthenticated;
        await _sharedPreferencesService.saveAuthState(_authState);
        await _sharedPreferencesService.saveSessionId(null);
        await _sharedPreferencesService.saveAccountId(0);
        await _clearData();
        notifyListeners();
      });
    }
  }

  Future<Result<void>> _getIsoCountryCodeFromLocation() async {
    final result = await LocationService().getLocationToIso31661();
    if (result is Ok<Map<String, String?>>) {
      _locationData = result.value;
      _log.info('countryCode fetched from service $_locationData');
      notifyListeners();
      return const Result.ok(null);
    }
    return Result.error(Exception('fail to get iso country code'));
  }

  String? _sessionIdsProvider() => _sessionId;

  Map<String, String?> _isoCountryCodeProvider() => _locationData;

  final List<VoidCallback> _listeners = [];

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  bool get hasListeners => _listeners.isNotEmpty;

  @override
  void notifyListeners() {
    for (var listener in _listeners) {
      listener(); // Notify all listeners
    }
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  @override
  void dispose() {
    _expirationTimer?.cancel();
    _listeners.clear();
    super.dispose();
  }
}
