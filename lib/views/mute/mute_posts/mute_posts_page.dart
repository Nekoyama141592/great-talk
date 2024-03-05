import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/mute_posts_controller.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/mute/mute_posts/component/mute_post_card.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class MutePostsPage extends StatelessWidget {
  const MutePostsPage({super.key});
  static const path = "/mutePosts";
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
            itemCount: controller.qDocInfoList.length,
            itemBuilder: (c, i) {
              final post =
                  Post.fromJson(controller.qDocInfoList[i].qDoc.data());
              final uint8list = controller.qDocInfoList[i].userImage;
              return MutePostCard(post: post, uint8list: uint8list);
            })),
      ),
    );
  }
}
