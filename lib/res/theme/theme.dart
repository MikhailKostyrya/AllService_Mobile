import 'package:flutter/material.dart';

const kGreyColor3 = Color(0xFFF7F8F8);
const kBackgroundColor = Color(0xFFFFFFFF);
const kPrimaryColor = Color(0xFF7000FF);
const kTextColor = Color(0xFF000000);
const kErrorColor = Color(0xFFFF0000);

final mainTheme = ThemeData(
  inputDecorationTheme: inputDecorationTheme(),
  textSelectionTheme: textSelectionThemeData(),
  cardTheme: cardTheme(),
  scaffoldBackgroundColor: kBackgroundColor,
  primaryColor: kPrimaryColor,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: kTextColor,
    ),
    titleSmall: TextStyle(
      color: kTextColor,
      fontWeight: FontWeight.w700,
      fontSize: 17,
    ),
  ),
  useMaterial3: true,
);

TextSelectionThemeData textSelectionThemeData() {
  return const TextSelectionThemeData(
    cursorColor: kPrimaryColor,
    selectionColor: kPrimaryColor,
    selectionHandleColor: kPrimaryColor,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 48),
    filled: true,
    fillColor: kGreyColor3,
    errorStyle: const TextStyle(color: kErrorColor),
    labelStyle: const TextStyle(color: kTextColor),
    disabledBorder: standartOutlineInputBorder(),
    enabledBorder: standartOutlineInputBorder(),
    focusedBorder: activeOutlineInputBorder(),
    errorBorder: errorOutlineInputBorder(),
    focusedErrorBorder: errorOutlineInputBorder(),
  );
}

CardTheme cardTheme() {
  return CardTheme(
    color: kBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  );
}

OutlineInputBorder standartOutlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide.none,
  );
}

OutlineInputBorder activeOutlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: kPrimaryColor),
  );
}

OutlineInputBorder errorOutlineInputBorder() {
  return const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide(color: kErrorColor),
  );
}
