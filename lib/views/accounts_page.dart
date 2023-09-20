import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/ints.dart';
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
          ListTile(
              title: Obx(
                  () => SelectableText("ユーザーID: ${controller.currentUid()}"))),
          ListTile(title: Obx(() {
            final negativeScore =
                controller.publicUser.value?.typedUserName().negativeScore ?? 0;
            final text = "ユーザー名ネガティブスコア :$negativeScore";
            return negativeScore > negativeLimit
                ? Text(
                    text,
                    style: const TextStyle(color: Colors.red),
                  )
                : Text(text);
          })),
          ListTile(title: Obx(() {
            final negativeScore =
                controller.publicUser.value?.typedBio().negativeScore ?? 0;
            final text = "説明文ネガティブスコア :$negativeScore";
            return negativeScore > negativeLimit
                ? Text(
                    text,
                    style: const TextStyle(color: Colors.red),
                  )
                : Text(text);
          })),
          Obx(() => controller.isLoggedIn()
              ? ListTile(
                  title: const Text("ログアウトする"),
                  onTap: controller.onLogoutButtonPressed,
                )
              : const SizedBox.shrink()),
          Obx(() => controller.isLoggedIn()
              ? ListTile(
                  title: const Text("ユーザーを消去する"),
                  onTap: () => Get.toNamed("reauthenticate/delete"))
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
