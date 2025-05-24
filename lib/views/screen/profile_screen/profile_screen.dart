import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
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
import 'package:great_talk/views/search_user_posts_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key, required this.controller,required this.passiveUid});
  final DocsController controller;
  final String passiveUid;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final children = <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          onTap: Get.back,
          child: const Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
        ),
      ),
      Obx(() => EllipsisText(
            controller.rxPassiveUser.value!.nameValue,
            style: StyleUtility.bold25(),
          )),
      Row(
        children: [
          Obx(
            () => controller.rxPassiveUser.value == null
                ? const SizedBox.shrink()
                : CircleImage(
                    uint8list: controller.rxUint8list.value,
                  ),
          ),
          const BasicWidthBox(),
          Obx(() => Text(
                "フォロー ${controller.rxPassiveUser.value?.followingCount.formatNumber() ?? 0}",
              )),
          const BasicWidthBox(),
          Obx(() => Text(
                "フォロワー ${controller.rxPassiveUser.value?.followerCount.formatNumber() ?? 0}",
              ))
        ],
      ),
      // 横向きなら、表示崩れを防止するためにbioを表示しない。
      Obx(() => MediaQuery.of(context).orientation == Orientation.landscape
          ? const SizedBox.shrink()
          : Align(
              alignment: Alignment.centerLeft,
              child: Text(controller.rxPassiveUser.value!
                  .typedBio()
                  .value
                  .removeNewlinesAndSpaces()),
            )),
      Row(
        children: [
          InkWell(
            onTap: () => Get.toNamed(
                SearchUserPostsPage.generatePath(passiveUid)),
            child: const Icon(
              Icons.search,
              size: 40.0,
            ),
          ),
          Obx(() => (controller.rxPassiveUser.value?.isOfficial ?? false)
              ? const OfficialMark()
              : const SizedBox.shrink())
        ],
      ),
    ];
    return Obx(() => GradientScreen(
          baseColor: Theme.of(context).colorScheme.onBackground,
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (controller.rxPassiveUser.value != null) ...children,
                  Obx(() {
                    final passiveUser = controller.rxPassiveUser.value;
                    if (passiveUser == null) {
                      return const SizedBox.shrink();
                    }
                    return passiveUser.uid ==
                            ref.watch(streamAuthUidProvider).value
                        ? const EditButton()
                        : const FollowButton();
                  })
                ],
              ),
            ),
          ),
          child: RefreshScreen(
            docsController: controller,
          ),
        ));
  }
}
