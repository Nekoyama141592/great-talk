import 'package:flutter/material.dart';
import 'package:great_talk/presentation/constant/colors.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({
    super.key,
    required this.isPurchased,
    required this.onPressed,
  });
  final bool isPurchased;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    const textColor = Colors.white;
    return isPurchased
        ? RoundedButton(
          textColor: textColor,
          buttonColor: Colors.grey.shade800,
          text: "契約中",
        )
        : RoundedButton(
          textColor: textColor,
          buttonColor: kSecondaryColor,
          text: "契約する",
          press: onPressed,
        );
  }
}
