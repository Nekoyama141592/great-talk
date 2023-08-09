import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/search_users_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:great_talk/views/screen/search_screen.dart';

class SearchUsersScreen extends StatelessWidget {
  const SearchUsersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchUsersController());
    return SearchScreen(
        hint: "例: M.LO",
        onQueryChanged: controller.search,
        child: RefreshScreen(
            docsController: controller,
            child: Obx(
              () => ListView.builder(
                  itemCount: controller.docs.length,
                  itemBuilder: (c, i) {
                    final user = PublicUser.fromJson(controller.docs[i].data());
                    return Obx(() =>
                        CurrentUserController.to.isValidUser(user.uid)
                            ? Text(user.typedUserName().value)
                            : const SizedBox.shrink());
                  }),
            )));
  }
}
