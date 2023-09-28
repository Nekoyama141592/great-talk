import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/doubles.dart';

class EllipsisText extends Text {
  final String text;
  const EllipsisText(this.text, {Key? key, TextStyle? style})
      : super(
          text,
          key: key,
          style: style,
          overflow: TextOverflow.ellipsis,
        );
}

class BasicBoldText extends StatelessWidget {
  const BasicBoldText(this.text, {Key? key, this.textColor}) : super(key: key);
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor, fontWeight: FontWeight.bold, fontSize: 20.0),
    );
  }
}

class BoldWhiteText extends StatelessWidget {
  const BoldWhiteText(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TabText extends StatelessWidget {
  const TabText(this.text, {Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Theme.of(context).focusColor,
          fontWeight: FontWeight.bold,
          fontSize: defaultTabTextSize(context)),
    );
  }
}

class SecondaryColorText extends Text {
  final String text;
  const SecondaryColorText(this.text, {Key? key})
      : super(text,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: kSecondaryColor),
            key: key);
}
