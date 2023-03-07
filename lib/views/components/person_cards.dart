// flutter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/api/chat_api.dart';
import 'package:great_talk/api/search_controller.dart';
import 'package:great_talk/common/doubles.dart';
// common
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/widgets.dart';
// packages
import 'package:get/get.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:great_talk/views/chat_page.dart';
// components
import 'package:great_talk/views/components/circle_image.dart';

class PersonCards extends StatelessWidget {
  const PersonCards({Key? key}) : super(key: key);
  @override
  Widget build(context) {
    final SearchController searchController = SearchController.to;
    return Obx(() => ListView.builder(
      itemCount: searchController.results.length,
      itemBuilder: ((context, index) {
        final person = searchController.results[index];
        final String name = getName(person);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding(context) ),
          child: ListTile(
            leading: CircleImage(person: person),
            title: boldText(name),
            onTap: () => Get.to(ChatPage(person: person)),
            onLongPress: () => ChatApi.showCleanLocalMsgDialog(person.id),
          ),
        );
      })
    ));
  }
}