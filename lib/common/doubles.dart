import 'package:flutter/material.dart';

double fullHeight(BuildContext context) => MediaQuery.of(context).size.height;
double userImageSize(BuildContext context) => fullHeight(context) / 12.0;
double defaultPadding(BuildContext context) => fullHeight(context) / 100.0;
double defaultHeaderTextSize(BuildContext context) =>
    fullHeight(context) / 32.0;
double appBarCircular(BuildContext context) => fullHeight(context) / 25.0;

double chatScreenHeight(BuildContext context) {
  final x = fullHeight(context);
  return x > 800 && x < 1000 ? x * 0.7 : x * 0.8; 
}