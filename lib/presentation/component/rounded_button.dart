// material
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:great_talk/presentation/util/texts.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    this.press,
    this.buttonColor,
    this.textColor,
    this.icon,
    this.widthRate = 0.85,
    this.enabled = true,
  });

  final String text;
  final double widthRate;
  final Function()? press;
  final Color? buttonColor, textColor;
  final Widget? icon;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final effectiveButtonColor =
        enabled ? (buttonColor ?? Theme.of(context).primaryColor) : Colors.grey;
    final effectiveTextColor =
        enabled
            ? (textColor ?? Theme.of(context).scaffoldBackgroundColor)
            : Colors.grey[600];

    return SizedBox(
      width: size.width * widthRate,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(SizeUtil.defaultPadding(context)),
        child: ElevatedButton(
          style: TextButton.styleFrom(backgroundColor: effectiveButtonColor),
          onPressed: enabled ? press : null,
          child:
              icon != null
                  ? Row(
                    children: [
                      icon!,
                      const SizedBox(width: 20.0),
                      BasicBoldText(text, textColor: effectiveTextColor),
                    ],
                  )
                  : BasicBoldText(text, textColor: effectiveTextColor),
        ),
      ),
    );
  }
}
