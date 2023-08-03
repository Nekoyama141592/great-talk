import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';

class RealtimeResPage extends HookWidget {
  const RealtimeResPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RealtimeResController());
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
              title: Obx(
                  () => Text(controller.interlocutor.value?.userName ?? ""))),
          body: Obx(() => controller.isLoading.value
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
                                    messages.last.text.value.isEmpty) {
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
                                        leading: Obx(
                                          () => controller.interlocutor.value !=
                                                  null
                                              ? CircleImage(
                                                  chatContent: controller
                                                      .interlocutor.value!)
                                              : const SizedBox.shrink(),
                                        ),
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
                                      final String text =
                                          controller.messages[index].text.value;
                                      return ListTile(
                                        onTap:
                                            purchaseController.isSubscribing()
                                                ? null
                                                : controller.onCardLongTap,
                                        tileColor: messages[index].uid ==
                                                CurrentUserController
                                                    .to.currentUser.value!.uid
                                            ? kSecondaryColor.withOpacity(0.3)
                                            : null,
                                        leading: Obx(() => controller
                                                    .interlocutor.value !=
                                                null
                                            ? Container(
                                                child: messages[index].uid !=
                                                        CurrentUserController
                                                            .to
                                                            .currentUser
                                                            .value!
                                                            .uid
                                                    ? CircleImage(
                                                        chatContent: controller
                                                            .interlocutor
                                                            .value!)
                                                    : null,
                                              )
                                            : const SizedBox.shrink()),
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
