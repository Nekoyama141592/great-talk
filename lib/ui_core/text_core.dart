import 'package:flutter/material.dart';

class TextCore {
  static bool doesOverFlow(String text, TextStyle textStyle, double maxWidth) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 0,
      );
    return textPainter.size.width > maxWidth;
  }
}
