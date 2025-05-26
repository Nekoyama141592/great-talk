import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/core/post_core.dart';
import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/model/database_schema/post/post.dart';

class PostLikeButton extends HookWidget {
  const PostLikeButton({
    super.key,
    required this.isHorizontal,
    required this.post,
    required this.currentUid,
  });
  final bool isHorizontal;
  final Post post;
  final String currentUid;
  @override
  Widget build(BuildContext context) {
    final copyPost = useState(post);
    final isLiked = useState(
      TokensController.to.likePostIds.contains(post.postId),
    );
    final children = [
      isLiked.value
          ? InkWell(
            child: const Icon(Icons.favorite, color: Colors.red),
            onTap:
                () => PostCore.onUnLikeButtonPressed(
                  copyPost,
                  isLiked,
                  post,
                  currentUid,
                ),
          )
          : InkWell(
            child: const Icon(Icons.favorite),
            onTap:
                () => PostCore.onLikeButtonPressed(
                  copyPost,
                  isLiked,
                  post,
                  currentUid,
                ),
          ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          isHorizontal ? copyPost.value.likeCount.formatNumber() : "",
        ),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child:
          isHorizontal ? Row(children: children) : Column(children: children),
    );
  }
}
