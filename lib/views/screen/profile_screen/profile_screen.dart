import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/profile_controller.dart';
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
      Row(
        children: [
          if (!controller.isMyProfile)
            InkWell(
              onTap: Get.back,
              child: const Icon(
                Icons.arrow_back,
                size: 40.0,
              ),
            ),
          Obx(
            () => controller.passiveUser.value == null
                ? const SizedBox.shrink()
                : CircleImage(
                    bucketName: controller.passiveUser.value!
                        .typedUserImage()
                        .bucketName,
                    imageValue:
                        controller.passiveUser.value!.typedUserImage().value),
          ),
          Column(
            children: [
              Row(
                children: [
                  Obx(() => Text(
                        controller.passiveUser.value!.typedUserName().value,
                        style: StyleUtility.bold40(),
                      )),
                  InkWell(
                    onTap: () => Get.toNamed(
                        "/users/${controller.passiveUid()}/posts/search"),
                    child: const Icon(
                      Icons.search,
                      size: 40.0,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Obx(() => Text(
                        "フォロー ${controller.passiveUser.value?.followingCount ?? 0}",
                        style: StyleUtility.basic20(),
                      )),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Obx(() => Text(
                        "フォロワー ${controller.passiveUser.value?.followerCount ?? 0}",
                        style: StyleUtility.basic20(),
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
      Obx(() => Align(
            alignment: Alignment.centerLeft,
            child: Text(controller.passiveUser.value!.typedBio().value),
          )),
    ];
    return Obx(() => GradientScreen(
          baseColor: Theme.of(context).colorScheme.secondary,
          header: Column(
            children: [
              if (controller.passiveUser.value != null) ...children,
              controller.isMyProfile
                  ? const EditButton()
                  : const FollowButton(),
            ],
          ),
          child: RefreshScreen(
            docsController: controller,
          ),
        ));
  }
}
