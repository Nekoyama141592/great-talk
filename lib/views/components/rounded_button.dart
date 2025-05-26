// material
import 'package:flutter/material.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/ui_core/texts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    this.press,
    this.buttonColor,
    this.textColor,
    this.icon,
    this.widthRate = 0.85,
  });

  final String text;
  final double widthRate;
  final Function()? press;
  final Color? buttonColor, textColor;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * widthRate,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(defaultPadding(context)),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              buttonColor ?? Theme.of(context).primaryColor,
            ),
          ),
          onPressed: press,
          child:
              icon != null
                  ? Row(
                    children: [
                      icon!,
                      const SizedBox(width: 20.0),
                      BasicBoldText(text, textColor: textColor),
                    ],
                  )
                  : BasicBoldText(
                    text,
                    textColor:
                        textColor ?? Theme.of(context).scaffoldBackgroundColor,
                  ),
        ),
      ),
    );
  }
}
