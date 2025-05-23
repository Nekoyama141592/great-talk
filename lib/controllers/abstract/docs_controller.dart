import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/database_schema/q_doc_info/q_doc_info.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class DocsController extends GetxController with CurrentUserMixin {
  final isLoading = false.obs;
  bool cannotShow() => isLoading.value;
  void startLoading() => isLoading(true);
  void endLoading() => isLoading(false);
  bool get requiresValueReset => false; // ページを開くたびに初期化が必要かどうかを判定
  final qDocInfoList = <QDocInfo>[].obs;
  final isInit = false.obs;
  late MapQuery query;
  List<QDoc> indexDocs = [];
  final Rx<PublicUser?> rxPassiveUser = Rx(null);
  final Rx<Uint8List?> rxUint8list = Rx(null);
  String searchTerm = "";
  String firestoreSearchTerm = "";
  late MapQuery initialQuery;
  @override
  void onInit() async {
    query = setQuery();
    await onReload();
    super.onInit();
  }

  MapQuery setQuery();

  Future<void> _updateDocInfoList(List<QDoc> elements,
      {bool front = false}) async {
    if (isLoading.value || elements.isEmpty) return;
    startLoading();
    try {
      final docIds = qDocInfoList.map((e) => e.qDoc.id).toSet();
      final newElements =
          elements.where((e) => !docIds.contains(e.id)).toList();
      if (newElements.isEmpty) {
        endLoading();
        return;
      }

      final uids = newElements.map((e) => e.data()['uid'] as String).toSet();
      final fetchedUsers = await _getUsersByUids(uids.toList());
      final userMap = {for (final user in fetchedUsers) user.uid: user};

      final newQDocInfoList = await Future.wait(newElements
          .where((element) => userMap.containsKey(element.data()['uid']))
          .map((element) async {
        final publicUser = userMap[element.data()['uid']]!;
        final userImage = await _getImageFromDoc(element);
        return QDocInfo(
            publicUser: publicUser, qDoc: element, userImage: userImage);
      }));

      if (front) {
        qDocInfoList.value = [...newQDocInfoList.reversed, ...qDocInfoList];
      } else {
        qDocInfoList.value = [...qDocInfoList, ...newQDocInfoList];
      }
    } finally {
      endLoading();
    }
  }

  Future<void> addAllDocs(List<QDoc> elements) async {
    await _updateDocInfoList(elements);
  }

  Future<void> insertAllDocs(List<QDoc> elements) async {
    await _updateDocInfoList(elements, front: true);
  }

  List<QDoc> sortedDocs(List<QDoc> elements) {
    if (elements.isEmpty) {
      return [];
    } else {
      return elements
        ..sort((a, b) => (b["createdAt"]).compareTo(a["createdAt"]));
    }
  }

  Future<void> init() async {
    if (requiresValueReset) {
      isInit(false);
    }
    if (isInit.value) return;
    await onReload();
    isInit(true);
  }

  Future<Uint8List?> _getImageFromDoc(Doc doc) async {
    final detectedImage = DetectedImage.fromJson(doc['image']);
    final image = await FileUtility.getS3Image(
        detectedImage.bucketName, detectedImage.value);
    return image;
  }

  Future<void> fetchDocs() async {
    try {
      final elements = await query.get();
      await addAllDocs(elements.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
  }

  Future<void> onReload() async {
    startLoading();
    await fetchDocs();
    endLoading();
  }

  Future<void> onLoading(RefreshController refreshController) async {
    if (qDocInfoList.isEmpty) {
      refreshController.loadComplete();
      return;
    }
    try {
      final elements =
          await query.startAtDocument(qDocInfoList.last.qDoc).get();
      await addAllDocs(elements.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    if (qDocInfoList.isEmpty) return;
    try {
      final elements =
          await query.endBeforeDocument(qDocInfoList.first.qDoc).get();
      await insertAllDocs(elements.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
  }

  Future<List<PublicUser>> _getUsersByUids(List<String> uids) async {
    if (uids.isEmpty) return [];
    final repository = FirestoreRepository();
    final query = QueryCore.usersByWhereIn(uids);
    final result = await repository.getDocs(query);
    late List<PublicUser> users;
    result.when(success: (res) {
      users = res.map((e) => PublicUser.fromJson(e.data())).toList();
    }, failure: (e) {
      users = [];
    });
    return users;
  }
}