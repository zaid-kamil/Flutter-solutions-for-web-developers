// utils/db_theme.dart
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.grey,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
        headlineMedium: TextStyle(
          color: Colors.black45,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black38,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardColor: Colors.white,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.blue,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        bodySmall: TextStyle(
          color: Colors.white54,
          fontSize: 14,
        ),
        headlineMedium: TextStyle(
          color: Colors.white60,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.white38,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardColor: Colors.blueGrey,
    );
  }
}
