import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/controllers/realtime_res_controller.dart';

class RealtimeResPage extends HookWidget {
  const RealtimeResPage({Key? key, required this.interlocutor})
      : super(key: key);
  final types.User interlocutor;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RealtimeResController());
    useEffect(() {
      controller.getChatLog(interlocutor);
      return;
    });
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Obx(
                    () => ListView.builder(
                      itemCount: controller.messages.length,
                      itemBuilder: ((context, index) {
                        final messages = controller.messages.reversed.toList();
                        if (index == messages.indexOf(messages.first) &&
                            messages.last.toJson()["text"].isEmpty) {
                          return Obx(() => ListTile(
                                title: Text(controller.realtimeRes.value),
                              ));
                        } else {
                          return Obx(() => ListTile(
                                leading: messages[index].author !=
                                        chatUiCurrrentUser
                                    ? CachedNetworkImage(
                                        imageUrl: interlocutor.imageUrl ?? "")
                                    : null,
                                title: Text(messages[index].toJson()["text"]),
                              ));
                        }
                      }),
                    ),
                  )),
              ElevatedButton(
                  onPressed: controller.execute, child: const Text("実行"))
            ],
          )),
    );
  }
}
