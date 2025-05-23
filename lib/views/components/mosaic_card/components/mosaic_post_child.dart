import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MosaicPostChild extends ConsumerWidget {
  const MosaicPostChild(
      {super.key, required this.msg, required this.post, required this.title});
  final String msg;
  final Post post;
  final String title;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoldWhiteText(title),
        const BasicHeightBox(),
        InkWell(
          onTap: () => UIHelper.simpleAlertDialog(msg),
          child: const Icon(
            Icons.info,
            color: Colors.white,
          ),
        ),
        const BasicHeightBox(),
        Obx(() => (post.uid == ref.watch(streamAuthUidProvider).value ||
                    CurrentUserController.to.isAdmin()) &&
                !CurrentUserController.to.deletePostIds.contains(post.postId)
            ? InkWell(
                onTap: () => PostsController.to.deletePost(post),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              )
            : const SizedBox.shrink())
      ],
    );
  }
}
