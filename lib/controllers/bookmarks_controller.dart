import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/index_posts_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';

class BookmarksController extends IndexPostsController {
  BookmarksController() : super();
  @override
  void setQuery() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final token = CurrentUserController.to.bookmarkCategoryTokens
          .firstWhere((element) => element.id == Get.parameters["categoryId"]);
      query = FirestoreQueries.bookmarksQuery(token);
    });
  }
}
