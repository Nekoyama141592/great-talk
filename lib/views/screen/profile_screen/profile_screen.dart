import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/profile_controller.dart';
import 'package:great_talk/views/screen/profile_screen/components/edit_button.dart';
import 'package:great_talk/views/screen/profile_screen/components/follow_button.dart';
import 'package:great_talk/views/screen/refresh_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.controller}) : super(key: key);
  final ProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        controller.isMyProfile ? const EditButton() : const FollowButton(),
        Expanded(
            child: RefreshScreen(
                docsController: controller,
                child: Obx(() {
                  if (controller.passiveUser.value == null) {
                    return const Text('');
                  } else {
                    return Text(
                        controller.passiveUser.value!.typedUserName().value);
                  }
                })))
      ],
    );
  }
}
