import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan, elevation: 0),
  primaryColor: Colors.black,
  primaryTextTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      headlineLarge: TextStyle(color: Colors.black, fontSize: 16)),
  primaryColorLight: Colors.black,
  primaryColorDark: Colors.black,
  tabBarTheme: const TabBarTheme(unselectedLabelColor: Colors.black),
  textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.black)),
  splashColor: Colors.black,
);
