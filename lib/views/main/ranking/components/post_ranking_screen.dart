import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/post_ranking_controller.dart';
import 'package:great_talk/views/screen/refresh_screen.dart';

class PostRankingScreen extends StatelessWidget {
  const PostRankingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostRankingController());
    return RefreshScreen(docsController: controller);
  }
}
