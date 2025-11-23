import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF5B0060), // Deep Purple, assuming a primary brand color
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF5B0060), // Deep Purple
      primary: const Color(0xFF5B0060),
      secondary: const Color(0xFFFFA000), // Amber, as a secondary accent
      tertiary: const Color(0xFF4CAF50), // Green, for success/add actions
      error: Colors.red,
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
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      buttonColor: const Color(0xFF5B0060),
      textTheme: ButtonTextTheme.primary,
    ),
    // Add other theme properties as needed
  );

  static ThemeData highContrastTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      primary: Colors.black,
      secondary: Colors.black,
      tertiary: Colors.black,
      error: Colors.red,
      background: Colors.white,
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
    fontFamily: 'Roboto',
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
  );

  static TextTheme get largeTextTheme {
    return const TextTheme(
      displayLarge: TextStyle(fontSize: 100, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: TextStyle(fontSize: 64, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: TextStyle(fontSize: 52, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(fontSize: 38, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, letterSpacing: 0.5),
      bodyMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      labelLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 1.25),
      bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.4),
      labelSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 1.5),
    );
  }
}
