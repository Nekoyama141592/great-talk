import 'package:flutter/material.dart';

double fullHeight(BuildContext context) => MediaQuery.of(context).size.height;
double userImageSize(BuildContext context) => fullHeight(context) / 12.0;
double defaultPadding(BuildContext context) => fullHeight(context) / 100.0;
double defaultHeaderTextSize(BuildContext context) =>
    fullHeight(context) / 32.0;
double defaultTabTextSize(BuildContext context) => fullHeight(context) / 50.0;
double appBarCircular(BuildContext context) => fullHeight(context) / 25.0;
double searchScreenTopPadding(BuildContext context) =>
    defaultPadding(context) * 7;
double chatScreenHeight(BuildContext context) {
  final x = fullHeight(context);
  return x > 800 && x < 1000 ? x * 0.7 : x * 0.8;
}

// chatGPT request
const double defaultTemperature = 0.3;
const double defaultTopP = 1.0;
const double defaultPresencePenalty = 0.0;
const double defaultFrequencyPenalty = 0.0;
