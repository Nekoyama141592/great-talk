import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/posts_controller.dart';
import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/model/database_schema/post/post.dart';

class PostLikeButton extends HookWidget {
  const PostLikeButton({
    super.key,
    required this.isHorizontal,
    required this.post,
  });
  final bool isHorizontal;
  final Post post;
  @override
  Widget build(BuildContext context) {
    final controller = PostsController.to;
    final copyPost = useState(post);
    final isLiked =
        useState(TokensController.to.likePostIds.contains(post.postId));
    final children = [
      isLiked.value
          ? InkWell(
              child: const Icon(Icons.favorite, color: Colors.red),
              onTap: () =>
                  controller.onUnLikeButtonPressed(copyPost, isLiked, post))
          : InkWell(
              child: const Icon(
                Icons.favorite,
              ),
              onTap: () =>
                  controller.onLikeButtonPressed(copyPost, isLiked, post)),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child:
              Text(isHorizontal ? copyPost.value.likeCount.formatNumber() : ""))
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: isHorizontal
          ? Row(
              children: children,
            )
          : Column(
              children: children,
            ),
    );
  }
}
