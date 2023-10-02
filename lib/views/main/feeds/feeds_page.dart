import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/feeds_controller.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class FeedsPage extends StatelessWidget {
  const FeedsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedsController());
    return RefreshScreen(
      docsController: controller,
      reloadMsg: "まずは、右下のボタンから投稿を作成してみましょう！",
    );
  }
}
