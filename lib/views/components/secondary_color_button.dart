import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';

class SecondaryColorButton extends ElevatedButton {
  const SecondaryColorButton(
      {Key? key, required void Function()? onPressed, required Widget child})
      : super(
            key: key,
            onPressed: onPressed,
            child: child,
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(kSecondaryColor)));
}
