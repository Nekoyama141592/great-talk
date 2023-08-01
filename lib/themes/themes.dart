// material
import 'package:flutter/material.dart';
// package
import 'package:google_fonts/google_fonts.dart';
// commons

import 'package:great_talk/common/colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
      appBarTheme: const AppBarTheme(color: kPrimaryColor),
      scaffoldBackgroundColor: Colors.white,
      focusColor: Colors.black,
      colorScheme:
          const ColorScheme.dark().copyWith(secondary: kSecondaryColor),
      textTheme:
          GoogleFonts.notoSansJavaneseTextTheme(Theme.of(context).textTheme));
}
