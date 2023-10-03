import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';

class PlanDescription extends StatelessWidget {
  const PlanDescription({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.check,
        color: kPrimaryColor,
      ),
      title: Text(text),
    );
  }
}
