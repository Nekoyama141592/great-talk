import 'package:flutter/material.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/controllers/create_post_controller.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton(
      {Key? key, required this.controller, required this.pageIndex})
      : super(key: key);
  final PageController controller;
  final ValueNotifier<int> pageIndex;
  @override
  Widget build(BuildContext context) {
    final value = pageIndex.value;
    if (value == 0 || value == 4) {
      return FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () => CreatePostController.to
              .onFloatingActionButtonPressed(controller, pageIndex.value),
          child: const Icon(Icons.new_label));
    } else {
      return const SizedBox.shrink();
    }
  }
}
