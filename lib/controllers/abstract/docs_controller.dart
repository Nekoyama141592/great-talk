import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/controllers/abstract/loading_controller.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/image_doc_wraper/image_q_doc_wraper.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class DocsController extends LoadingController with CurrentUserMixin {
  DocsController(
      {required this.enablePullDown, required this.requiresValueReset});
  final FirestoreRepository repository = FirestoreRepository();
  final bool enablePullDown;
  final bool requiresValueReset;
  final docs = <ImageQDocWraper>[].obs;
  final isInit = false.obs;

  void setAllDocs(List<QDoc> elements) {
    docs([]); // 配列を初期化
    addAllDocs(elements);
  }

  void addAllDocs(List<QDoc> elements) async {
    final docIds = docs.map((e) => e.doc.id).toList();
    for (final element in elements) {
      if (!docIds.contains(element.id)) {
        final image = await _getImageFromDoc(element);
        docs.add(ImageQDocWraper(element, image));
      }
    }
    docs([...docs]);
  }

  void insertAllDocs(List<QDoc> elements) async {
    final docIds = docs.map((e) => e.doc.id).toList();
    for (final element in elements.reversed.toList()) {
      if (!docIds.contains(element.id)) {
        final image = await _getImageFromDoc(element);
        docs.insert(0, ImageQDocWraper(element, image));
      }
    }
    docs([...docs]);
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
    if (isInit.value) {
      return;
    }
    await onReload();
    isInit(true);
  }

  Future<Uint8List?> _getImageFromDoc(Doc doc) async {
    final detectedImage = DetectedImage.fromJson(doc['image']);
    final image = await FileUtility.getS3Image(
        detectedImage.bucketName, detectedImage.value);
    return image;
  }

  Future<void> fetchDocs();
  Future<void> onRefresh(RefreshController refreshController);
  Future<void> onReload() async {
    startLoading();
    await fetchDocs();
    endLoading();
  }

  Future<void> onLoading(RefreshController refreshController);
}