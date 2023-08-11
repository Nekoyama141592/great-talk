import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/components/mosaic_card/components/mosaic_post_child.dart';
import 'package:great_talk/views/components/mosaic_card/mosaic_card.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);
  final Post post;

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
                  msg: content.inappropriateReason(),
                  title: "不適切なコンテンツ",
                ),
              )
            : Obx(() => CurrentUserController.to
                        .isMutingPost(content.contentId) ||
                    CurrentUserController.to.isMutingUser(content.posterUid)
                ? MosaicCard(
                    child: MosaicPostChild(
                        content: content,
                        msg: "あなたはこの投稿、もしくはその投稿者をミュートしています。",
                        title: "制限されている投稿"))
                : GestureDetector(
                    onTap: () => controller.onPostCardPressed(post),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          CircleImage(
                            bucketName: post.typedImage().bucketName,
                            imageValue: content.imageValue,
                            onTap: () => controller.onPostCardPressed(post),
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
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                            ),
                          ),
                          Center(
                            child: Row(
                              children: [
                                PostLikeButton(
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
                  )));
  }
}
