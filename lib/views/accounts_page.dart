import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';

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
          ListTile(
            title: Obx(() {
              final purchasesController = PurchasesController.to;
              final text = purchasesController.isSubscribing()
                  ? "加入プラン: ${getPlanName(purchasesController.purchases.first.productID)}"
                  : "現在は有料プランに加入していません。";
              return Text(text);
            }),
          ),
          Obx(
            () {
              final publicUser = controller.publicUser.value;
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
                  onTap: () => Get.toNamed("reauthenticate/delete"))
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
