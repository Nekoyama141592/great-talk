import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/chat_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/views/chat/components/msg_card.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/basic_width_box.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';
import 'package:great_talk/views/chat/components/delete_post_button.dart';
import 'package:great_talk/views/chat/components/menu_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_report_button.dart';

class ChatPage extends HookWidget with CurrentUserMixin {
  const ChatPage({super.key});
  static const path = "/chat/users/:uid/posts/:postId";
  static String generatePath(String uid, String postId) =>
      "/chat/users/$uid/posts/$postId";
  @override
  Widget build(BuildContext context) {
    final controller = ChatController.to;
    final inputController = useTextEditingController();
    final scrollCotroller = useScrollController();
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await controller.init();
      });
      return controller.resetState;
    }, []);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              actions: [
                // 自分の投稿、もしくは管理者なら削除ボタン、それ以外ならレポートボタンを表示する.
                Obx(() => controller.rxPost.value?.uid == currentUid() ||
                        CurrentUserController.to.isAdmin()
                    ? const DeletePostButton()
                    : const PostReportButton()),
                Obx(() {
                  final post = controller.rxPost.value;
                  if (post == null) {
                    return const SizedBox.shrink();
                  } else {
                    return PostLikeButton(isHorizontal: true, post: post);
                  }
                }),
                const MenuButton(),
              ],
              title: Obx(() => EllipsisText(
                  controller.rxPost.value?.typedTitle().value ?? ""))),
          body: Obx(() => controller.isLoading.value ||
                  controller.rxPost.value == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const BasicHeightBox(),
                      SizedBox(
                          height: chatScreenHeight(context),
                          child: Obx(
                            () => ListView.builder(
                              controller: scrollCotroller,
                              itemCount: controller.messages.length,
                              itemBuilder: ((context, index) {
                                final messages = controller.messages.toList();
                                final isGeneratingMsg =
                                    controller.isGeneratingMsg(index);
                                if (isGeneratingMsg) {
                                  // 生成中の表示
                                  return Obx(() {
                                    final text = controller.realtimeRes.value;
                                    final isAnotherDay =
                                        controller.isAnotherDay(index);
                                    return MsgCard(
                                      isMyMsg: false,
                                      isAnotherDay: isAnotherDay,
                                      text: text,
                                      index: index,
                                    );
                                  });
                                } else {
                                  // 生成が終わった場合の表示
                                  return Obx(() {
                                    final message = messages[index];
                                    final String text = controller
                                        .messages[index]
                                        .typedText()
                                        .value;
                                    final isMyMessage =
                                        controller.isMyMessage(message);
                                    final isAnotherDay =
                                        controller.isAnotherDay(index);
                                    final createdAt = message.typedCreatedAt();
                                    return MsgCard(
                                      isMyMsg: isMyMessage,
                                      isAnotherDay: isAnotherDay,
                                      text: text,
                                      index: index,
                                      createdAt: createdAt,
                                    );
                                  });
                                }
                              }),
                            ),
                          )),
                      Obx(() {
                        if (controller.isGenerating.value) {
                          return const SizedBox.shrink();
                        }
                        return Row(
                          children: [
                            const BasicWidthBox(),
                            RoundedInputField(
                                controller: inputController,
                                send: () => controller.onSendPressed(
                                    context, inputController, scrollCotroller)),
                          ],
                        );
                      })
                    ],
                  ),
                ))),
    );
  }
}
