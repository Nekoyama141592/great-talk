import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/views/components/basic_page.dart';
import 'package:great_talk/views/screen/refresh_screen/refresh_screen.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});
  static const path = "/bookmarks/:categoryId";
  static String generatePath(String categoryId) => "/bookmarks/$categoryId";
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DocsController(DocsType.bookmarks));
    return BasicPage(
        appBarText: "投稿一覧", child: RefreshScreen(docsController: controller));
  }
}
