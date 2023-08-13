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
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';
import 'package:great_talk/views/realtime_res_page/components/description_button.dart';
import 'package:great_talk/views/screen/refresh_screen/components/post_report_button.dart';

class RealtimeResPage extends HookWidget with CurrentUserMixin {
  const RealtimeResPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = RealtimeResController.to;
    final purchaseController = PurchasesController.to;
    final inputController = useTextEditingController();
    final scrollCotroller = useScrollController();
    useEffect(() {
      controller.getChatLog();
      return;
    }, []);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              actions: const [
                DescriptionButton(),
                SizedBox(
                  width: 20.0,
                ),
                PostReportButton(),
                SizedBox(
                  width: 20.0,
                )
              ],
              title: Obx(() =>
                  EllipsisText(controller.interlocutor.value?.title ?? ""))),
          body: Obx(() => controller.isLoading.value ||
                  controller.interlocutor.value == null
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
                                                  .interlocutor.value!
                                                  .typedImage()
                                                  .bucketName,
                                              imageValue: controller
                                                  .interlocutor
                                                  .value!
                                                  .imageValue,
                                              uint8list:
                                                  controller.uint8list.value,
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
                                      final String text = controller
                                          .messages[index]
                                          .typedText()
                                          .value;
                                      return ListTile(
                                        onTap:
                                            purchaseController.isSubscribing()
                                                ? null
                                                : controller.onCardLongTap,
                                        tileColor: messages[index].senderUid ==
                                                CurrentUserController
                                                    .to.currentUser.value!.uid
                                            ? kSecondaryColor.withOpacity(0.3)
                                            : null,
                                        leading: messages[index].senderUid !=
                                                currentUid()
                                            ? Obx(() => CircleImage(
                                                  bucketName: controller
                                                      .interlocutor.value!
                                                      .typedImage()
                                                      .bucketName,
                                                  imageValue: controller
                                                      .interlocutor
                                                      .value!
                                                      .imageValue,
                                                  uint8list: controller
                                                      .uint8list.value,
                                                ))
                                            : null,
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
