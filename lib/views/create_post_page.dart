import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/create_post_controller.dart';

class CreatePostPage extends HookWidget {
  const CreatePostPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePostController());
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await controller.getImage();
      });
      return;
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text("投稿を作成"),
      ),
      body: Obx(() => controller.uint8List.value == null
          ? const CircularProgressIndicator()
          : Align(
              alignment: Alignment.center,
              child: Obx(() => Image.memory(controller.uint8List.value!)),
            )),
    );
  }
}
