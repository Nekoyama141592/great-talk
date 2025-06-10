import 'package:flutter/material.dart';
import 'package:great_talk/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/provider/keep_alive/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/provider/keep_alive/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/provider/keep_alive/usecase/post/post_use_case_provider.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/ui_core/toast_ui_core.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MosaicPostChild extends ConsumerWidget {
  const MosaicPostChild({
    super.key,
    required this.msg,
    required this.post,
    required this.title,
  });
  final String msg;
  final Post post;
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMine = post.uid == ref.watch(streamAuthUidProvider).value;
    final isAdmin =
        ref.watch(currentUserNotifierProvider).value?.isAdmin() ?? false;
    final asyncValue = ref.watch(tokensNotifierProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BoldWhiteText(title),
        const BasicHeightBox(),
        InkWell(
          onTap: () => ToastUiCore.simpleAlertDialog(context, msg),
          child: const Icon(Icons.info, color: Colors.white),
        ),
        const BasicHeightBox(),
        asyncValue.when(
          data: (state) {
            final postId = post.postId;
            return (isMine || isAdmin) &&
                    !state.deletePostIds.contains(post.postId)
                ? InkWell(
                  onTap: () async {
                    ref
                        .read(tokensNotifierProvider.notifier)
                        .addDeletePostId(postId); // 楽観的に追加する
                    final result = await ref
                        .read(postUsecaseProvider)
                        .deletePost(post);
                    result.when(
                      success: (_) async {
                        ToastUiCore.showSuccessSnackBar(context, "投稿を削除しました。");
                      },
                      failure: (e) {
                        // 失敗したら元に戻す
                        ref
                            .read(tokensNotifierProvider.notifier)
                            .removeDeletePostId(postId);
                        ToastUiCore.showFailureSnackBar(
                          context,
                          "投稿を削除することができませんでした。",
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.delete, color: Colors.white),
                )
                : const SizedBox.shrink();
          },
          error: (e, s) => const SizedBox.shrink(),
          loading: () => const SizedBox.shrink(),
        ),
      ],
    );
  }
}
