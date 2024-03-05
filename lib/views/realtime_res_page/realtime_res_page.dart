import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/texts.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/circle_image/circle_image.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';
import 'package:great_talk/views/realtime_res_page/components/delete_post_button.dart';
import 'package:great_talk/views/realtime_res_page/components/menu_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_like_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_report_button.dart';

class RealtimeResPage extends HookWidget with CurrentUserMixin {
  const RealtimeResPage({super.key});
  static const path = "/chat/users/:uid/posts/:postId";
  static String generatePath(String uid, String postId) =>
      "/chat/users/$uid/posts/$postId";
  @override
  Widget build(BuildContext context) {
    final controller = RealtimeResController.to;
    final purchaseController = PurchasesController.to;
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
                Obx(() => controller.rxPost.value == null
                    ? const SizedBox.shrink()
                    : PostLikeButton(
                        isHorizontal: true, post: controller.rxPost.value!)),
                const MenuButton(),
              ],
              title: Obx(() =>
                  EllipsisText(controller.rxChatContent.value?.title ?? ""))),
          body: Obx(() => controller.isLoading.value ||
                  controller.rxChatContent.value == null
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
                                if (index == messages.indexOf(messages.last) &&
                                    messages.last.typedText().value.isEmpty) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.all(defaultPadding(context)),
                                    child: Obx(() {
                                      final text = controller.realtimeRes.value;
                                      return ListTile(
                                        onTap:
                                            purchaseController.isSubscribing()
                                                ? null
                                                : controller.onCardLongTap,
                                        leading: Obx(() => CircleImage(
                                              bucketName: controller
                                                  .rxChatContent.value!
                                                  .typedImage()
                                                  .bucketName,
                                              imageValue: controller
                                                  .rxChatContent
                                                  .value!
                                                  .imageValue,
                                              uint8list:
                                                  controller.rxUint8list.value,
                                            )),
                                        title:
                                            purchaseController.isSubscribing()
                                                ? SelectableText(text)
                                                : Text(text),
                                      );
                                    }),
                                  );
                                } else {
                                  return Padding(
                                    padding:
                                        EdgeInsets.all(defaultPadding(context)),
                                    child: Obx(() {
                                      final message = messages[index];
                                      final String text = controller
                                          .messages[index]
                                          .typedText()
                                          .value;
                                      return ListTile(
                                        onTap:
                                            purchaseController.isSubscribing()
                                                ? null
                                                : controller.onCardLongTap,
                                        tileColor: controller
                                                .isMyContent(message)
                                            ? kSecondaryColor.withOpacity(0.3)
                                            : null,
                                        leading: controller.isMyContent(message)
                                            ? null
                                            : Obx(() => CircleImage(
                                                  bucketName: controller
                                                      .rxChatContent.value!
                                                      .typedImage()
                                                      .bucketName,
                                                  imageValue: controller
                                                      .rxChatContent
                                                      .value!
                                                      .imageValue,
                                                  uint8list: controller
                                                      .rxUint8list.value,
                                                )),
                                        title:
                                            purchaseController.isSubscribing()
                                                ? SelectableText(text)
                                                : Text(text),
                                      );
                                    }),
                                  );
                                }
                              }),
                            ),
                          )),
                      Obx(() {
                        if (controller.isGenerating.value) {
                          return const SizedBox.shrink();
                        }
                        return RoundedInputField(
                            controller: inputController,
                            send: () => controller.onSendPressed(
                                context, inputController, scrollCotroller));
                      })
                    ],
                  ),
                ))),
    );
  }
}
