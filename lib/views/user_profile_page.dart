import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/user_profile_controller.dart';
import 'package:great_talk/views/components/profile_screen.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());
    return Scaffold(
      appBar: AppBar(),
      body: ProfileScreen(
        controller: controller,
      ),
    );
  }
}