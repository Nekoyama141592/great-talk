import 'package:flutter/material.dart';

class SafeScaffold extends StatelessWidget {
  const SafeScaffold(
      {super.key,
      this.appBar,
      this.floatingActionButton,
      this.drawer,
      required this.child});
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
