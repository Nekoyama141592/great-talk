import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/user_profile_controller.dart';
import 'package:great_talk/views/components/rounded_button.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = UserProfileController.to;
    return Obx(() => !CurrentUserController.to.followingUids
            .contains(controller.passiveUid())
        ? RoundedButton(
            text: "フォロー",
            textColor: Colors.white,
            press: controller.onFollowPressed)
        : RoundedButton(
            text: "アンフォロー",
            press: controller.onUnFollowPressed,
            buttonColor: Colors.grey,
          ));
  }
}
