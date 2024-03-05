import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/views/generate_image/generate_image_page.dart';

class ToGeneratePageButton extends StatelessWidget {
  const ToGeneratePageButton({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Get.toNamed(GenerateImagePage.path),
        child: Text(
          "画像を生成する",
          style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
        ));
  }
}
