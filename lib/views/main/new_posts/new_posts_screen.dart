import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/new_posts_controller.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class NewPostsScreen extends StatelessWidget {
  const NewPostsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewPostsController());
    return RefreshScreen(docsController: controller);
  }
}
