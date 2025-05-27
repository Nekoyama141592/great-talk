import 'package:flutter/material.dart';

class SubscribedCopyableText extends StatelessWidget {
  const SubscribedCopyableText({super.key, required this.data, this.style});
  final String data;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return SelectableText(data);
  }
}
