import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/widgets.dart';
import 'package:great_talk/controllers/feeds_controller.dart';
import 'package:great_talk/model/post/post.dart';
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
    return RefreshScreen(
        docsController: controller,
        child: Obx(() => ListView(
              children: controller.docs.map((element) {
                final post = Post.fromJson(element.data());
                return ListTile(
                  title: boldText(post.postId),
                );
              }).toList(),
            )));
  }
}
