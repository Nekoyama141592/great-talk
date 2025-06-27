import 'package:flutter/material.dart';
import 'package:great_talk/consts/colors.dart';
import 'package:great_talk/util/size_core.dart';

class EllipsisText extends Text {
  final String text;
  const EllipsisText(this.text, {Key? key, TextStyle? style})
    : super(text, key: key, style: style, overflow: TextOverflow.ellipsis);
}

class BasicBoldText extends StatelessWidget {
  const BasicBoldText(this.text, {super.key, this.textColor});
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }
}

class BoldWhiteText extends StatelessWidget {
  const BoldWhiteText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}

class TabText extends StatelessWidget {
  const TabText(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).focusColor,
        fontWeight: FontWeight.bold,
        fontSize: SizeCore.defaultTabTextSize(context),
      ),
    );
  }
}

class SecondaryColorText extends Text {
  final String text;
  const SecondaryColorText(this.text, {Key? key})
    : super(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: kSecondaryColor,
        ),
        key: key,
      );
}
