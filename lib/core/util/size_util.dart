import 'package:flutter/material.dart';

class SizeUtil {
  static double fullHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double fullWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double userImageSize(BuildContext context) =>
      fullWidth(context) * 0.16;
  static double defaultPadding(BuildContext context) =>
      fullHeight(context) / 100.0;
  static double defaultHeaderTextSize(BuildContext context) =>
      fullHeight(context) / 32.0;
  static double defaultTabTextSize(BuildContext context) =>
      fullHeight(context) / 50.0;
  static double appBarCircular(BuildContext context) =>
      fullHeight(context) / 25.0;
  static double searchScreenTopPadding(BuildContext context) =>
      defaultPadding(context) * 7;
  static double chatScreenHeight(BuildContext context) {
    final x = fullHeight(context);
    return x * 0.7;
  }
}
