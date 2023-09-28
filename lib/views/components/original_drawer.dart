import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/theme_controller.dart';

class OriginalDrawer extends StatelessWidget {
  const OriginalDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.to;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          ListTile(
              title: const Text("アカウント情報"),
              onTap: () => Get.toNamed('/account')),
          ListTile(
              title: const Text("ミュートしているユーザー"),
              onTap: () => Get.toNamed('/muteUsers')),
          ListTile(
              title: const Text("ミュートしている投稿"),
              onTap: () => Get.toNamed('/mutePosts')),
          ListTile(
              title: const Text("公式コンテンツ"),
              onTap: () => Get.toNamed('/originalContents')),
          Obx(
            () => ListTile(
              title: const Text("テーマ切り替え"),
              trailing: CupertinoSwitch(
                value: themeController.isDarkTheme.value,
                onChanged: themeController.onSwichChanged,
              ),
            ),
          ),
          Obx(() => CurrentUserController.to.isAdmin()
              ? ListTile(
                  title: const Text("管理者専用ページ"),
                  onTap: () => Get.toNamed('/admin'))
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
