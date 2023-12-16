import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton(
      {Key? key, required this.controller, required this.pageIndex})
      : super(key: key);
  final PageController controller;
  final ValueNotifier<int> pageIndex;
  @override
  Widget build(BuildContext context) {
    final value = pageIndex.value;
    if (value == 0) {
      return FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            final publicUser = CurrentUserController.to.rxPublicUser.value;
            String msg = "";
            if (publicUser == null) {
              msg = "投稿するにはログインが必要です";
            } else if (publicUser.hasNoBio) {
              msg = "投稿するにはプロフィールを編集してください";
            }
            if (msg.isEmpty) {
              Get.toNamed("/createPost");
            } else {
              UIHelper.showErrorFlutterToast(msg);
              controller.animateToPage(4,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn);
            }
          },
          child: const Icon(Icons.new_label));
    } else if (value == 4) {
      return FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {
            if (CurrentUserController.to.hasNoPublicUser()) {
              UIHelper.showFlutterToast("投稿するにはログインが必要です");
              return;
            }
            Get.toNamed("/createPost");
          },
          child: const Icon(Icons.new_label));
    } else {
      return const SizedBox.shrink();
    }
  }
}
