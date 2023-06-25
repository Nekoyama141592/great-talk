import 'package:flutter/material.dart';
import 'package:great_talk/common/doubles.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: defaultPadding(context)),
        width: size.width * 0.9,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(8)),
        child: child,
      ),
    );
  }
}
