import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    appBarTheme: const AppBarTheme(color: kPrimaryColor),
    scaffoldBackgroundColor: Colors.white,
    focusColor: Colors.black,
    cardColor: kContentColorLightTheme,
    colorScheme: const ColorScheme.light().copyWith(secondary: kSecondaryColor),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    appBarTheme: const AppBarTheme(color: kPrimaryColor),
    scaffoldBackgroundColor: kContentColorDarkTheme.withOpacity(0.87),
    focusColor: Colors.white,
    cardColor: kContentColorDarkTheme,
    colorScheme: const ColorScheme.dark().copyWith(secondary: kSecondaryColor),
  );
}
