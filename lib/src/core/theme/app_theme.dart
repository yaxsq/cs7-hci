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
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
      displayMedium: TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
      displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: Colors.white),
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

  // You can also define a dark theme if necessary
  // static ThemeData darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   // ... dark theme properties
  // );
}
