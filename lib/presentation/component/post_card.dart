import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:great_talk/core/size_core.dart';
import 'package:great_talk/core/route_core.dart';
import 'package:great_talk/infrastructure/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/provider/keep_alive/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/presentation/page/chat/chat_page.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';
import 'package:great_talk/presentation/component/mosaic_card/components/mosaic_post_child.dart';
import 'package:great_talk/presentation/component/mosaic_card/mosaic_card.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/components/post_like_button.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/components/post_msg_button.dart';
import 'package:great_talk/presentation/page/user_profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostCard extends ConsumerWidget {
  const PostCard({
    super.key,
    required this.post,
    required this.base64,
    required this.publicUser,
  });
  final Post post;
  final String? base64;
  final PublicUser? publicUser;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uint8list = base64 != null ? base64Decode(base64!) : null;
    final asyncValue = ref.watch(tokensNotifierProvider);
    // 不適切なら弾く
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(SizeCore.defaultPadding(context)),
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
            return InkWell(
              onTap: () {
                RouteCore.pushPath(
                  context,
                  ChatPage.generatePath(post.uid, post.postId),
                );
              },
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
                      child: CircleImage(uint8list: uint8list),
                    ),
                    EllipsisText(post.typedTitle().value),
                    TextButton(
                      onPressed:
                          () => RouteCore.pushPath(
                            context,
                            UserProfilePage.generatePath(post.uid),
                          ),
                      child: EllipsisText(
                        "by ${publicUser?.nameValue ?? ''}",
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
