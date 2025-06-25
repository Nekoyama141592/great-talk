import 'package:flutter/material.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({super.key, required this.onTap, required this.child});
  final void Function()? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(onTap: onTap, child: child),
    );
  }
}
