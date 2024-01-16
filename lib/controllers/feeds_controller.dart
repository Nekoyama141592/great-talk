import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/index_posts_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FeedsController extends IndexPostsController {
  FeedsController() : super();
  static FeedsController get to => Get.find<FeedsController>();

  @override
  void setQuery() {
    query = QueryCore.timelines(_userRef());
  }

  DocRef _userRef() => DocRefCore.user(currentUid());
}
