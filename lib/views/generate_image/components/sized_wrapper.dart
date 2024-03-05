import 'package:flutter/material.dart';

class SizedWrapper extends StatelessWidget {
  const SizedWrapper({super.key, this.child});
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
