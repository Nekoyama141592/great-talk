import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/mute_users_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class MuteUsersPage extends StatelessWidget {
  const MuteUsersPage({Key? key}) : super(key: key);
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
            itemCount: controller.docs.length,
            itemBuilder: (c, i) {
              final user = PublicUser.fromJson(controller.docs[i].data());
              return InkWell(
                onTap: () => controller.unMuteUser(user.uid),
                child: Text(user.typedUserName().value),
              );
            })),
      ),
    );
  }
}
