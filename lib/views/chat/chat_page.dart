import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:great_talk/core/size_core.dart';
import 'package:great_talk/consts/msg_constants.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/text_message/text_message.dart';
import 'package:great_talk/model/view_model_state/chat/chat_state.dart';
import 'package:great_talk/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/provider/keep_alive/notifier/current_user/current_user_notifier.dart';
import 'package:great_talk/provider/keep_alive/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/provider/keep_alive/usecase/post/post_use_case_provider.dart';
import 'package:great_talk/core/route_core.dart';
import 'package:great_talk/provider/view_model/chat/chat_view_model.dart';
import 'package:great_talk/ui_core/chat_ui_core.dart';
import 'package:great_talk/ui_core/post_ui_core.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/ui_core/toast_ui_core.dart';
import 'package:great_talk/views/chat/components/menu_button.dart';
import 'package:great_talk/views/chat/components/msg_card.dart';
import 'package:great_talk/views/common/async_page/async_screen/async_screen.dart';
import 'package:great_talk/views/components/app_bar_action.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/basic_width_box.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';
import 'package:great_talk/views/chat/components/delete_post_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';
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
    ChatViewModel chatNotifier() => ref.read(chatViewModelProvider(uid, postId).notifier);
    final isAdmin =
        ref.watch(currentUserNotifierProvider).value?.isAdmin() ?? false;
    final inputController = useTextEditingController();
    final scrollController = useScrollController();

    // 日付が変わったかどうかを判定するヘルパー関数
    bool isAnotherDay(List<TextMessage> messages, int index) {
      if (index == 0) return true; // 最初のメッセージは常に日付を表示
      final message = messages[index];
      return message.createdAtDateTime.day !=
          messages[index - 1].createdAtDateTime.day;
    }

    return Scaffold(
      body: AsyncScreen(
        asyncValue: chatStateAsync,
        data: (ChatState data) {
          final Post post = data.post;
          final List<TextMessage> messages = data.messages;
          final String currentUserId =
              ref.watch(streamAuthUidProvider).value ?? "";

          return Scaffold(
            appBar: AppBar(
              title: EllipsisText(post.typedTitle().value),
              actions: [
                // 自分の投稿、もしくは管理者なら削除ボタン、それ以外ならレポートボタンを表示
                if (post.uid == currentUserId || isAdmin)
                  DeletePostButton(
                    onTap: () async {
                      ref
                          .read(tokensNotifierProvider.notifier)
                          .addDeletePostId(postId); // 楽観的に追加する
                      final result = await ref
                          .read(postUsecaseProvider)
                          .deletePost(post);
                      result.when(
                        success: (_) async {
                          ToastUiCore.showSuccessSnackBar(
                            context,
                            "投稿を削除しました。",
                          );
                          RouteCore.back(context);
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
                  )
                else
                  AppBarAction(
                    onTap: () {
                      final notifier = ref.read(postUsecaseProvider);
                      PostUiCore.onReportButtonPressed(
                        context: context,
                        mutePost: (innerContext) async {
                          final token = ref
                              .read(tokensNotifierProvider.notifier)
                              .addMutePost(post);
                          if (token == null) {
                            RouteCore.back(innerContext);
                            return;
                          }
                          final result = await notifier.mutePost(
                            post,
                            currentUserId,
                            token,
                          );
                          result.when(
                            success: (_) => RouteCore.back(innerContext),
                            failure: (_) {},
                          );
                        },
                        muteUser: (innerContext) async {
                          final token = ref
                              .read(tokensNotifierProvider.notifier)
                              .addMuteUser(post);
                          if (token == null) {
                            RouteCore.back(innerContext);
                            return;
                          }
                          final result = await notifier.muteUser(
                            post,
                            currentUserId,
                            token,
                          );
                          result.when(
                            success: (_) => RouteCore.back(innerContext),
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
                    ChatUiCore.onMenuPressed(
                      context: context,
                      post: post,
                      cleanLocalMessage: (innerContext) async {
                        final result = await chatNotifier().cleanLocalMessage();
                        result.when(
                          success: (_) {
                            ToastUiCore.showSuccessSnackBar(
                              context,
                              MsgConstants.clearChatMsg,
                            );
                          },
                          failure: (msg) {
                            ToastUiCore.showFailureSnackBar(context, msg);
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
                    height: SizeCore.chatScreenHeight(context),
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
                            createdAt: message.typedCreatedAt(),
                            postImage:
                                image != null ? base64Decode(image) : null,
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
                              success:
                                  (res) {
                                    ToastUiCore.showSuccessSnackBar(
                                    context,
                                    '応答の生成に成功しました',
                                  );
                                  inputController.clear();
                                  chatNotifier().onSuccess(res);
                                  },
                              failure: (msg) {
                                     ToastUiCore.showFailureSnackBar(
                                        context,
                                        msg,
                                      );
                                    chatNotifier().onFailure();
                                  }
                            );
                          },
                        ),
                      ],
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
