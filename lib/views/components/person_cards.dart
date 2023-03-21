// flutter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/api/chat_api.dart';
import 'package:great_talk/controllers/persons_controller.dart';
import 'package:great_talk/controllers/professionals_controller.dart';
import 'package:great_talk/controllers/search_controller.dart';
import 'package:great_talk/common/doubles.dart';
// common
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/widgets.dart';
// packages
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:great_talk/domain/chat_user_metadata/chat_user_metadata.dart';
import 'package:great_talk/views/chat_page.dart';
// components
import 'package:great_talk/views/components/circle_image.dart';

class PersonCards extends StatelessWidget {
  const PersonCards({Key? key,required this.isProMode }) : super(key: key);
  final bool isProMode;
  @override
  Widget build(context) {
    final PersonsController personsController = isProMode ? ProfessionalsController.to : SearchController.to;
    return Obx(() => ListView.builder(
      itemCount: personsController.results.length,
      itemBuilder: ((context, index) {
        final person = personsController.results[index];
        final String name = getName(person);
        final String? lastAnswer = mapMetadataToLastAnswer(person.metadata);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding(context) ),
          child: ListTile(
            leading: CircleImage(person: person),
            title: boldText(name),
            subtitle: lastAnswer != null ? Text(lastAnswer,overflow: TextOverflow.ellipsis,) : null,
            onTap: () => Get.to(ChatPage(person: person,controller: personsController,)),
            onLongPress: () => ChatApi.showCleanLocalMsgDialog(person,personsController),
          ),
        );
      })
    ));
  }
}