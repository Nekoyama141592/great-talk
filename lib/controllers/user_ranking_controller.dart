import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class UserRankingController extends DocsController {
  @override
  MapQuery setQuery() {
    return QueryCore.usersByFollowerCount();
  }
}
