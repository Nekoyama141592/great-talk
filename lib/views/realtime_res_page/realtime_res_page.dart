import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/colors.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/components/rounded_input_field.dart';

class RealtimeResPage extends HookWidget {
  const RealtimeResPage(
      {Key? key, required this.interlocutor, required this.personsController})
      : super(key: key);
  final types.User interlocutor;
  final PersonsController personsController;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RealtimeResController());
    final inputController = useTextEditingController();
    useEffect(() {
      controller.getChatLog(interlocutor);
      return;
    }, [interlocutor]);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(interlocutor.lastName ?? ""),
          ),
          body: Obx(() => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const BasicHeightBox(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child: Obx(
                            () => ListView.builder(
                              itemCount: controller.messages.length,
                              itemBuilder: ((context, index) {
                                final messages = controller.messages.toList();
                                if (index == messages.indexOf(messages.last) &&
                                    messages.last.toJson()["text"].isEmpty) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.all(defaultPadding(context)),
                                    child: Obx(() => ListTile(
                                          leading: interlocutor.imageUrl != null
                                              ? CircleImage(
                                                  interlocutor: interlocutor)
                                              : null,
                                          title: SelectableText(
                                              controller.realtimeRes.value),
                                        )),
                                  );
                                } else {
                                  return Padding(
                                    padding:
                                        EdgeInsets.all(defaultPadding(context)),
                                    child: Obx(() => ListTile(
                                          tileColor: messages[index].author ==
                                                  chatUiCurrrentUser
                                              ? kSecondaryColor.withOpacity(0.3)
                                              : null,
                                          leading: messages[index].author !=
                                                  chatUiCurrrentUser
                                              ? CircleImage(
                                                  interlocutor: interlocutor)
                                              : null,
                                          title: SelectableText(controller
                                              .messages[index]
                                              .toJson()["text"]),
                                        )),
                                  );
                                }
                              }),
                            ),
                          )),
                      RoundedInputField(
                          controller: inputController,
                          send: () => controller.onSendPressed(
                              context,
                              interlocutor,
                              personsController,
                              inputController)),
                      const BasicHeightBox()
                    ],
                  ),
                ))),
    );
  }
}
