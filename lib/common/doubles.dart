import 'package:flutter/material.dart';

double fullHeight(BuildContext context) => MediaQuery.of(context).size.height;
double fullWidth(BuildContext context) => MediaQuery.of(context).size.width;
double userImageSize(BuildContext context) => fullWidth(context) * 0.16;
double defaultPadding(BuildContext context) => fullHeight(context) / 100.0;
double defaultHeaderTextSize(BuildContext context) =>
    fullHeight(context) / 32.0;
double defaultTabTextSize(BuildContext context) => fullHeight(context) / 50.0;
double appBarCircular(BuildContext context) => fullHeight(context) / 25.0;
double searchScreenTopPadding(BuildContext context) =>
    defaultPadding(context) * 7;
double chatScreenHeight(BuildContext context) {
  final x = fullHeight(context);
  return x * 0.7;
}
