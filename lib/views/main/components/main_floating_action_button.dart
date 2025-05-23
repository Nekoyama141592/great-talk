import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/colors.dart';
import 'package:great_talk/views/create_post/create_post_page.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton({super.key, required this.isShow});
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    if (isShow) {
      return FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () => Get.toNamed(CreatePostPage.path),
          child: const Icon(Icons.new_label));
    } else {
      return const SizedBox.shrink();
    }
  }
}
