import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/bookmark/bookmark.dart';
import 'package:great_talk/repository/firestore_repository.dart';

class BookmarksController extends DocsController {
  BookmarksController() : super(enablePullDown: true,requiresValueReset: true);
  @override
  void setQuery() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
        final token = CurrentUserController.to.bookmarkCategoryTokens.firstWhere((element) => element.tokenId == Get.parameters["categoryId"]);
    query = FirestoreQueries.postsQueryByNewest;
      });
    
  }
  void onUnBookmarkButtonPressed(Bookmark bookmark) async {
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    _showUnBookmarkDialog(bookmark);
  }

  void _showUnBookmarkDialog(Bookmark bookmark) {
    UIHelper.cupertinoAlertDialog(
        "ブックマークを解除しますがよろしいですか？", () => _unBookmark(bookmark));
  }

  Future<void> _unBookmark(Bookmark bookmark) async {
    final repository = FirestoreRepository();
    final result = await repository.deleteDoc(bookmark.ref);
    result.when(success: (_) {
      Get.back();
      UIHelper.showFlutterToast("ブックマークを解除しました。");
    }, failure: () {
      UIHelper.showErrorFlutterToast("ブックマークを解除できませんでした。");
    });
  }
}
