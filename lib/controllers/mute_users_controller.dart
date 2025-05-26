import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MuteUsersController extends DocsController {
  MuteUsersController() : super(DocsType.muteUsers);
  @override
  MapQuery setQuery() {
    final requestUids = createRequestUids();
    return QueryCore.usersByWhereIn(requestUids);
  }

  @override
  Future<void> fetchDocs() async {
    if (createRequestUids().isEmpty) return;
    await super.fetchDocs();
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    if (createRequestUids().isEmpty) return;
    await super.onLoading(refreshController);
  }
  
  
}
