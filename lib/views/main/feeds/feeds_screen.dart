import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/feeds_controller.dart';
import 'package:great_talk/model/chat_user/chat_user.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/views/components/circle_image.dart';
import 'package:great_talk/views/components/refresh_screen.dart';

class FeedsScreen extends HookWidget {
  const FeedsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedsController());
    useEffect(() {
      controller.init();
      return;
    }, []);
    return Obx(() => RefreshScreen(
        docsController: controller,
        child: ListView.builder(
            itemCount: controller.docs.length,
            itemBuilder: (c, i) {
              final post = Post.fromJson(controller.docs[i].data());
              final interlocutor = ChatUser.fromFirestoreUserMap(post.poster);
              return ListTile(
                leading: CircleImage(interlocutor: interlocutor),
                title: Text(post.postId),
              );
            })));
  }
}
