import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/user_ranking_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/views/components/user_card.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class UserRankingScreen extends StatelessWidget {
  const UserRankingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserRankingController());
    return Obx(() => RefreshScreen(
        docsController: controller,
        child: ListView.builder(
            itemCount: controller.docs.length,
            itemBuilder: (c, i) {
              final publicUser = PublicUser.fromJson(controller.docs[i].data());
              final uint8list = controller.images[i];
              return UserCard(publicUser: publicUser, uint8list: uint8list);
            })));
  }
}
