import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

ThemeMode getActualTheme(String? savedTheme) {
  if (savedTheme != null) {
    return savedTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  final brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
}

bool isDarkMode(String? savedTheme) {
  return getActualTheme(savedTheme) == ThemeMode.dark;
}
