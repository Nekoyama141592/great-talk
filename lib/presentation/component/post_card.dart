import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/presentation/page/chat/chat_page.dart';
import 'package:great_talk/presentation/page/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/presentation/component/circle_image/circle_image.dart';
import 'package:great_talk/presentation/component/mosaic_card/components/mosaic_post_child.dart';
import 'package:great_talk/presentation/component/mosaic_card/mosaic_card.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/components/post_like_button.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/components/post_msg_button.dart';
import 'package:great_talk/presentation/page/user_profile_page.dart';
import 'package:great_talk/presentation/constant/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostCard extends ConsumerWidget {
  const PostCard({
    super.key,
    required this.post,
    required this.base64,
    required this.publicUserEntity,
  });
  final PostEntity post;
  final String? base64;
  final PublicUserEntity? publicUserEntity;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uint8list = base64 != null ? base64Decode(base64!) : null;
    final asyncValue = ref.watch(tokensNotifierProvider);
    
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(SizeUtil.defaultPadding(context)),
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
              final authUid = ref.read(authUidProvider);
              return MosaicCard(
                child: MosaicPostChild(
                  msg: post.inappropriateReason(authUid),
                  post: post,
                  title: "不適切なコンテンツ",
                ),
              );
            }
            
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  RouteUtil.pushPath(
                    context,
                    ChatPage.generatePath(post.uid, post.postId),
                  );
                },
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  decoration: BoxDecoration(
                    color: kContentColorDarkTheme.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: kPrimaryColor.withValues(alpha: 0.3),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with user info
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Hero(
                              tag: 'post_avatar_${post.postId}',
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: kPrimaryColor.withValues(alpha: 0.4),
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kPrimaryColor.withValues(alpha: 0.2),
                                      blurRadius: 12,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: CircleImage(
                                  uint8list: uint8list,
                                  width: 48,
                                  height: 48,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () => RouteUtil.pushPath(
                                      context,
                                      UserProfilePage.generatePath(post.uid),
                                    ),
                                    child: Text(
                                      publicUserEntity?.nameValue ?? 'Unknown User',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.access_time_rounded,
                                        size: 12,
                                        color: Colors.white.withValues(alpha: 0.6),
                                      ),
                                      const SizedBox(width: 3),
                                      Flexible(
                                        child: Text(
                                          _formatDate(post.createdAt),
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.white.withValues(alpha: 0.6),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: kPrimaryColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.chat_bubble_outline_rounded,
                                size: 18,
                                color: kPrimaryColor.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Post content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                              width: 0.5,
                            ),
                          ),
                          child: Text(
                            post.title.value,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              height: 1.4,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Action buttons
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    width: 0.5,
                                  ),
                                ),
                                child: PostMsgButton(isHorizontal: false, post: post),
                              ),
                              const Expanded(child: SizedBox()),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    width: 0.5,
                                  ),
                                ),
                                child: PostLikeButton(isHorizontal: false, post: post),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  
  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}