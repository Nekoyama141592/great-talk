import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar blue(BuildContext context, String msg) {
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
        backgroundColor: Colors.blueAccent.withValues(alpha: 0.9),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        duration: const Duration(seconds: 1),
        elevation: 6.0,
      );
  }
}