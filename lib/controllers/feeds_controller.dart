import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/index_posts_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FeedsController extends IndexPostsController {
  FeedsController() : super();
  static FeedsController get to => Get.find<FeedsController>();

  @override
  void setQuery() {
    query = FirestoreQueries.timelinesQuery(_userRef());
  }

  DocRef _userRef() => FirestoreQueries.userDocRef(currentUid());
}
