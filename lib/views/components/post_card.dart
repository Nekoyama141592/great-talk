import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/model/q_doc_info/q_doc_info.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';
import 'package:great_talk/views/components/mosaic_card/components/mosaic_post_child.dart';
import 'package:great_talk/views/components/mosaic_card/mosaic_card.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_msg_button.dart';
import 'package:great_talk/views/user_profile_page.dart';

class PostCard extends StatelessWidget with CurrentUserMixin {
  const PostCard({super.key, required this.qDocInfo});
  final QDocInfo qDocInfo;
  @override
  Widget build(BuildContext context) {
    final controller = PostsController.to;
    final post = Post.fromJson(qDocInfo.qDoc.data());
    final uint8list = qDocInfo.userImage;
    final publicUser = qDocInfo.publicUser;
    // 不適切なら弾く
    return InkWell(
      onLongPress: () => controller.onPostCardLongPressed(post),
      child: Padding(
          padding: EdgeInsets.all(defaultPadding(context)),
          child: Obx(() {
            if (CurrentUserController.to.isDeletedPost(post.postId)) {
              return MosaicCard(
                  child: MosaicPostChild(
                      msg: "この投稿はあなたによって削除されました。",
                      post: post,
                      title: "削除された投稿"));
            }
            if (CurrentUserController.to.isMutingPost(post.postId) ||
                CurrentUserController.to.isMutingUser(post.uid)) {
              return MosaicCard(
                  child: MosaicPostChild(
                      msg: "あなたはこの投稿、もしくはその投稿者をミュートしています。",
                      post: post,
                      title: "制限されている投稿"));
            }
            if (post.isInappropriate()) {
              return MosaicCard(
                child: MosaicPostChild(
                  msg: post.inappropriateReason(currentUid()),
                  post: post,
                  title: "不適切なコンテンツ",
                ),
              );
            }
            return GestureDetector(
              onTap: () => controller.onPostCardPressed(post),
              child: Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleImage(
                        onTap: () => controller.onPostCardPressed(post),
                        uint8list: uint8list,
                      ),
                    ),
                    EllipsisText(
                      post.typedTitle().value,
                    ),
                    TextButton(
                      onPressed: () =>
                          Get.toNamed(UserProfilePage.generatePath(post.uid)),
                      child: EllipsisText(
                        "by ${publicUser.nameValue}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    Center(
                      child: Row(
                        children: [
                          PostLikeButton(
                            isHorizontal: false,
                            post: post,
                          ),
                          const Spacer(),
                          PostMsgButton(isHorizontal: false, post: post),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
