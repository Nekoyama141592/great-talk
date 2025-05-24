// import 'package:great_talk/consts/enums.dart';
// import 'package:great_talk/consts/ints.dart';
// import 'package:great_talk/controllers/abstract/search_docs_controller.dart';
// import 'package:great_talk/core/firestore/query_core.dart';
// import 'package:great_talk/model/database_schema/public_user/public_user.dart';
// import 'package:great_talk/typedefs/firestore_typedef.dart';

// class SearchUsersController extends SearchDocsController {
//   @override
//   SearchTarget get searchTarget => SearchTarget.user;
//   @override
//   MapQuery setQuery() {
//     initialQuery = QueryCore.users();
//     return initialQuery;
//   }

//   @override
//   List<QDoc> removedMutingDoc(List<QDoc> res) {
//     return res
//       ..removeWhere((element) {
//         final user = PublicUser.fromJson(element.data());
//         return user.typedUserName().negativeScore > negativeLimit ||
//             user.typedBio().negativeScore > negativeLimit;
//       });
//   }
// }
