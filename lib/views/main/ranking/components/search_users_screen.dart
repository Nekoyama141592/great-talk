import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/search_users_controller.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/screen/refresh_screen.dart';

class SearchUsersScreen extends StatelessWidget {
  const SearchUsersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchUsersController());
    return Obx(() => RefreshScreen(
        docsController: controller,
        child: ListView.builder(
            itemCount: controller.docs.length,
            itemBuilder: (c, i) {
              final post = Post.fromJson(controller.docs[i].data());
              return Text(post.postId);
            })));
  }
}
