import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/controllers/abstract/search_docs_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class SearchUsersController extends SearchDocsController {
  @override
  SearchTarget get searchTarget => SearchTarget.user;
  @override
  void setQuery() {
    query = FirestoreQueries.usersQuery;
    initialQuery = query;
  }

  @override
  List<QDoc> removedMutingDoc(List<QDoc> res) {
    return res
      ..removeWhere((element) {
        final user = PublicUser.fromJson(element.data());
        return user.typedUserName().negativeScore > negativeLimit ||
            user.typedBio().negativeScore > negativeLimit;
      });
  }
}
