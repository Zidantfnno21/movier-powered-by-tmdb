import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF6A1B9A), // Deep purple
    onPrimary: Color(0xFFFFFFFF), // White text on primary
    secondary: Color(0xFF4CAF50), // Fresh green
    onSecondary: Color(0xFF1A1A1A), // Near black
    surface: Color(0xFF212121), // Deep gray surface
    onSurface: Color(0xFFE0E0E0), // Light gray text/icons
  ),
  scaffoldBackgroundColor: const Color(0xFF121212), // Near black
  iconTheme: const IconThemeData(color: Color(0xFF4CAF50)), // Green icons
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFFE0E0E0), fontSize: 16), // Light gray
    bodyMedium: TextStyle(color: Color(0xFFBDBDBD), fontSize: 14), // Medium gray
    titleLarge: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1F1F1F), // Dark gray
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Color(0xFFFFFFFF), // White title
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Color(0xFF4CAF50)), // Green icons
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6A1B9A), // Purple button
      foregroundColor: Colors.white, // White text
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF212121), // Deep gray
    selectedItemColor: Color(0xFF6A1B9A), // Purple for selected
    unselectedItemColor: Color(0xFFBDBDBD), // Medium gray for unselected
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF2C2C2C), // Darker fill
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF6A1B9A)), // Purple border
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF6A1B9A)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF4CAF50)), // Green on focus
    ),
    hintStyle: const TextStyle(color: Color(0xFFBDBDBD)), // Medium gray hints
  ),
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF9C27B0), // Vivid purple
    onPrimary: Color(0xFFFFFFFF), // White text on primary
    secondary: Color(0xFF81C784), // Soft green
    onSecondary: Color(0xFF000000), // Black text on secondary
    surface: Color(0xFFF5F5F5), // Light gray surface
    onSurface: Color(0xFF212121), // Dark gray text/icons
  ),
  scaffoldBackgroundColor: const Color(0xFFF9F9F9), // Off-white background
  iconTheme: const IconThemeData(color: Color(0xFF9C27B0)), // Purple icons
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF212121), fontSize: 16), // Dark gray
    bodyMedium: TextStyle(color: Color(0xFF616161), fontSize: 14), // Medium gray
    titleLarge: TextStyle(
        color: Color(0xFF212121), fontWeight: FontWeight.bold, fontSize: 20),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF), // White background
    elevation: 2,
    titleTextStyle: TextStyle(
      color: Color(0xFF212121), // Dark gray title
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Color(0xFF9C27B0)), // Purple icons
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF9C27B0), // Purple button
      foregroundColor: Colors.white, // White text
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFFFFF), // White background
    selectedItemColor: Color(0xFF9C27B0), // Purple for selected
    unselectedItemColor: Color(0xFF757575), // Medium gray for unselected
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF5F5F5), // Lighter fill
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF9C27B0)), // Purple border
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF9C27B0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF81C784)), // Green on focus
    ),
    hintStyle: const TextStyle(color: Color(0xFF616161)), // Medium gray hints
  ),
);
