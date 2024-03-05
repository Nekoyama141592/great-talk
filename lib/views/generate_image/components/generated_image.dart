import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/generate_image_controller.dart';
import 'package:great_talk/views/components/basic_height_box.dart';
import 'package:great_talk/views/generate_image/components/sized_wrapper.dart';

class GeneratedImage extends StatelessWidget {
  const GeneratedImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = GenerateImageController.to;
      final imageUrl = controller.rxUrl.value;
      return imageUrl.isNotEmpty
          ? Column(
              children: [
                InkWell(
                  onTap: controller.onImageTapped,
                  child: Image.network(
                    imageUrl,
                    width: 300,
                    height: 300,
                    loadingBuilder: (_, child, loadingProgress) {
                      return loadingProgress == null
                          ? child
                          : const SizedWrapper(
                              child: Column(
                                children: [
                                  CircularProgressIndicator(),
                                  BasicHeightBox(),
                                  Text("URLから画像を取得中")
                                ],
                              ),
                            );
                    },
                    frameBuilder: (_, child, frame, wasSynchronouslyLoaded) {
                      return frame == 0 && !wasSynchronouslyLoaded
                          ? Column(
                              children: [
                                child,
                                const BasicHeightBox(),
                                const Text("画像をタップして保存してください"),
                              ],
                            )
                          : const SizedWrapper();
                    },
                    errorBuilder: (c, e, s) {
                      return const Icon(
                        Icons.error,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
                const BasicHeightBox(),
              ],
            )
          : const SizedWrapper();
    });
  }
}
