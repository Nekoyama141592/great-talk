import 'package:flutter/material.dart';
import 'package:great_talk/presentation/constant/colors.dart';

class ThemeUiUtil {
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
