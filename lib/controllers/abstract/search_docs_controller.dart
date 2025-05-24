import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/lists.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/consts/form_consts.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/model/database_schema/search_log/search_log.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class SearchDocsController extends DocsController {
  SearchTarget get searchTarget;
  @override
  Future<void> fetchDocs() async {
    if (searchTerm.length < FormConsts.nGramIndex) {
      return;
    }
    _setSearchQuery();
    _createSearchLog(searchTarget); // Logをfirestoreに保存
    firestoreSearchTerm = searchTerm; // フォームのSearchTermは空になるので格納する
    super.fetchDocs();
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    // Loadingの際はフォームのSearchTermは空になる
    if (searchTerm.isEmpty &&
        qDocInfoList.isNotEmpty &&
        firestoreSearchTerm.isNotEmpty) {
      super.onLoading(refreshController);
    } else {
      UIHelper.showFlutterToast("再検索を行ってください");
    }
  }

  void search(String value) async {
    searchTerm = value;
    await fetchDocs();
  }

  Future<void> _createSearchLog(SearchTarget searchTargetEnum) async {
    final searchTarget = searchTargetEnum.name;
    final repository = FirestoreRepository();
    final uid = currentUid();
    final SearchLog searchLog = SearchLog(
        logCreatedAt: Timestamp.now(),
        searchTarget: searchTarget,
        searchTerm: searchTerm,
        uid: uid);
    final ref = DocRefCore.searchLog(currentUid());
    final json = searchLog.toJson();
    await repository.createDoc(ref, json);
  }

  void _setSearchQuery() {
    query = initialQuery;
    final searchWords = returnSearchWords(searchTerm);
    for (final searchWord in searchWords) {
      query = query.where("searchToken.$searchWord", isEqualTo: true);
    }
  }

  List<QDoc> removedMutingDoc(List<QDoc> res);
}
