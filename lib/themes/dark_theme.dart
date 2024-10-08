// themes/dark_theme.dart

import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey[900],
  scaffoldBackgroundColor: Colors.grey[800],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900],
    titleTextStyle: const TextStyle(
      color: Colors.white,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: Colors.grey[300],
      fontSize: 16.0,
    ),
    bodyMedium: TextStyle(
      color: Colors.grey[300],
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue[300],
      foregroundColor: Colors.grey[900],
    ),
  ),
  cardTheme: CardTheme(
    color: Colors.grey[700],
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.grey[400],
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[600]!,
      ),
    ),
  ),
);
