import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  const BasicPage(
      {Key? key,
      this.appBarText,
      this.floatingActionButton,
      required this.child})
      : super(key: key);
  final String? appBarText;
  final Widget? floatingActionButton;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarText == null
          ? null
          : AppBar(
              title: Text(appBarText!),
            ),
      floatingActionButton: floatingActionButton,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    ));
  }
}
