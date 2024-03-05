import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/mute_users_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/views/mute/mute_users/component/mute_user_card.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class MuteUsersPage extends StatelessWidget {
  const MuteUsersPage({super.key});
  static const path = "/muteUsers";
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MuteUsersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("ミュートしているユーザー一覧"),
      ),
      body: RefreshScreen(
        docsController: controller,
        child: Obx(() => ListView.builder(
            itemCount: controller.qDocInfoList.length,
            itemBuilder: (c, i) {
              final passiveUser =
                  PublicUser.fromJson(controller.qDocInfoList[i].qDoc.data());
              final uint8list = controller.qDocInfoList[i].userImage;
              return MuteUserCard(
                  passiveUser: passiveUser, uint8list: uint8list);
            })),
      ),
    );
  }
}
