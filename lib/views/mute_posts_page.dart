import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/mute_posts_controller.dart';
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
      body: RefreshScreen(docsController: controller),
    );
  }
}
