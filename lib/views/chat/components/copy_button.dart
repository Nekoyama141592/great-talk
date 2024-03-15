import 'package:flutter/material.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({super.key, required this.onCopyButtonTap});
  final void Function()? onCopyButtonTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCopyButtonTap,
      child: const Icon(Icons.copy),
    );
  }
}
