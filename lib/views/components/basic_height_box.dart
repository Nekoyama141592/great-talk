import 'package:flutter/material.dart';
import 'package:great_talk/core/doubles.dart';

class BasicHeightBox extends StatelessWidget {
  const BasicHeightBox({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: defaultPadding(context),
    );
  }
}
