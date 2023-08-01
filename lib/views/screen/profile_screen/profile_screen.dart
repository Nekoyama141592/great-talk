import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/profile_controller.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/screen/profile_screen/components/edit_button.dart';
import 'package:great_talk/views/screen/profile_screen/components/follow_button.dart';
import 'package:great_talk/views/screen/refresh_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.controller}) : super(key: key);
  final ProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        controller.isMyProfile ? const EditButton() : const FollowButton(),
        Row(
          children: [
            Obx(() => controller.passiveUser.value == null
                ? const Text('')
                : Text(controller.passiveUser.value!.typedUserName().value)),
            InkWell(
              onTap: () =>
                  Get.toNamed("/users/${controller.passiveUid()}/posts/search"),
              child: const Icon(Icons.search),
            )
          ],
        ),
        Expanded(
            child: RefreshScreen(
                docsController: controller,
                child: Obx(() => controller.passiveUser.value == null
                    ? const SizedBox.shrink()
                    : ListView.builder(
                        itemCount: controller.docs.length,
                        itemBuilder: (c, i) {
                          final post = Post.fromJson(controller.docs[i].data());
                          return Text(post.postId);
                        }))))
      ],
    );
  }
}
