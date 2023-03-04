// material
import 'package:flutter/material.dart';
// package
import 'package:google_fonts/google_fonts.dart';
// commons

import 'package:great_talk/common/colors.dart';
ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(color: kPrimaryColor),
    textTheme: GoogleFonts.robotoMonoTextTheme(Theme.of(context).textTheme)
  );
    
}