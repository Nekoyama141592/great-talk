import 'package:flutter/material.dart';
import 'package:great_talk/core/util/size_core.dart';

class BasicHeightBox extends StatelessWidget {
  const BasicHeightBox({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: SizeCore.defaultPadding(context));
  }
}
