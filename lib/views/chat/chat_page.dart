import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:great_talk/core/doubles.dart';
import 'package:great_talk/core/post_core.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/text_message/text_message.dart';
import 'package:great_talk/model/view_model_state/chat/chat_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/view_model/chat/chat_view_model.dart';
import 'package:great_talk/ui_core/texts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/views/chat/components/menu_button.dart';
import 'package:great_talk/views/chat/components/msg_card.dart';
import 'package:great_talk/views/components/app_bar_action.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/basic_width_box.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';
import 'package:great_talk/views/chat/components/delete_post_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatPage extends HookConsumerWidget {
  const ChatPage({
    super.key,
  });

  // パス生成ロジックはそのまま利用可能
  static const path = "/chat/users/:uid/posts/:postId";
  static String generatePath(String uid, String postId) =>
      "/chat/users/$uid/posts/$postId";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ViewModelとNotifierを取得
    final uid = Get.parameters['uid']!;
    final postId = Get.parameters['postId']!;
    final chatStateAsync = ref.watch(chatViewModelProvider(uid, postId));
    final chatNotifier = ref.read(chatViewModelProvider(uid, postId).notifier);

    final inputController = useTextEditingController();
    final scrollController = useScrollController();

    // 日付が変わったかどうかを判定するヘルパー関数
    bool isAnotherDay(List<TextMessage> messages, int index) {
      if (index == 0) return true; // 最初のメッセージは常に日付を表示
      final message = messages[index];
      return message.createdAtDateTime.day !=
          messages[index - 1].createdAtDateTime.day;
    }

    return SafeArea(
      child: Scaffold(
        // AsyncValue.when を使って、ローディング・エラー・データ表示を切り替える
        body: chatStateAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('エラーが発生しました: $stack'),
          )),
          data: (ChatState data) {
            final Post post = data.post;
            final List<TextMessage> messages = data.messages;
            final bool isGenerating = data.isGenerating;
            final String currentUserId =
                ref.watch(streamAuthUidProvider).value ?? "";

            return Scaffold(
              appBar: AppBar(
                title: EllipsisText(post.typedTitle().value),
                actions: [
                  // 自分の投稿、もしくは管理者なら削除ボタン、それ以外ならレポートボタンを表示
                  if (post.uid == currentUserId ||
                      CurrentUserController.to
                          .isAdmin()) // `CurrentUserController`は依存関係が不明なため残置
                    DeletePostButton(
                      onTap: chatNotifier.onDeleteButtonPressed,
                    )
                  else
                    AppBarAction(
                      onTap: () => PostCore.onReportButtonPressed(context, post,currentUserId),
                      child: const Icon(Icons.report),
                    ),
                  PostLikeButton(isHorizontal: true, post: post,currentUid: currentUserId,),
                  MenuButton(
                    onMenuPressed: chatNotifier.onMenuPressed,
                  ), // MenuButtonにはcleanLocalMessageを渡す必要あり
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const BasicHeightBox(),
                    SizedBox(
                      height: chatScreenHeight(context),
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: messages.length,
                        itemBuilder: ((context, index) {
                          // 生成中のメッセージかどうかを判定
                          final bool isGeneratingMsg =
                              isGenerating && index == messages.length - 1;
                          final image = data.postImage;
                          if (isGeneratingMsg) {
                            // AIがメッセージを生成中の表示
                            return MsgCard(
                              isMyMsg: false,
                              isAnotherDay: isAnotherDay(messages, index),
                              text: data.realtimeRes, // リアルタイムで更新されるテキスト
                              createdAt: messages[index].typedCreatedAt(),
                              postImage:
                                  image != null ? base64Decode(image) : null,
                            );
                          } else {
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
                          }
                        }),
                      ),
                    ),
                    // メッセージ生成中でなければ入力フィールドを表示
                    if (!isGenerating)
                      Row(
                        children: [
                          const BasicWidthBox(),
                          RoundedInputField(
                              controller: inputController,
                              send: () => chatNotifier.onSendPressed(
                                  context, inputController, scrollController)),
                        ],
                      )
                    else
                      const SizedBox.shrink(), // 生成中は非表示
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
