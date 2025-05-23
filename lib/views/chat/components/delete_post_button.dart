import 'package:flutter/material.dart';
import 'package:great_talk/views/components/app_bar_action.dart';

class DeletePostButton extends StatelessWidget {
  const DeletePostButton({super.key, required this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return AppBarAction(
      onTap: onTap,
      child: const Icon(
        Icons.delete,
        color: Colors.purple,
      ),
    );
  }
}
