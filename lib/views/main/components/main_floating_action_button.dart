import 'package:flutter/material.dart';
import 'package:great_talk/consts/colors.dart';
import 'package:great_talk/controllers/create_post_controller.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton({super.key, required this.isShow});
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    if (isShow) {
      return FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: CreatePostController.to.onFloatingActionButtonPressed,
          child: const Icon(Icons.new_label));
    } else {
      return const SizedBox.shrink();
    }
  }
}
