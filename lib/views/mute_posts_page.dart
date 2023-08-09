import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/mute_posts_controller.dart';
import 'package:great_talk/model/chat_content/chat_content.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class MutePostsPage extends StatelessWidget {
  const MutePostsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MutePostsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("ミュートしている投稿一覧"),
      ),
      body: RefreshScreen(
        docsController: controller,
        child: Obx(() => ListView.builder(
            itemCount: controller.docs.length,
            itemBuilder: (c, i) {
              final post = Post.fromJson(controller.docs[i].data());
              final chatContent = ChatContent.fromPost(post);
              // return PostCard(
              //     chatContent: chatContent,
              //     post: post,
              //     onTap: () => controller.unMutePost(post));
              return SizedBox.shrink();
            })),
      ),
    );
  }
}
