import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/index_posts_controller.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class BookmarksController extends IndexPostsController {
  BookmarksController() : super();
  @override
  MapQuery setQuery() {
    final token = CurrentUserController.to.bookmarkCategoryTokens
        .firstWhere((element) => element.id == Get.parameters["categoryId"]);
    return QueryCore.bookmarks(token);
  }
}
