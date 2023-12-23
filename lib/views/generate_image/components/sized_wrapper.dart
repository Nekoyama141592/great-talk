import 'package:flutter/material.dart';

class SizedWrapper extends StatelessWidget {
  const SizedWrapper({Key? key, this.child}) : super(key: key);
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: child,
    );
  }
}
