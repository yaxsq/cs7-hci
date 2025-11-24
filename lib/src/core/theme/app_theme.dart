import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF5B0060), // Deep Purple, assuming a primary brand color
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF5B0060), // Deep Purple
      primary: const Color(0xFF5B0060),
      secondary: const Color(0xFFFFA000), // Amber, as a secondary accent
      tertiary: const Color(0xFF4CAF50), // Green, for success/add actions
      error: Colors.red,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'Roboto', // Assuming a common font
    textTheme: TextTheme(
      displayLarge: const TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: const TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: const TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: const TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.white),
      labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: Colors.white70),
      labelSmall: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      buttonColor: const Color(0xFF5B0060),
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xFF2c2c2c),
      filled: true,
      hintStyle: TextStyle(color: Color(0xFFbdbdbd)),
    ),
    bottomAppBarTheme: const BottomAppBarThemeData(
      color: Color(0xFF1E1E1E),
    ),
  );

  static ThemeData largeFontTheme = lightTheme.copyWith(
    textTheme: TextTheme(
      displayLarge: const TextStyle(fontSize: 104, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: const TextStyle(fontSize: 68, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: const TextStyle(fontSize: 56, fontWeight: FontWeight.w400),
      headlineMedium: const TextStyle(fontSize: 42, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
      titleLarge: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.white),
      labelLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: Colors.white70),
      labelSmall: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
  );

  static ThemeData highContrastTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      primary: Colors.black,
      secondary: Colors.grey,
      tertiary: Colors.blue,
      error: Colors.red,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto', // Assuming a common font
    cardColor: Colors.white,
    canvasColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5, color: Colors.black),
      displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5, color: Colors.black),
      displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400, color: Colors.black),
      headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.black),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: Colors.black),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15, color: Colors.black),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15, color: Colors.black),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.black),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25, color: Colors.black),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: Colors.black),
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5, color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      hintStyle: TextStyle(color: Colors.black),
    ),
    bottomAppBarTheme: const BottomAppBarThemeData(
      color: Colors.white,
    ),
  );

  static ThemeData highContrastLargeFontTheme = highContrastTheme.copyWith(
    textTheme: TextTheme(
      displayLarge: const TextStyle(fontSize: 104, fontWeight: FontWeight.w300, letterSpacing: -1.5, color: Colors.black),
      displayMedium: const TextStyle(fontSize: 68, fontWeight: FontWeight.w300, letterSpacing: -0.5, color: Colors.black),
      displaySmall: const TextStyle(fontSize: 56, fontWeight: FontWeight.w400, color: Colors.black),
      headlineMedium: const TextStyle(fontSize: 42, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.black),
      headlineSmall: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: Colors.black),
      titleLarge: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500, letterSpacing: 0.15, color: Colors.black),
      titleMedium: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0.15, color: Colors.black),
      titleSmall: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.1, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.black),
      labelLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 1.25, color: Colors.black),
      bodySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: Colors.black),
      labelSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 1.5, color: Colors.black),
    ),
  );
}
