import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/search_user_post_controller.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/screen/refresh_screen.dart';

class SearchUserPostsPage extends StatelessWidget {
  const SearchUserPostsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchUserPostsController());
    return Scaffold(
      appBar: AppBar(title: const Text("ユーザーの投稿を検索")),
      body: Obx(() => RefreshScreen(
          docsController: controller,
          child: ListView.builder(
              itemCount: controller.docs.length,
              itemBuilder: (c, i) {
                final post = Post.fromJson(controller.docs[i].data());
                return Text(post.postId);
              }))),
    );
  }
}
