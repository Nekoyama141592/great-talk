import 'package:flutter/material.dart';
import 'package:great_talk/controllers/my_profile_controller.dart';
import 'package:great_talk/views/screen/profile_screen/profile_screen.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = MyProfileController.to;

    return ProfileScreen(
      controller: controller,
    );
  }
}
