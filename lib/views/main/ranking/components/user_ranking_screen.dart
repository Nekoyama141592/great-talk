import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/user_ranking_controller.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class UserRankingScreen extends StatelessWidget {
  const UserRankingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserRankingController());
    return RefreshScreen(docsController: controller);
  }
}
