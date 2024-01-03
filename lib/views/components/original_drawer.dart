import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/controllers/theme_controller.dart';
import 'package:great_talk/views/accounts_page.dart';
import 'package:great_talk/views/admin_page.dart';
import 'package:great_talk/views/bookmark_categories_page.dart';
import 'package:great_talk/views/mute/mute_posts/mute_posts_page.dart';
import 'package:great_talk/views/mute/mute_users/mute_users_page.dart';
import 'package:great_talk/views/original_contents_page.dart';

class OriginalDrawer extends StatelessWidget {
  const OriginalDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeController = ThemeController.to;
    final purchasesController = PurchasesController.to;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          ListTile(
              title: const Text("アカウント情報"),
              onTap: () {
                PurchasesController.to.restorePurchases();
                Get.toNamed(AccountPage.path);
              }),
          ListTile(
              title: const Text("ミュートしているユーザー"),
              onTap: () => Get.toNamed(MuteUsersPage.path)),
          ListTile(
              title: const Text("ミュートしている投稿"),
              onTap: () => Get.toNamed(MutePostsPage.path)),
          ListTile(
              title: const Text("公式コンテンツ"),
              onTap: () => Get.toNamed(OriginalContentsPage.path)),
          ListTile(
              title: const Text("ブックマーク"),
              onTap: () => Get.toNamed(BookmarkCategoriesPage.path)),
          Obx(
            () => ListTile(
              title: const Text("テーマ切り替え"),
              trailing: CupertinoSwitch(
                value: themeController.isDarkTheme.value,
                onChanged: themeController.onSwichChanged,
              ),
            ),
          ),
          ListTile(
            title: const Text("使用モデルID"),
            subtitle: Obx(() => Text(purchasesController.model().model)),
          ),
          Obx(() => CurrentUserController.to.isAdmin()
              ? ListTile(
                  title: const Text("管理者専用ページ"),
                  onTap: () => Get.toNamed(AdminPage.path))
              : const SizedBox.shrink())
        ],
      ),
    );
  }
}
