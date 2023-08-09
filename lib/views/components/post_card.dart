import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
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
    return Padding(
      padding: EdgeInsets.all(defaultPadding(context)),
      child: GestureDetector(
        onTap: () => Get.toNamed(
            '/chat/users/${post.typedPoster().uid}/posts/${post.postId}'),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              CircleImage(
                imageValue: content.imageValue,
                onTap: () => Get.toNamed(
                    '/chat/users/${post.typedPoster().uid}/posts/${post.postId}'),
              ),
              Text(
                post.typedTitle().value,
                overflow: TextOverflow.ellipsis,
              ),
              TextButton(
                onPressed: () =>
                    Get.toNamed("/users/${post.typedPoster().uid}"),
                child: Text(
                  "by ${post.typedPoster().typedUserName().value}",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
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
                          onTap: () => Get.toNamed(
                              '/chat/users/${post.typedPoster().uid}/posts/${post.postId}'),
                          child: const Icon(Icons.message),
                        ),
                        Text(post.msgCount.toString())
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
