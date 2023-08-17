import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/abstract/profile_controller.dart';
import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/extensions/string_extension.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/utility/style_utility.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/screen/gradient_screen.dart';
import 'package:great_talk/views/screen/profile_screen/components/edit_button.dart';
import 'package:great_talk/views/screen/profile_screen/components/follow_button.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class ProfileScreen extends StatelessWidget with CurrentUserMixin {
  const ProfileScreen({Key? key, required this.controller}) : super(key: key);
  final ProfileController controller;
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      if (!controller.isMyProfile)
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
            controller.passiveUser.value!.typedUserName().value,
            style: StyleUtility.bold25(),
          )),
      Row(
        children: [
          Obx(
            () => controller.passiveUser.value == null
                ? const SizedBox.shrink()
                : CircleImage(
                    bucketName:
                        controller.passiveUser.value!.typedImage().bucketName,
                    imageValue:
                        controller.passiveUser.value!.typedImage().value,
                    uint8list: controller.uint8list.value,
                  ),
          ),
          Obx(() => Text(
                "フォロー ${controller.passiveUser.value?.followingCount.formatNumber() ?? 0}",
              )),
          const SizedBox(
            width: 20.0,
          ),
          Obx(() => Text(
                "フォロワー ${controller.passiveUser.value?.followerCount.formatNumber() ?? 0}",
              ))
        ],
      ),
      // 横向きなら、表示崩れを防止するためにbioを表示しない。
      Obx(() => MediaQuery.of(context).orientation == Orientation.landscape
          ? const SizedBox.shrink()
          : Align(
              alignment: Alignment.centerLeft,
              child: Text(controller.passiveUser.value!
                  .typedBio()
                  .value
                  .removeNewlinesAndSpaces()),
            )),
      Row(
        children: [
          InkWell(
            onTap: () =>
                Get.toNamed("/users/${controller.passiveUid()}/posts/search"),
            child: const Icon(
              Icons.search,
              size: 40.0,
            ),
          ),
          Obx(() => controller.passiveUser.value!.isOfficial
              ? Icon(
                  Icons.verified,
                  size: 40.0,
                  color: Theme.of(context).colorScheme.secondary,
                )
              : const SizedBox.shrink())
        ],
      ),
    ];
    return Obx(() => GradientScreen(
          baseColor: Theme.of(context).colorScheme.secondary,
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (controller.passiveUser.value != null) ...children,
                  Obx(() {
                    final passiveUser = controller.passiveUser.value;
                    if (passiveUser == null) {
                      return const SizedBox.shrink();
                    }
                    return controller.isMyProfile ||
                            passiveUser.uid == currentUid()
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
