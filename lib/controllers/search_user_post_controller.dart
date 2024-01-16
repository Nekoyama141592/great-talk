import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/controllers/abstract/search_docs_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class SearchUserPostsController extends SearchDocsController {
  @override
  SearchTarget get searchTarget => SearchTarget.post;
  @override
  void setQuery() {
    final passiveUid = Get.parameters['uid']!;
    query = QueryCore.userPosts(passiveUid);
    initialQuery = query;
  }

  @override
  List<QDoc> removedMutingDoc(List<QDoc> res) {
    return res
      ..removeWhere((element) {
        final post = Post.fromJson(element.data());
        return post.typedTitle().negativeScore > negativeLimit ||
            post.typedDescription().negativeScore > negativeLimit;
      });
  }
}
