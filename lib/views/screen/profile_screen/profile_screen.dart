import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/utility/style_utility.dart';
import 'package:great_talk/views/components/basic_width_box.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';
import 'package:great_talk/views/components/official_mark.dart';
import 'package:great_talk/views/screen/gradient_screen.dart';
import 'package:great_talk/views/screen/profile_screen/components/edit_button.dart';
import 'package:great_talk/views/screen/profile_screen/components/follow_button.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    super.key,
    required this.controller,
    required this.passiveUid,
    required this.follow,
    required this.unFollow,
    required this.currentUid,
  });
  final DocsController controller;
  final String passiveUid;
  final void Function()? follow;
  final void Function()? unFollow;
  final String currentUid;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: Get.back,
          child: const Icon(Icons.arrow_back, size: 30.0),
        ),
      ),
      Obx(
        () => EllipsisText(
          controller.state.value.passiveUser!.nameValue,
          style: StyleUtility.bold25(),
        ),
      ),
      Row(
        children: [
          Obx(
            () =>
                controller.state.value.passiveUser == null
                    ? const SizedBox.shrink()
                    : CircleImage(uint8list: controller.state.value.uint8list),
          ),
          const BasicWidthBox(),
          Obx(
            () => Text(
              "フォロー ${controller.state.value.passiveUser?.followingCount.formatNumber() ?? 0}",
            ),
          ),
          const BasicWidthBox(),
          Obx(
            () => Text(
              "フォロワー ${controller.state.value.passiveUser?.followerCount.formatNumber() ?? 0}",
            ),
          ),
        ],
      ),
      // 横向きなら、表示崩れを防止するためにbioを表示しない。
      Obx(
        () =>
            MediaQuery.of(context).orientation == Orientation.landscape
                ? const SizedBox.shrink()
                : Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    controller.state.value.passiveUser!
                        .typedBio()
                        .value
                        .removeNewlinesAndSpaces(),
                  ),
                ),
      ),
      Row(
        children: [
          Obx(
            () =>
                (controller.state.value.passiveUser?.isOfficial ?? false)
                    ? const OfficialMark()
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    ];
    return Obx(
      () => GradientScreen(
        baseColor: Theme.of(context).colorScheme.onBackground,
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (controller.state.value.passiveUser != null) ...children,
                Obx(() {
                  final passiveUser = controller.state.value.passiveUser;
                  if (passiveUser == null) {
                    return const SizedBox.shrink();
                  }
                  final isFollow = TokensController.to.followingUids.contains(
                    controller.passiveUid(),
                  );
                  return passiveUser.uid ==
                          ref.watch(streamAuthUidProvider).value
                      ? const EditButton()
                      : FollowButton(
                        isFollow: isFollow,
                        follow: follow,
                        unFollow: unFollow,
                      );
                }),
              ],
            ),
          ),
        ),
        child: RefreshScreen(
          docsController: controller,
          currentUid: currentUid,
        ),
      ),
    );
  }
}
