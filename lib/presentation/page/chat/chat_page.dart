import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/core/util/size_util.dart';
import 'package:great_talk/presentation/constant/msg_constants.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/local_schema/text_message/text_message.dart';
import 'package:great_talk/presentation/state/chat/chat_state.dart';
import 'package:great_talk/core/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/presentation/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/core/provider/keep_alive/usecase/post/mute_post/mute_post_use_case_provider.dart';
import 'package:great_talk/core/provider/keep_alive/usecase/user/mute_user/mute_user_use_case_provider.dart';
import 'package:great_talk/core/provider/keep_alive/usecase/post/delete_post/delete_post_use_case_provider.dart';
import 'package:great_talk/core/util/route_util.dart';
import 'package:great_talk/presentation/notifier/chat/chat_view_model.dart';
import 'package:great_talk/presentation/util/chat_ui_util.dart';
import 'package:great_talk/presentation/util/post_ui_util.dart';
import 'package:great_talk/presentation/util/texts.dart';
import 'package:great_talk/presentation/util/toast_ui_util.dart';
import 'package:great_talk/presentation/page/chat/components/menu_button.dart';
import 'package:great_talk/presentation/page/chat/components/msg_card.dart';
import 'package:great_talk/presentation/page/common/async_page/async_page.dart';
import 'package:great_talk/presentation/component/app_bar_action.dart';
import 'package:great_talk/presentation/component/basic_height_box.dart';
import 'package:great_talk/presentation/component/basic_width_box.dart';
import 'package:great_talk/presentation/component/rounded_input_field.dart';
import 'package:great_talk/presentation/page/chat/components/delete_post_button.dart';
import 'package:great_talk/presentation/page/screen/refresh_screen/components/post_like_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ChatPage extends HookConsumerWidget {
  const ChatPage({
    super.key,
    @pathParam this.uid = '',
    @pathParam this.postId = '',
  });

  final String uid;
  final String postId;
  // パス生成ロジックはそのまま利用可能
  static const path = "/chat/users/:uid/posts/:postId";
  static String generatePath(String uid, String postId) =>
      "/chat/users/$uid/posts/$postId";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatStateAsync = ref.watch(chatViewModelProvider(uid, postId));
    ChatViewModel chatNotifier() =>
        ref.read(chatViewModelProvider(uid, postId).notifier);
    final isAdmin =
        ref.watch(currentUserNotifierProvider).value?.isAdmin() ?? false;
    final inputController = useTextEditingController();
    final scrollController = useScrollController();

    // 日付が変わったかどうかを判定するヘルパー関数
    bool isAnotherDay(List<TextMessage> messages, int index) {
      if (index == 0) return true; // 最初のメッセージは常に日付を表示
      final message = messages[index];
      return message.createdAt.day != messages[index - 1].createdAt.day;
    }

    void mutePost(BuildContext innerContext, PostEntity post) async {
      final uid = ref.read(authUidProvider);
      if (uid == null) return;
      final token = ref.read(tokensNotifierProvider.notifier).addMutePost(post);
      if (token == null) return;
      final result = await ref
          .read(mutePostUseCaseProvider)
          .mutePost(post, uid, token);
      result.when(
        success: (_) {
          RouteUtil.back(innerContext);
        },
        failure: (_) {},
      );
    }

    return AsyncPage(
      asyncValue: chatStateAsync,
      data: (ChatState data) {
        final PostEntity post = data.post;
        final List<TextMessage> messages = data.messages;
        final String currentUserId = ref.watch(authUidProvider) ?? "";

        return Scaffold(
          appBar: AppBar(
            title: EllipsisText(post.title.value),
            actions: [
              // 自分の投稿、もしくは管理者なら削除ボタン、それ以外ならレポートボタンを表示
              if (post.uid == currentUserId || isAdmin)
                DeletePostButton(
                  onTap: () async {
                    ref
                        .read(tokensNotifierProvider.notifier)
                        .addDeletePostId(postId); // 楽観的に追加する
                    final result = await ref
                        .read(deletePostUseCaseProvider)
                        .deletePost(post);
                    result.when(
                      success: (_) async {
                        ToastUiUtil.showSuccessSnackBar(context, "投稿を削除しました。");
                        RouteUtil.back(context);
                      },
                      failure: (e) {
                        // 失敗したら元に戻す
                        ref
                            .read(tokensNotifierProvider.notifier)
                            .removeDeletePostId(postId);
                        ToastUiUtil.showFailureSnackBar(
                          context,
                          "投稿を削除することができませんでした。",
                        );
                      },
                    );
                  },
                )
              else
                AppBarAction(
                  onTap: () {
                    final muteUserNotifier = ref.read(muteUserUseCaseProvider);
                    PostUiUtil.onReportButtonPressed(
                      context: context,
                      mutePost: (innerContext) => mutePost(innerContext, post),
                      reportPost:
                          (innerContext) => mutePost(innerContext, post),
                      muteUser: (innerContext) async {
                        final token = ref
                            .read(tokensNotifierProvider.notifier)
                            .addMuteUser(post);
                        if (token == null) {
                          RouteUtil.back(innerContext);
                          return;
                        }
                        final result = await muteUserNotifier.muteUser(
                          post,
                          currentUserId,
                          token,
                        );
                        result.when(
                          success: (_) => RouteUtil.back(innerContext),
                          failure: (_) {},
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.report),
                ),
              PostLikeButton(isHorizontal: true, post: post),
              //
              MenuButton(
                onMenuPressed: () {
                  ChatUiUtil.menu(
                    context: context,
                    post: post,
                    cleanLocalMessage: (innerContext) async {
                      final result = await chatNotifier().cleanLocalMessage();
                      result.when(
                        success: (_) {
                          ToastUiUtil.showSuccessSnackBar(
                            context,
                            MsgConstants.clearChatMsg,
                          );
                        },
                        failure: (msg) {
                          ToastUiUtil.showFailureSnackBar(context, msg);
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const BasicHeightBox(),
                SizedBox(
                  height: SizeUtil.chatScreenHeight(context),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: messages.length,
                    itemBuilder: ((context, index) {
                      final image = data.postImage;
                      // 通常のメッセージ表示
                      final message = messages[index];
                      final String text = message.typedText().value;
                      final bool isMyMessage =
                          message.senderUid == currentUserId;

                      return MsgCard(
                        isMyMsg: isMyMessage,
                        isAnotherDay: isAnotherDay(messages, index),
                        text: text,
                        createdAt: message.createdAt,
                        postImage: image != null ? base64Decode(image) : null,
                      );
                    }),
                  ),
                ),
                Row(
                  children: [
                    const BasicWidthBox(),
                    RoundedInputField(
                      controller: inputController,
                      send: () async {
                        FocusScope.of(context).unfocus();
                        final result = await chatNotifier().onSendPressed(
                          inputController.text,
                          scrollController,
                        );
                        result.when(
                          success: (res) {
                            ToastUiUtil.showSuccessSnackBar(
                              context,
                              '応答の生成に成功しました',
                            );
                            inputController.clear();
                            chatNotifier().onSuccess(res);
                          },
                          failure: (msg) {
                            ToastUiUtil.showFailureSnackBar(context, msg);
                            chatNotifier().onFailure();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
