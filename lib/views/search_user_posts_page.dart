import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/search_user_post_controller.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';
import 'package:great_talk/views/screen/search_screen.dart';

class SearchUserPostsPage extends StatelessWidget {
  const SearchUserPostsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchUserPostsController());
    return Scaffold(
        appBar: AppBar(title: const Text("ユーザーの投稿を検索")),
        body: SearchScreen(
            onQueryChanged: controller.search,
            child: RefreshScreen(docsController: controller)));
  }
}
