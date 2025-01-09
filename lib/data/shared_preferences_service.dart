import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movie_databases/config/auth_state.dart';

import '../utils/result.dart';

class SharedPreferencesService {
  static const _tokenKey = 'TOKEN';
  static const _accountKey = 'ACCOUNT';
  static const _themeKey = 'THEME';
  static const _guestExpiredAt = 'GUEST';

  final _log = Logger('SharedPreferencesService');

  Future<Result<String?>> fetchSessionId() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      _log.finer('Got sessionId from SharedPreferences');
      return Result.ok(sharedPreferences.getString(_tokenKey));
    } on Exception catch (e) {
      _log.warning('Failed to get sessionId', e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveSessionId(String? sessionId) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      if (sessionId == null) {
        _log.finer('Removed sessionId');
        await sharedPreferences.remove(_tokenKey);
      } else {
        _log.finer('Replaced sessionId');
        await sharedPreferences.setString(_tokenKey, sessionId);
      }
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('Failed to set sessionId', e);
      return Result.error(e);
    }
  }

  Future<Result<int?>> fetchAccountId() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      _log.finer('Got account id from SharedPreferences');
      return Result.ok(sharedPreferences.getInt(_accountKey));
    } on Exception catch (e) {
      _log.warning('Failed to get account id', e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveAccountId(int? accountId) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      if (accountId == null) {
        _log.finer('Removed accountId');
        await sharedPreferences.remove(_accountKey);
      } else {
        _log.finer('Replaced accountId');
        await sharedPreferences.setInt(_accountKey, accountId);
      }
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('Failed to set accountId', e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveUserTheme(String theme) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString(_themeKey, theme);
      _log.finer('theme set to $theme');
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('Failed to set theme', e);
      return Result.error(e);
    }
  }

  Future<Result<String?>> fetchUserTheme() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      _log.finer('Got theme from SharedPreferences');
      return Result.ok(sharedPreferences.getString(_themeKey));
    } on Exception catch (e) {
      _log.warning('Failed to get theme', e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveGuestExpiredTime(String? expiresAt) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      if (expiresAt == null) {
        _log.finer('Removed guest expired time');
        await sharedPreferences.remove(_guestExpiredAt);
      } else {
        _log.finer('Replaced guest expired time');
        await sharedPreferences.setString(_guestExpiredAt, expiresAt);
      }
      return const Result.ok(null);
    } on Exception catch (e) {
      _log.warning('Failed to set guest expired time', e);
      return Result.error(e);
    }
  }

  Future<Result<String?>> fetchGuestExpiredTime() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      _log.finer('Got guest expired time from SharedPreferences');
      return Result.ok(sharedPreferences.getString(_guestExpiredAt));
    } on Exception catch (e) {
      _log.warning('Failed to get guest expired time', e);
      return Result.error(e);
    }
  }

  Future<Result<void>> saveAuthState(AuthState state) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setInt(
          'authState', state.index);
      _log.finer('Auth state saved to ${state.index}');
      return const Result.ok(null); // Return success
    } on Exception catch (e) {
      _log.warning('Failed to get auth state', e);
      return Result.error(Exception(
          'Failed to save auth state $e')); // Return failure if an error occurs
    }
  }

  Future<Result<AuthState>> fetchAuthState() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final authStateInt = sharedPreferences.getInt('authState');

      if (authStateInt != null) {
        final authState = AuthState.values[authStateInt];
        _log.finer('Got the auth state: $authState');
        return Result.ok(authState);
      } else {
        _log.warning('Auth state not found, returning default AuthState.unauthenticated');
        return const Result.ok(AuthState.unauthenticated);
      }
    } on Exception catch (e) {
      _log.severe('Failed to fetch auth state: $e');
      return Result.error(Exception('Failed to fetch auth state: $e'));
    }
  }
}
