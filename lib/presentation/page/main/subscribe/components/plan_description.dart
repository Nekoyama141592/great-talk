import 'package:flutter/material.dart';
import 'package:great_talk/consts/ui/colors.dart';

class PlanDescription extends StatelessWidget {
  const PlanDescription({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check, color: kPrimaryColor),
      title: Text(text),
    );
  }
}
