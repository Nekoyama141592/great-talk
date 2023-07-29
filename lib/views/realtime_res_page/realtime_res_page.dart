import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/controllers/purchases_controller.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';
import 'package:great_talk/model/chat_user/chat_user.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';

class RealtimeResPage extends HookWidget {
  const RealtimeResPage(
      {Key? key, required this.interlocutor, required this.personsController})
      : super(key: key);
  final ChatUser interlocutor;
  final PersonsController personsController;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RealtimeResController());
    final purchaseController = PurchasesController.to;
    final inputController = useTextEditingController();
    final scrollCotroller = useScrollController();
    useEffect(() {
      controller.getChatLog(interlocutor);
      return;
    }, [interlocutor]);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(interlocutor.userName),
          ),
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
                                    messages.last.toJson()["text"].isEmpty) {
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
                                        leading: CircleImage(
                                            interlocutor: interlocutor),
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
                                          .toJson()["text"];
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
                                        leading: messages[index].uid ==
                                                CurrentUserController
                                                    .to.currentUser.value!.uid
                                            ? CircleImage(
                                                interlocutor: interlocutor)
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
                                context,
                                interlocutor,
                                personsController,
                                inputController,
                                scrollCotroller));
                      })
                    ],
                  ),
                ))),
    );
  }
}
