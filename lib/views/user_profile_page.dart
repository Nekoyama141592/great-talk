import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/user_profile_controller.dart';
import 'package:great_talk/views/screen/profile_screen/profile_screen.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);
  static const path = "/users/:uid";
  static String generatePath(String uid) => "/users/$uid";
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserProfileController());
    return Scaffold(
      body: ProfileScreen(
        controller: controller,
      ),
    );
  }
}
