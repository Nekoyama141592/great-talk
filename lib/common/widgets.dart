import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';

Widget boldText(String text) =>
    Text(text, style: const TextStyle(fontWeight: FontWeight.bold));

Widget boldSecondaryColorText(String text) => Text(text,
    style:
        const TextStyle(fontWeight: FontWeight.bold, color: kSecondaryColor));
