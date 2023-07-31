import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/controllers/my_profile_controller.dart';
import 'package:great_talk/views/screen/profile_screen/profile_screen.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyProfileController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          onPressed: () {},
          child: const Icon(Icons.new_label)),
      body: ProfileScreen(
        controller: controller,
      ),
    );
  }
}
