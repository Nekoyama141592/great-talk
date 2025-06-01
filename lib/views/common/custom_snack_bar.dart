import 'package:flutter/material.dart';
import 'package:great_talk/consts/colors.dart';

class CustomSnackBar {
  static SnackBar success(BuildContext context, String msg) {
    const color = Colors.blue;
    return _basic(context, msg, color);
  }

  static SnackBar failure(BuildContext context, String msg) {
    const color = Colors.red;
    return _basic(context, msg, color);
  }

  static SnackBar _basic(BuildContext context, String msg, Color color) {
    return SnackBar(
      content: Center(
        child: Text(
          msg,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.blueAccent.withAlpha(alpha90),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      duration: const Duration(seconds: 1),
      elevation: 6.0,
    );
  }
}
