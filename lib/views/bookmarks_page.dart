import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/bookmarks_controller.dart';
import 'package:great_talk/views/components/basic_page.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookmarksController());
    return BasicPage(
        appBarText: "投稿一覧", child: RefreshScreen(docsController: controller));
  }
}
