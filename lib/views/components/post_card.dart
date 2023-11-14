import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';
import 'package:great_talk/views/components/mosaic_card/components/mosaic_post_child.dart';
import 'package:great_talk/views/components/mosaic_card/mosaic_card.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';

class PostCard extends StatelessWidget with CurrentUserMixin {
  const PostCard({Key? key, required this.post, required this.uint8list})
      : super(key: key);
  final Post post;
  final Uint8List? uint8list;
  @override
  Widget build(BuildContext context) {
    final controller = PostsController.to;
    // 不適切なら弾く
    return InkWell(
      onLongPress: () => controller.onUserCardLongPressed(post.typedPoster()),
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
                CurrentUserController.to.isMutingUser(post.typedPoster().uid)) {
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
                    CircleImage(
                      bucketName: post.typedImage().bucketName,
                      imageValue: post.typedImage().value,
                      onTap: () => controller.onPostCardPressed(post),
                      uint8list: uint8list,
                    ),
                    EllipsisText(
                      post.typedTitle().value,
                    ),
                    TextButton(
                      onPressed: () =>
                          Get.toNamed("/users/${post.typedPoster().uid}"),
                      child: EllipsisText(
                        "by ${post.typedPoster().typedUserName().value}",
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
                          Column(
                            children: [
                              InkWell(
                                onTap: () => controller.onPostCardPressed(post),
                                child: const Icon(Icons.message),
                              ),
                              const Text("")
                            ],
                          ),
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
