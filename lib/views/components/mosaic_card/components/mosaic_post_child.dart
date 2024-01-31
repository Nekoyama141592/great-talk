import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/basic_height_box.dart';

class MosaicPostChild extends StatelessWidget with CurrentUserMixin {
  const MosaicPostChild(
      {Key? key, required this.msg, required this.post, required this.title})
      : super(key: key);
  final String msg;
  final Post post;
  final String title;
  @override
  Widget build(BuildContext context) {
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
        Obx(() => (post.uid == currentUid() ||
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
