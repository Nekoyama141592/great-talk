import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/providers/global/local_setting/local_setting.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/utility/style_utility.dart';
import 'package:great_talk/views/accounts_page.dart';
import 'package:great_talk/views/admin_page.dart';
import 'package:great_talk/views/auth/login_page.dart';
import 'package:great_talk/views/bookmark_categories_page.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/basic_width_box.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';
import 'package:great_talk/views/mute/mute_posts/mute_posts_page.dart';
import 'package:great_talk/views/mute/mute_users/mute_users_page.dart';
import 'package:great_talk/views/user_profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OriginalDrawer extends ConsumerWidget {
  const OriginalDrawer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserController = CurrentUserController.to;
    final settingState = ref.watch(localSettingProvider);
    final purchasesController = PurchasesController.to;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          Obx(() {
            final user = currentUserController.rxPublicUser.value;
            if (user != null) {
              return DrawerHeader(
                  child: InkWell(
                      child: Column(
                        children: [
                          EllipsisText(
                            user.nameValue,
                            style: StyleUtility.bold25(),
                          ),
                          const BasicHeightBox(),
                          Row(
                            children: [
                              CircleImage(
                                uint8list:
                                    CurrentUserController.to.rxUint8list.value,
                              ),
                              const BasicWidthBox(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "フォロー ${user.followingCount.formatNumber()}",
                                  ),
                                  const BasicHeightBox(),
                                  Text(
                                    "フォロワー ${user.followerCount.formatNumber()}",
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      onTap: () {
                        Get.toNamed(UserProfilePage.generatePath(user.uid));
                      }));
            } else {
              return ListTile(
                  title: const Text("ログインする"),
                  onTap: () {
                    Get.toNamed(LoginPage.path);
                  });
            }
          }),
          ListTile(
              title: const Text("アカウント情報"),
              onTap: () {
                Get.toNamed(AccountPage.path);
              }),
          ListTile(
              title: const Text("ミュートしているユーザー"),
              onTap: () => Get.toNamed(MuteUsersPage.path)),
          ListTile(
              title: const Text("ミュートしている投稿"),
              onTap: () => Get.toNamed(MutePostsPage.path)),
          ListTile(
              title: const Text("ブックマーク"),
              onTap: () => Get.toNamed(BookmarkCategoriesPage.path)),
          Obx(
            () => ListTile(
              title: const Text("テーマ切り替え"),
              trailing: CupertinoSwitch(
                value: settingState.isDarkTheme,
                onChanged:
                    ref.read(localSettingProvider.notifier).onThemeSwichChanged,
              ),
            ),
          ),
          Obx(
            () => ListTile(
              title: const Text("最初のメッセージを受け取る"),
              trailing: CupertinoSwitch(
                value: settingState.needFirstMessage,
                onChanged: ref
                    .read(localSettingProvider.notifier)
                    .onNeedFirstMessageSwichChanged,
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
