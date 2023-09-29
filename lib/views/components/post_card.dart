import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image.dart';
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
    final content = ChatContent.fromPost(post);
    final controller = PostsController.to;
    // 不適切なら弾く
    return Padding(
        padding: EdgeInsets.all(defaultPadding(context)),
        child: (content.isInappropriate())
            ? MosaicCard(
                child: MosaicPostChild(
                  content: content,
                  msg: post.inappropriateReason(currentUid()),
                  title: "不適切なコンテンツ",
                ),
              )
            : Obx(() {
                if (CurrentUserController.to.isMutingPost(content.contentId) ||
                    CurrentUserController.to.isMutingUser(content.posterUid)) {
                  return MosaicCard(
                      child: MosaicPostChild(
                          content: content,
                          msg: "あなたはこの投稿、もしくはその投稿者をミュートしています。",
                          title: "制限されている投稿"));
                }
                if (CurrentUserController.to.isDeletedPost(content.contentId)) {
                  return MosaicCard(
                      child: MosaicPostChild(
                          content: content,
                          msg: "この投稿はあなたによって削除されました。",
                          title: "削除された投稿"));
                }
                return GestureDetector(
                  onTap: () => controller.onPostCardPressed(post),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        CircleImage(
                          bucketName: post.typedImage().bucketName,
                          imageValue: content.imageValue,
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
                                    onTap: () =>
                                        controller.onPostCardPressed(post),
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
              }));
  }
}
