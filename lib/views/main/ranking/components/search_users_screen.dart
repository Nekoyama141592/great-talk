import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/search_users_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/views/components/user_card.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:great_talk/views/screen/search_screen.dart';

class SearchUsersScreen extends StatelessWidget {
  const SearchUsersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchUsersController());
    return SearchScreen(
        hint: "ユーザーを検索...",
        onQueryChanged: controller.search,
        child: Obx(() => RefreshScreen(
            docsController: controller,
            child: ListView.builder(
                itemCount: controller.docs.length,
                itemBuilder: (c, i) {
                  final publicUser =
                      PublicUser.fromJson(controller.docs[i].doc.data());
                  final uint8list = controller.docs[i].uint8list;
                  return UserCard(publicUser: publicUser, uint8list: uint8list);
                }))));
  }
}
