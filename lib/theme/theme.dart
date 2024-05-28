// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background:Color(0xfff5f5f5),
    onBackground:Color(0xfff5f5f5),
    primary: Colors.teal,
    inversePrimary: Color(0xffeeeaea),
    secondary: Colors.teal,
    onSecondary: Color(0xff1A2432)
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color(0xff1A2432),
    onBackground:Color(0xfff5f5f5) ,
    primary:Color(0x561D8171),
    inversePrimary: Color(0xff1A2432),
    secondary: Color(0x561D8171),
    onSecondary: Color(0xfff5f5f5),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
);