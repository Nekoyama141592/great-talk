import 'package:flutter/material.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/providers/logic/router/router_logic.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/providers/logic/post/post_logic.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/q_doc_info/q_doc_info.dart';
import 'package:great_talk/views/common/async_screen/async_screen.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';
import 'package:great_talk/views/components/mosaic_card/components/mosaic_post_child.dart';
import 'package:great_talk/views/components/mosaic_card/mosaic_card.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_msg_button.dart';
import 'package:great_talk/views/user_profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostCard extends ConsumerWidget {
  const PostCard({super.key, required this.qDocInfo});
  final QDocInfo qDocInfo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = Post.fromJson(qDocInfo.qDoc.data());
    final uint8list = qDocInfo.userImage;
    final publicUser = qDocInfo.publicUser;
    final asyncValue = ref.watch(tokensNotifierProvider);
    // 不適切なら弾く
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(defaultPadding(context)),
        child: AsyncScreen(
          asyncValue: asyncValue,
          data: (state) {
            if (state.isDeletedPost(post.postId)) {
              return MosaicCard(
                child: MosaicPostChild(
                  msg: "この投稿はあなたによって削除されました。",
                  post: post,
                  title: "削除された投稿",
                ),
              );
            }
            if (state.isMutingPost(post.postId) ||
                state.isMutingUser(post.uid)) {
              return MosaicCard(
                child: MosaicPostChild(
                  msg: "あなたはこの投稿、もしくはその投稿者をミュートしています。",
                  post: post,
                  title: "制限されている投稿",
                ),
              );
            }
            if (post.isInappropriate()) {
              final authUid = ref.read(streamAuthUidProvider).value;
              return MosaicCard(
                child: MosaicPostChild(
                  msg: post.inappropriateReason(authUid),
                  post: post,
                  title: "不適切なコンテンツ",
                ),
              );
            }
            return GestureDetector(
              onTap:
                  () => ref
                      .read(postLogicProvider.notifier)
                      .onPostCardPressed(context, post),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleImage(
                        onTap:
                            () => ref
                                .read(postLogicProvider.notifier)
                                .onPostCardPressed(context, post),
                        uint8list: uint8list,
                      ),
                    ),
                    EllipsisText(post.typedTitle().value),
                    TextButton(
                      onPressed:
                          () => RouterLogic.pushPath(
                            context, 
                            UserProfilePage.generatePath(post.uid),
                          ),
                      child: EllipsisText(
                        "by ${publicUser.nameValue}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        children: [
                          PostLikeButton(isHorizontal: false, post: post),
                          const Spacer(),
                          PostMsgButton(isHorizontal: false, post: post),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
