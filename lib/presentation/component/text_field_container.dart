import 'package:flutter/material.dart';
import 'package:great_talk/core/util/size_util.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: SizeUtil.defaultPadding(context),
        ),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).focusColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: child,
      ),
    );
  }
}
