import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/result.dart';

class SharedPreferencesService {
  static const _tokenKey = 'TOKEN';
  static const _accountKey = 'ACCOUNT';
  static const _themeKey = 'THEME';

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
}
