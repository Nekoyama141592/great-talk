import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:great_talk/extensions/number_format_extension.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/providers/logic/post_logic.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostLikeButton extends HookConsumerWidget {
  const PostLikeButton({
    super.key,
    required this.isHorizontal,
    required this.post,
  });
  final bool isHorizontal;
  final Post post;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final copyPost = useState(post);
    final asyncValue = ref.watch(tokensNotifierProvider);
    
    return AsyncScreen(asyncValue: asyncValue, data: (state) {
      final isLiked = state.likePostIds.contains(post.postId);
      final children = [
      isLiked
          ? InkWell(
            child: const Icon(Icons.favorite, color: Colors.red),
            onTap:
                () => ref.read(postLogicProvider.notifier).onUnLikeButtonPressed(
                  copyPost,
                  post,
                ),
          )
          : InkWell(
            child: const Icon(Icons.favorite),
            onTap:
                () => ref.read(postLogicProvider.notifier).onLikeButtonPressed(
                  copyPost,
                  post,
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
    });
  }
}
