import 'package:flutter/material.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedButton(
      text: "送信",
      // ローディング中はnullを渡し、ボタンを非活性化
      press: isLoading ? null : onPressed,
      buttonColor: Theme.of(context).primaryColor,
      textColor: Colors.white,
    );
  }
}
