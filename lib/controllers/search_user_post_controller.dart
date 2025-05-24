// import 'package:get/get.dart';
// import 'package:great_talk/consts/enums.dart';
// import 'package:great_talk/consts/ints.dart';
// import 'package:great_talk/controllers/abstract/search_docs_controller.dart';
// import 'package:great_talk/core/firestore/query_core.dart';
// import 'package:great_talk/model/database_schema/post/post.dart';
// import 'package:great_talk/typedefs/firestore_typedef.dart';

// class SearchUserPostsController extends SearchDocsController {
//   @override
//   SearchTarget get searchTarget => SearchTarget.post;
//   @override
//   MapQuery setQuery() {
//     final passiveUid = Get.parameters['uid']!;
//     initialQuery = QueryCore.userPosts(passiveUid);
//     return initialQuery;
//   }

//   @override
//   List<QDoc> removedMutingDoc(List<QDoc> res) {
//     return res
//       ..removeWhere((element) {
//         final post = Post.fromJson(element.data());
//         return post.typedTitle().negativeScore > negativeLimit ||
//             post.typedDescription().negativeScore > negativeLimit;
//       });
//   }
// }
