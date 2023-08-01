import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/search_users_controller.dart';
import 'package:great_talk/views/screen/refresh_screen.dart';

class SearchUsersScreen extends StatelessWidget {
  const SearchUsersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchUsersController());
    return RefreshScreen(docsController: controller);
  }
}
