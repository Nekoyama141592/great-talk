import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:great_talk/core/extension/number_format_extension.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/core/provider/keep_alive/usecase/post/like_post/like_post_use_case_provider.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostLikeButton extends HookConsumerWidget {
  const PostLikeButton({
    super.key,
    required this.isHorizontal,
    required this.post,
  });
  final bool isHorizontal;
  final PostEntity post;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likeCount = useState(post.likeCount);
    final asyncValue = ref.watch(tokensNotifierProvider);
    TokensNotifier notifier() => ref.read(tokensNotifierProvider.notifier);
    return AsyncScreen(
      asyncValue: asyncValue,
      data: (state) {
        final postId = post.postId;
        final isLiked = state.likePostIds.contains(postId);
        final children = [
          isLiked
              ? InkWell(
                child: const Icon(Icons.favorite, color: Colors.red),
                onTap: () async {
                  final user = ref.read(authProvider);
                  if (user == null || !user.emailVerified) {
                    ToastUiUtil.showSuccessSnackBar(context, 'ログインしてください');
                    return;
                  }
                  final currentUid = user.uid;
                  final deleteToken = notifier().removeLikePost(postId);
                  if (deleteToken == null) return;
                  likeCount.value--; // 表示する数字を1つ下げる
                  final result = await ref
                      .read(likePostUseCaseProvider)
                      .unLikePost(currentUid, deleteToken.tokenId, post);
                  result.when(
                    success: (_) {},
                    failure: (_) {
                      ToastUiUtil.showFailureSnackBar(context, '通信に失敗しました');
                      likeCount.value++; // 元に戻す
                      notifier().addLikePost(currentUid, post);
                    },
                  );
                },
              )
              : InkWell(
                child: const Icon(Icons.favorite),
                onTap: () async {
                  final user = ref.read(authProvider);
                  if (user == null || !user.emailVerified) {
                    ToastUiUtil.showSuccessSnackBar(context, 'ログインしてください');
                    return;
                  }
                  final currentUid = user.uid;
                  final token = notifier().addLikePost(currentUid, post);
                  if (token == null) return;
                  likeCount.value++; // 表示する数字を1つ上げる
                  final result = await ref
                      .read(likePostUseCaseProvider)
                      .likePost(currentUid, token, post);
                  result.when(
                    success: (_) {},
                    failure: (_) {
                      ToastUiUtil.showFailureSnackBar(context, ('通信に失敗しました'));
                      likeCount.value--; // 元に戻す
                      notifier().removeLikePost(postId);
                    },
                  );
                },
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(isHorizontal ? likeCount.value.formatNumber() : ""),
          ),
        ];
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child:
              isHorizontal
                  ? Row(children: children)
                  : Column(children: children),
        );
      },
    );
  }
}
