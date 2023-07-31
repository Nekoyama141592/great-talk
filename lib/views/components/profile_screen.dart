import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/profile_controller.dart';
import 'package:great_talk/views/components/refresh_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.controller}) : super(key: key);
  final ProfileController controller;
  @override
  Widget build(BuildContext context) {
    return RefreshScreen(
        docsController: controller,
        child: Obx(() => controller.passiveUser.value == null
            ? const Text('')
            : Text(controller.passiveUser.value!.typedUserName().value)));
  }
}