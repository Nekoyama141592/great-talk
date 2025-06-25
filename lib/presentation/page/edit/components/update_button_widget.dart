import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(press: onPressed, text: "更新する");
  }
}
