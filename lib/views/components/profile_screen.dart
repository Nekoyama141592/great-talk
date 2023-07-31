import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/user_profile_controller.dart';
import 'package:great_talk/views/components/refresh_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());
    return Obx(() => RefreshScreen(
        docsController: controller,
        child: controller.passiveUser.value == null
            ? const Text('')
            : Text(controller.passiveUser.value!.typedUserName().value)));
  }
}
