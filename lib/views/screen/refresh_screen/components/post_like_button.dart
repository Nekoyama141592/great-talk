import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/model/post/post.dart';

class PostLikeButton extends HookWidget {
  const PostLikeButton({
    Key? key,
    required this.post,
  }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    final int plusOneCount = post.likeCount + 1;
    final controller = PostsController.to;
    final isLiked = useState(false);
    return Column(
      children: [
        Obx(
          () => CurrentUserController.to.likePostIds.contains(post.postId)
              ? InkWell(
                  child: const Icon(Icons.favorite, color: Colors.red),
                  onTap: () async {
                    isLiked.value = false;
                    await controller.unLikePost(post);
                  })
              : InkWell(
                  child: const Icon(
                    Icons.favorite,
                  ),
                  onTap: () async {
                    isLiked.value = true;
                    await controller.likePost(post);
                  }),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(isLiked.value
                ? plusOneCount.toString()
                : post.likeCount.toString()))
      ],
    );
  }
}
