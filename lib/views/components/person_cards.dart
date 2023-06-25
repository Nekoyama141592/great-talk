// flutter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/chat_controller.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/controllers/professionals_controller.dart';
import 'package:great_talk/controllers/search_controller.dart';
import 'package:great_talk/common/doubles.dart';
import 'package:great_talk/common/colors.dart';
// common
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/widgets.dart';
// packages
import 'package:great_talk/views/chat_page.dart';
// components
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/realtime_res_page.dart';

class PersonCards extends StatelessWidget {
  const PersonCards({Key? key, required this.isProMode}) : super(key: key);
  final bool isProMode;
  @override
  Widget build(context) {
    final PersonsController controller =
        isProMode ? ProfessionalsController.to : OriginalSearchController.to;
    return Scaffold(
        floatingActionButton: Obx(
          () => FloatingActionButton(
            onPressed: () {
              controller.isSearching.value = !controller.isSearching.value;
              controller.reset();
            },
            backgroundColor: kPrimaryColor,
            child: controller.isSearching.value
                ? const Icon(Icons.search_off)
                : const Icon(Icons.search),
          ),
        ),
        body: Obx(
          () => Container(
            padding: controller.isSearching.value
                ? EdgeInsets.symmetric(vertical: defaultPadding(context) * 7)
                : null,
            child: Obx(() => ListView.builder(
                itemCount: controller.results.length,
                itemBuilder: ((context, index) {
                  final person = controller.results[index];
                  final String name = getName(person);
                  final String? lastAnswer =
                      mapMetadataToLastAnswer(person.metadata);
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: defaultPadding(context)),
                    child: ListTile(
                      leading: CircleImage(person: person),
                      title: boldText(name),
                      subtitle: lastAnswer != null
                          ? Text(
                              lastAnswer,
                              overflow: TextOverflow.ellipsis,
                            )
                          : null,
                      // onTap: () => Get.to(ChatPage(
                      //   person: person,
                      //   controller: controller,
                      // )),
                      onTap: () => Get.to(RealtimeResPage(
                        interlocutor: person,
                        personsController: controller,
                      )),
                      // onLongPress: () => ChatController.showCleanLocalMsgDialog(
                      //     person, controller),
                    ),
                  );
                }))),
          ),
        ));
  }
}
