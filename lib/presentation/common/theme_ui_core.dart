import 'package:flutter/material.dart';
import 'package:great_talk/presentation/constant/colors.dart';

class ThemeUiCore {
  static ThemeData light(BuildContext context) {
    return ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
      appBarTheme: const AppBarTheme(color: kContentColorLightTheme),
      scaffoldBackgroundColor: Colors.white,
      focusColor: Colors.black,
      cardColor: kContentColorLightTheme.withAlpha(alpha87),
      colorScheme: const ColorScheme.light().copyWith(
        primary: kSecondaryColor,
        secondary: kSecondaryColor,
        tertiary: kAccentColorLightTheme,
        inversePrimary: kPrimaryColor,
      ),
    );
  }

  static ThemeData dark(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: kPrimaryColor,
      appBarTheme: const AppBarTheme(color: kContentColorDarkTheme),
      scaffoldBackgroundColor: kContentColorDarkTheme.withAlpha(alpha87),
      focusColor: Colors.white,
      cardColor: kContentColorDarkTheme,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: kPrimaryColor,
        secondary: kPrimaryColor,
        tertiary: kAccentColorDarkTheme,
        inversePrimary: kSecondaryColor,
      ),
    );
  }
}
