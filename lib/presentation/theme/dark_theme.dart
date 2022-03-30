import 'package:flutter/material.dart';

final dark = ThemeData(
  primaryColorDark: const Color(0xff1B1B1B),
  primaryColorLight: const Color(0xff292929),
  dividerColor: const Color(0xff343434),
  canvasColor: const Color(0xff37434d),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: Color(0xff343434),
  ),
  indicatorColor: const Color(0xff5665F2),
  errorColor: const Color(0xffE76967),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Color(0xffFFFFFF),
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: "mulish",
    ),
    headline2: TextStyle(
      color: Color(0xffFFFFFF),
      fontFamily: "mulish",
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline3: TextStyle(
      color: Color(0xff8F8F8F),
      fontFamily: "mulish",
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline4: TextStyle(
      color: Color(0xff8F8F8F),
      fontFamily: "mulish",
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  ),
);
