import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    final content = ChatContent.fromPost(post);
    final controller = PostsController.to;
    // 不適切なら弾く
    return content.typedIconImage().moderationLabels.isNotEmpty ||
            content.typedDescription().negativeScore > negativeLimit
        ? const SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.all(defaultPadding(context)),
            child: GestureDetector(
              onTap: () => controller.onPostCardPressed(post),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    CircleImage(
                      bucketName: post.typedIconImage().bucketName,
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
                            color: Theme.of(context).colorScheme.secondary),
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
            ),
          );
  }
}
