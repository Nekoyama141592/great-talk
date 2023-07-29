import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';

class BasicBoldText extends StatelessWidget {
  const BasicBoldText(this.text, {Key? key, this.textColor}) : super(key: key);
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: defaultHeaderTextSize(context)),
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