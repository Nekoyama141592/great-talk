import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.e});
  final Object e;
  @override
  Widget build(BuildContext context) {
    debugPrint(e.toString());
    return const Center(
      child: Text('エラーが発生しました'),
    );
  }
}
