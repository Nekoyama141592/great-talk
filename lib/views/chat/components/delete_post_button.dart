import 'package:flutter/material.dart';
import 'package:great_talk/controllers/chat_controller.dart';
import 'package:great_talk/views/components/app_bar_action.dart';

class DeletePostButton extends StatelessWidget {
  const DeletePostButton({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = ChatController.to;
    return AppBarAction(
      onTap: controller.onDeleteButtonPressed,
      child: const Icon(
        Icons.delete,
        color: Colors.purple,
      ),
    );
  }
}
