import 'package:flutter/material.dart';
import 'package:great_talk/consts/colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    // メインの色が緑なため、他を白で統一
    appBarTheme: const AppBarTheme(
      color: kContentColorLightTheme,
    ),
    scaffoldBackgroundColor: Colors.white,
    focusColor: Colors.black,
    cardColor: kContentColorLightTheme.withOpacity(0.87),
    colorScheme: const ColorScheme.light().copyWith(
        onBackground: kPrimaryColor,
        primary: kSecondaryColor, // CupertinoActionSheetActionのTextカラー
        secondary: kSecondaryColor, // TextButtonの色
        tertiary: kAccentColorLightTheme,
        inversePrimary: kPrimaryColor),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: kContentColorDarkTheme,
    ),
    scaffoldBackgroundColor: kContentColorDarkTheme.withOpacity(0.87),
    focusColor: Colors.white,
    cardColor: kContentColorDarkTheme,
    colorScheme: const ColorScheme.dark().copyWith(
        onBackground: kSecondaryColor,
        primary: kPrimaryColor,
        secondary: kPrimaryColor,
        tertiary: kAccentColorDarkTheme,
        inversePrimary: kSecondaryColor),
  );
}
