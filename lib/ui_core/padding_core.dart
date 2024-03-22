import 'package:flutter/material.dart';

class PaddingCore {
  static double defaultPadding(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.02;
  static EdgeInsetsGeometry defaultAll(BuildContext context) {
    final value = defaultPadding(context);
    return EdgeInsets.all(value);
  }
}
