import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/providers/view_model/docs/docs_view_model.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/screen/profile_screen/profile_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});
  static const path = "/users/:uid";
  static String generatePath(String uid) => "/users/$uid";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = Get.parameters['uid'];
    final asyncValue = ref.watch(
      docsViewModelProvider(DocsType.userProfiles, passiveUid: uid),
    );
    final notifier = ref.read(
      docsViewModelProvider(DocsType.userProfiles).notifier,
    );
    return Scaffold(
      body: AsyncScreen(
        asyncValue: asyncValue,
        data: (state) {
          return ProfileScreen(
            state: state,
            onLoading: notifier.onLoading,
            onReload: notifier.onReload,
            follow: notifier.onFollowPressed,
            unFollow: notifier.onUnFollowPressed,
          );
        },
      ),
    );
  }
}
