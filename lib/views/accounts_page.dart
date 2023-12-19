import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/views/auth/reauthenticate_to_delete_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key,
  }) : super(key: key);
  static const path = "/account";

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
          ListTile(
            title: Obx(() => Text(PurchasesController.to.subscriptionText)),
          ),
          Obx(
            () {
              final publicUser = controller.rxPublicUser.value;
              if (publicUser == null || !publicUser.isInappropriate()) {
                return const SizedBox.shrink();
              }

              return ListTile(
                title: Text(
                  "非表示の理由: \n${publicUser.inappropriateReason(controller.currentUid())}",
                  style: const TextStyle(color: Colors.red),
                ),
              );
            },
          ),
          Obx(() => controller.isLoggedIn()
              ? ListTile(
                  title: const Text("ログアウトする"),
                  onTap: controller.onLogoutButtonPressed,
                )
              : const SizedBox.shrink()),
          Obx(() => controller.isLoggedIn()
              ? ListTile(
                  title: const Text("ユーザーを消去する"),
                  onTap: () => Get.toNamed(ReauthenticateToDeletePage.path))
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
