import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/views/main/components/main_floating_action_button.dart';
import 'package:great_talk/views/screen/profile_screen/profile_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});
  static const path = "/users/:uid";
  static String generatePath(String uid) => "/users/$uid";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = Get.put(DocsController(DocsType.userProfiles));
    return Obx(
      () => Scaffold(
        floatingActionButton:
            controller.isMyProfile()
                ? const MainFloatingActionButton(isShow: true)
                : null,
        body: ProfileScreen(
          currentUid: ref.watch(streamAuthUidProvider).value!,
          controller: controller,
          passiveUid: controller.passiveUid(),
          follow: controller.onFollowPressed,
          unFollow: controller.onUnFollowPressed,
        ),
      ),
    );
  }
}
