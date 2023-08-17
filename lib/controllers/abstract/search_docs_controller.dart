import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/enums.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/model/search_log/search_log.dart';
import 'package:great_talk/repository/firestore_repository.dart';

abstract class SearchDocsController extends DocsController {
  SearchDocsController({required this.isSearchUser})
      : super(enablePullDown: false, requiresValueReset: false);
  final bool isSearchUser;
  String searchTerm = "";
  String firestoreSearchTerm = "";
  void search(String value) async {
    searchTerm = value;
    await fetchDocs();
  }
  Future<void> createSearchLog(SearchTarget searchTargetEnum) async {
    final searchTarget = searchTargetEnum.name;
    final repository = FirestoreRepository();
    final uid = currentUid();
    final SearchLog searchLog = SearchLog(logCreatedAt: Timestamp.now(), searchTarget: searchTarget, searchTerm: searchTerm, uid: uid);
    await repository.createSearchLog(uid, searchLog.toJson());
  }
}
