import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Avenir',
      textTheme: textTheme(),
      useMaterial3: true);
}

TextTheme textTheme() {
  return const TextTheme(
      displayLarge: TextStyle(
          color: Colors.white,
          fontFamily: 'Avenir',
          fontSize: 32,
          fontWeight: FontWeight.bold),
      displayMedium: TextStyle(
          color: Colors.white,
          fontFamily: 'Avenir',
          fontSize: 24,
          fontWeight: FontWeight.bold),
      displaySmall: TextStyle(
          color: Colors.white,
          fontFamily: 'Avenir',
          fontSize: 18,
          fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(
          color: Colors.white,
          fontFamily: 'Avenir',
          fontSize: 16,
          fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontFamily: 'Avenir',
        fontSize: 17,
      ),
      titleLarge: TextStyle(
          color: Colors.white,
          fontFamily: 'Avenir',
          fontSize: 12,
          fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(
          color: Colors.white,
          fontFamily: 'Avenir',
          fontSize: 10,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
          color: Colors.white,
          fontFamily: 'Avenir',
          fontSize: 10,
          fontWeight: FontWeight.bold));
}
