import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/lists.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/search_log/search_log.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class SearchDocsController extends DocsController {
  SearchDocsController({required this.searchTarget})
      : super(enablePullDown: false, requiresValueReset: false);
  String searchTerm = "";
  String firestoreSearchTerm = "";
  late MapQuery query;
  late MapQuery initialQuery;
  final SearchTarget searchTarget;
  String _passiveUid() => Get.parameters['uid']!;
  @override
  void onInit() {
    switch (searchTarget) {
      case SearchTarget.post:
        query = FirestoreQueries.userPostsQuery(_passiveUid());
        initialQuery = query;
        break;
      case SearchTarget.user:
        query = FirestoreQueries.usersQuery;
        initialQuery = query;
    }
    super.onInit();
  }

  @override
  Future<void> fetchDocs() async {
    if (searchTerm.length < nGramIndex) {
      return;
    }
    setSearchQuery();
    // createSearchLog(searchTarget); // Logをfirestoreに保存
    firestoreSearchTerm = searchTerm; // フォームのSearchTermは空になるので格納する
    final result = await repository.searchDocs(query);
    result.when(success: (res) {
      setAllDocs(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    // Loadingの際はフォームのSearchTermは空になる
    if (searchTerm.isEmpty &&
        docs.isNotEmpty &&
        firestoreSearchTerm.isNotEmpty) {
      final result = await repository.searchMoreDocs(query, docs.last.doc);
      result.when(success: (res) {
        addAllDocs(res);
      }, failure: () {
        UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      });
    } else {
      UIHelper.showFlutterToast("再検索を行ってください");
    }
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh(RefreshController refreshController) async {
    refreshController.refreshCompleted();
  }

  void search(String value) async {
    searchTerm = value;
    await fetchDocs();
  }

  Future<void> createSearchLog(SearchTarget searchTargetEnum) async {
    final searchTarget = searchTargetEnum.name;
    final repository = FirestoreRepository();
    final uid = currentUid();
    final SearchLog searchLog = SearchLog(
        logCreatedAt: Timestamp.now(),
        searchTarget: searchTarget,
        searchTerm: searchTerm,
        uid: uid);
    await repository.createSearchLog(uid, searchLog.toJson());
  }

  void setSearchQuery() {
    query = initialQuery;
    final searchWords = returnSearchWords(searchTerm);
    for (final searchWord in searchWords) {
      query = query.where("searchToken.$searchWord", isEqualTo: true);
    }
  }
}
