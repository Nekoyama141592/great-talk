import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';

ThemeData lightThemeData(BuildContext context) {
  const whiteStyle = TextStyle(color: Colors.white);
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    // メインの色が緑なため、他を白で統一
    appBarTheme: const AppBarTheme(
        color: kPrimaryColor,
        titleTextStyle: whiteStyle,
        toolbarTextStyle: whiteStyle,
        iconTheme: IconThemeData(color: Colors.white)),
    scaffoldBackgroundColor: Colors.white,
    focusColor: Colors.black,
    cardColor: kContentColorLightTheme,
    colorScheme: const ColorScheme.light().copyWith(
        onBackground: kPrimaryColor,
        primary: kSecondaryColor, // CupertinoActionSheetActionのTextカラー
        secondary: kSecondaryColor, // TextButtonの色
        tertiary: kAccentColorLightTheme),
  );
}

ThemeData darkThemeData(BuildContext context) {
  const whiteStyle = TextStyle(color: Colors.white);
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    appBarTheme: const AppBarTheme(
        color: kPrimaryColor,
        titleTextStyle: whiteStyle,
        toolbarTextStyle: whiteStyle,
        iconTheme: IconThemeData(color: Colors.white)),
    scaffoldBackgroundColor: kContentColorDarkTheme.withOpacity(0.87),
    focusColor: Colors.white,
    cardColor: kContentColorDarkTheme,
    colorScheme: const ColorScheme.dark().copyWith(
        onBackground: kSecondaryColor,
        primary: kPrimaryColor,
        secondary: kPrimaryColor,
        tertiary: kAccentColorDarkTheme),
  );
}
