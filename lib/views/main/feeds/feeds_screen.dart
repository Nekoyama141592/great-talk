import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/feeds_controller.dart';
import 'package:great_talk/model/chat_user/chat_user.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/components/refresh_screen.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedsController());
    return Obx(() => RefreshScreen(
        docsController: controller,
        child: ListView.builder(
            itemCount: controller.docs.length,
            itemBuilder: (c, i) {
              final post = Post.fromJson(controller.docs[i].data());
              final interlocutor =
                  ChatUser.fromFirestoreUser(post.typedPoster());
              return ListTile(
                leading: CircleImage(interlocutor: interlocutor),
                title: Text(post.postId),
              );
            })));
  }
}
