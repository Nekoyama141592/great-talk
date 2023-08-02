import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CurrentUserController.to;
    return Scaffold(
      appBar: AppBar(
        title: const Text("アカウントページ"),
      ),
      body: ListView(
        children: [
          ListTile(
              title: Obx(
                  () => Text("認証情報: ${controller.currentAuthStateString()}"))),
          Obx(() => controller.isLoggedIn()
              ? ListTile(
                  title: const Text("ログアウトする"),
                  onTap: controller.onLogoutButtonPressed,
                )
              : const SizedBox.shrink()),
          Obx(() => controller.isLoggedIn()
              ? ListTile(
                  title: const Text("ユーザーを消去する"),
                  onTap: controller.onDeleteUserButtonPressed,
                )
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
