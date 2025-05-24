import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class BookmarksController extends DocsController {
  BookmarksController() : super();
  @override
  DocsType get type => DocsType.bookmarks;
  @override
  MapQuery setQuery() {
    final token = CurrentUserController.to.bookmarkCategoryTokens
        .firstWhere((element) => element.id == Get.parameters["categoryId"]);
    return QueryCore.bookmarks(token);
  }
}
