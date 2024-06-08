import 'package:flutter/material.dart';
import 'package:allservice/res/constants/constants.dart';

final mainTheme = ThemeData(
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: kBackgroundColor,
  ),
  textButtonTheme: TextButtonThemeData(
    
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      disabledForegroundColor: kBackgroundColor.withAlpha(140),
      disabledBackgroundColor: kBackgroundColor.withAlpha(140),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kPrimaryColor,
    selectionColor: kPrimaryColor,
    selectionHandleColor: kPrimaryColor,
  ),
  scaffoldBackgroundColor: kBackgroundColor,
  primaryColor: kPrimaryColor,
  //colorScheme: ColorScheme(),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: kTextColor,
    ),
  ),
  //appBarTheme: AppBarTheme(titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
  useMaterial3: true,
);