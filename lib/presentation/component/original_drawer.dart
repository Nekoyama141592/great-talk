import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/presentation/notifier/local_setting/local_setting.dart';
import 'package:great_talk/presentation/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/presentation/util/texts.dart';
import 'package:great_talk/core/extension/number_format_extension.dart';
import 'package:great_talk/presentation/util/style_utility.dart';
import 'package:great_talk/presentation/page/accounts_page.dart';
import 'package:great_talk/presentation/page/admin_page.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/component/basic_width_box.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';
import 'package:great_talk/presentation/page/mute/mute_posts/mute_posts_page.dart';
import 'package:great_talk/presentation/page/mute/mute_users/mute_users_page.dart';
import 'package:great_talk/presentation/page/user_profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OriginalDrawer extends ConsumerWidget {
  const OriginalDrawer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingState = ref.watch(localSettingProvider);
    final asyncValue = ref.watch(currentUserNotifierProvider);
    final currentUser = asyncValue.value;
    final isAdmin = currentUser?.isAdmin() ?? false;
    final image = currentUser?.base64;
    final purchaseState = ref.watch(purchasesNotifierProvider).value;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          asyncValue.when(
            data: (state) {
              final user = state.publicUser;
              if (user != null) {
                return DrawerHeader(
                  child: InkWell(
                    child: Column(
                      children: [
                        EllipsisText(
                          user.nameValue,
                          style: StyleUiUtil.bold25(),
                        ),
                        const BasicHeightBox(),
                        Row(
                          children: [
                            if (image != null)
                              CircleImage(uint8list: base64Decode(image)),
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      RouteUtil.pushPath(
                        context,
                        UserProfilePage.generatePath(user.uid),
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
            loading:
                () => const DrawerHeader(
                  child: Center(child: CircularProgressIndicator()),
                ),
            error:
                (err, stack) => DrawerHeader(
                  child: Center(child: Text("ユーザー情報の取得に失敗しました")),
                ),
          ),
          ListTile(
            title: const Text("アカウント情報"),
            onTap: () {
              RouteUtil.pushPath(context, AccountPage.path);
            },
          ),
          ListTile(title: Text("モデル: ${purchaseState?.model() ?? ''}")),
          ListTile(
            title: const Text("ミュートしているユーザー"),
            onTap: () => RouteUtil.pushPath(context, MuteUsersPage.path),
          ),
          ListTile(
            title: const Text("ミュートしている投稿"),
            onTap: () => RouteUtil.pushPath(context, MutePostsPage.path),
          ),
          ListTile(
            title: const Text("テーマ切り替え"),
            trailing: CupertinoSwitch(
              value: settingState.isDarkTheme,
              onChanged:
                  ref.read(localSettingProvider.notifier).onThemeSwichChanged,
            ),
          ),
          ListTile(
            title: const Text("最初のメッセージを受け取る"),
            trailing: CupertinoSwitch(
              value: settingState.needFirstMessage,
              onChanged:
                  ref
                      .read(localSettingProvider.notifier)
                      .onNeedFirstMessageSwichChanged,
            ),
          ),
          if (isAdmin)
            ListTile(
              title: const Text("管理者専用ページ"),
              onTap: () => RouteUtil.pushPath(context, AdminPage.path),
            ),
        ],
      ),
    );
  }
}
