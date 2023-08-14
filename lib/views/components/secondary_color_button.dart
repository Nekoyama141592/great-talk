import 'package:flutter/material.dart';

class PurchaseButton extends ElevatedButton {
  PurchaseButton(
      {Key? key,
      required void Function()? onPressed,
      required Widget child,
      required Color color})
      : super(
            key: key,
            onPressed: onPressed,
            child: child,
            style:
                ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)));
}
