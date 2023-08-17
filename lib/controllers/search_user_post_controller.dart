import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/controllers/abstract/search_docs_controller.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class SearchUserPostsController extends SearchDocsController {
  SearchUserPostsController() : super(searchTarget: SearchTarget.post);
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
