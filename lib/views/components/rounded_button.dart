// material
import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/texts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.buttonColor,
    this.textColor,
    this.icon,
    this.widthRate = 0.85,
  }) : super(key: key);

  final String text;
  final double widthRate;
  final Function()? press;
  final Color? buttonColor, textColor;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: defaultPadding(context)),
      width: size.width * widthRate,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(defaultPadding(context)),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                buttonColor ?? Theme.of(context).primaryColor),
          ),
          onPressed: press,
          child: Row(
            children: [
              if (icon != null) icon!,
              const SizedBox(
                width: 20.0,
              ),
              BasicBoldText(
                text,
                textColor: textColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
