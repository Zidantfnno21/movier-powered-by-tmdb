import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:the_movie_databases/data/shared_preferences_service.dart';
import 'package:the_movie_databases/utils/get_actual_theme.dart';
import 'package:the_movie_databases/utils/result.dart';

class ThemeProvider with ChangeNotifier {
  final SharedPreferencesService _preferencesService;
  ThemeMode _themeMode;

  ThemeProvider(this._preferencesService) : _themeMode = ThemeMode.system {
    _loadTheme();
  }

  ThemeMode get themeMode => _themeMode;
  final _log = Logger('Theme Provider');

  Future<void> _loadTheme() async {
    try {
      final mode = await _preferencesService.fetchUserTheme();
      if (mode is Ok<String?>) {
        final newTheme = getActualTheme(mode.value);
        if (newTheme != _themeMode) {
          _themeMode = newTheme;
          notifyListeners();
        }
      }
    } catch (e) {
      _log.warning('Error load theme');
    }
  }

  Future<void> updateTheme(String theme) async {
    await _preferencesService.saveUserTheme(theme);
    final newTheme = getActualTheme(theme);
    if (newTheme != _themeMode) {
      _themeMode = newTheme;
      notifyListeners();
    }
  }
}
