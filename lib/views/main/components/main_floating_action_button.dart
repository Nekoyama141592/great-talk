import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/controllers/create_post_controller.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton(
      {super.key, required this.controller, required this.pageIndex});
  final PageController controller;
  final ValueNotifier<int> pageIndex;
  @override
  Widget build(BuildContext context) {
    final value = pageIndex.value;
    if (value == 0 || value == 1) {
      return FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: CreatePostController.to.onFloatingActionButtonPressed,
          child: const Icon(Icons.new_label));
    } else {
      return const SizedBox.shrink();
    }
  }
}
