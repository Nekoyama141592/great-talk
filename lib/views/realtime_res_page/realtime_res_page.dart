import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';
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
    }, []);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(defaultPadding(context)),
              child: Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller.messages.length,
                          itemBuilder: ((context, index) {
                            final messages =
                                controller.messages.reversed.toList();
                            if (index == messages.indexOf(messages.first) &&
                                messages.first.toJson()["text"].isEmpty) {
                              return Obx(() => ListTile(
                                    leading: interlocutor.imageUrl != null ?CachedNetworkImage(
                                        imageUrl: interlocutor.imageUrl!): null,
                                    title: SelectableText(
                                        controller.realtimeRes.value),
                                  ));
                            } else {
                              return Obx(() => ListTile(
                                    leading: messages[index].author !=
                                            chatUiCurrrentUser
                                        ? CachedNetworkImage(
                                            imageUrl:
                                                interlocutor.imageUrl ?? "")
                                        : null,
                                    title: SelectableText(controller
                                        .messages[index]
                                        .toJson()["text"]),
                                  ));
                            }
                          }),
                        ),
                      )),
                  RoundedInputField(
                      controller: inputController,
                      onCloseButtonPressed: () => inputController.text = "",
                      send: () => controller.onSendPressed(context,
                          interlocutor, personsController, inputController))
                ],
              ),
            ),
          )),
    );
  }
}
