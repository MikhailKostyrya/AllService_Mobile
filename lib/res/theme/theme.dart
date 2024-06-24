import 'package:flutter/material.dart';
import 'package:allservice/res/constants/constants.dart';

final mainTheme = ThemeData(
  elevatedButtonTheme: elevatedButtonThemeData(),
  inputDecorationTheme: inputDecorationTheme(),
  textSelectionTheme: textSelectionThemeData(),
  searchBarTheme: searchBarThemeData(),
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
      )),
  useMaterial3: true,
);

TextSelectionThemeData textSelectionThemeData() {
  return const TextSelectionThemeData(
    cursorColor: kPrimaryColor,
    selectionColor: kPrimaryColor,
    selectionHandleColor: kPrimaryColor,
  );
}

ElevatedButtonThemeData elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
      style: ButtonStyle(
    textStyle: WidgetStatePropertyAll(elevateButtonStyle),
    foregroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.white;
      }
      return Colors.black;
    }),
    backgroundColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return Colors.black;
      }
      return Colors.white;
    }),
    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
    ),
    fixedSize: const WidgetStatePropertyAll(Size.fromHeight(44)),
    elevation: const WidgetStatePropertyAll(0),
    animationDuration: Duration.zero,
  ));
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    // alignLabelWithHint: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 48),

    filled: true,
    fillColor: kGreyColor3,
    errorStyle: inputFieldTextStyle.copyWith(color: kErrorColor),
    labelStyle: inputFieldTextStyle.copyWith(color: kGreyColor1),

    disabledBorder: standartOutlineInputBorder(),
    enabledBorder: standartOutlineInputBorder(),
    focusedBorder: activeOutlineInputBorder(),
    errorBorder: errorOutlineInputBorder(),
    focusedErrorBorder: errorOutlineInputBorder(),
  );
}

SearchBarThemeData searchBarThemeData() {
  return const SearchBarThemeData(
    overlayColor: WidgetStatePropertyAll(Colors.transparent),
    shadowColor: WidgetStatePropertyAll(Colors.transparent),
    backgroundColor: WidgetStatePropertyAll(kBackgroundColor),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
    ),
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
