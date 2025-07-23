import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/presentation/notifier/local_setting/local_setting.dart';
import 'package:great_talk/presentation/notifier/purchases/purchases_notifier.dart';
import 'package:great_talk/presentation/util/texts.dart';
import 'package:great_talk/core/extension/number_format_extension.dart';
import 'package:great_talk/presentation/page/accounts_page.dart';
import 'package:great_talk/presentation/page/admin_page.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';
import 'package:great_talk/presentation/page/mute/mute_posts/mute_posts_page.dart';
import 'package:great_talk/presentation/page/mute/mute_users/mute_users_page.dart';
import 'package:great_talk/presentation/page/user_profile_page.dart';
import 'package:great_talk/presentation/constant/colors.dart';
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            kContentColorDarkTheme,
            Color(0xFF242442),
            Color(0xFF2A2A4A),
          ],
        ),
      ),
      child: Drawer(
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            asyncValue.when(
              data: (state) {
                final user = state.publicUser;
                if (user != null) {
                  return Container(
                    height: 280,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          kPrimaryColor.withAlpha(204),
                          kPrimaryColor,
                          const Color(0xFF00A55C),
                        ],
                      ),
                    ),
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            RouteUtil.pushPath(
                              context,
                              UserProfilePage.generatePath(user.uid),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  if (image != null)
                                    Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white.withAlpha(77),
                                          width: 3,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withAlpha(51),
                                            blurRadius: 12,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: CircleImage(
                                        uint8list: base64Decode(image),
                                        width: 70,
                                        height: 70,
                                      ),
                                    ),
                                  const Spacer(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withAlpha(51),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              EllipsisText(
                                user.nameValue,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  _buildStatItem(
                                    "フォロー",
                                    user.followingCount.formatNumber(),
                                  ),
                                  const SizedBox(width: 24),
                                  _buildStatItem(
                                    "フォロワー",
                                    user.followerCount.formatNumber(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
              loading:
                  () => Container(
                    height: 280,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [kPrimaryColor.withAlpha(204), kPrimaryColor],
                      ),
                    ),
                    child: const SafeArea(
                      bottom: false,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              error:
                  (err, stack) => Container(
                    height: 280,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [kPrimaryColor.withAlpha(204), kPrimaryColor],
                      ),
                    ),
                    child: const SafeArea(
                      bottom: false,
                      child: Center(
                        child: Text(
                          "ユーザー情報の取得に失敗しました",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 16),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildModernListTile(
                      icon: Icons.account_circle_outlined,
                      title: "アカウント情報",
                      onTap:
                          () => RouteUtil.pushPath(context, AccountPage.path),
                    ),
                    _buildInfoTile(
                      icon: Icons.smart_toy_outlined,
                      title: "モデル",
                      subtitle: purchaseState?.model() ?? '',
                    ),
                    _buildModernListTile(
                      icon: Icons.person_off_outlined,
                      title: "ミュートしているユーザー",
                      onTap:
                          () => RouteUtil.pushPath(context, MuteUsersPage.path),
                    ),
                    _buildModernListTile(
                      icon: Icons.post_add_outlined,
                      title: "ミュートしている投稿",
                      onTap:
                          () => RouteUtil.pushPath(context, MutePostsPage.path),
                    ),
                    _buildSwitchTile(
                      icon: Icons.message_outlined,
                      title: "最初のメッセージを受け取る",
                      value: settingState.needFirstMessage,
                      onChanged:
                          ref
                              .read(localSettingProvider.notifier)
                              .onNeedFirstMessageSwichChanged,
                    ),
                    if (isAdmin)
                      _buildModernListTile(
                        icon: Icons.admin_panel_settings_outlined,
                        title: "管理者専用ページ",
                        onTap:
                            () => RouteUtil.pushPath(context, AdminPage.path),
                        isAdmin: true,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Row(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          label,
          style: TextStyle(color: Colors.white.withAlpha(204), fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildModernListTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    bool isAdmin = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color:
            isAdmin ? kPrimaryColor.withAlpha(26) : Colors.white.withAlpha(13),
        borderRadius: BorderRadius.circular(12),
        border: isAdmin ? Border.all(color: kPrimaryColor.withAlpha(77)) : null,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:
                isAdmin
                    ? kPrimaryColor.withAlpha(51)
                    : Colors.white.withAlpha(26),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isAdmin ? kPrimaryColor : Colors.white.withAlpha(204),
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isAdmin ? kPrimaryColor : Colors.white,
            fontSize: 16,
            fontWeight: isAdmin ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color:
              isAdmin
                  ? kPrimaryColor.withAlpha(179)
                  : Colors.white.withAlpha(153),
          size: 16,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(13),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(26),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white.withAlpha(204), size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle:
            subtitle.isNotEmpty
                ? Text(
                  subtitle,
                  style: TextStyle(
                    color: kPrimaryColor.withAlpha(204),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
                : null,
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool>? onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(13),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(26),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white.withAlpha(204), size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: kPrimaryColor,
            thumbColor: Colors.white,
            inactiveTrackColor: Colors.white.withAlpha(51),
          ),
        ),
      ),
    );
  }
}
