import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class DocsController extends GetxController with CurrentUserMixin {
  DocsController({required this.enablePullDown});
  final FirestoreRepository repository = FirestoreRepository();
  final bool enablePullDown;
  final docs = <QDoc>[].obs;
  final images = <Uint8List?>[].obs;
  final isLoading = false.obs;

  bool cannotShow() => isLoading.value;
  void _startLoading() => isLoading(true);
  void _endLoading() => isLoading(false);

  void setAllDocs(List<QDoc> elements) {
    docs([]); // 配列を初期化
    addAllDocs(elements);
  }

  void addAllDocs(List<QDoc> elements) async {
    final docIds = elements.map((e) => e.id).toList();
    for (final element in elements) {
      if (!docIds.contains(element.id)) {
        docs.add(element);
        await _addS3Image(element);
      }
    }
    docs([...docs]);
    images([...images]);
  }

  void insertAllDocs(List<QDoc> elements) async {
    final docIds = elements.map((e) => e.id).toList();
    for (final element in elements.reversed.toList()) {
      if (!docIds.contains(element.id)) {
        docs.insert(0, element);
        await _insertS3Image(element);
      }
    }
    docs([...docs]);
    images([...images]);
  }

  Future<void> _addS3Image(Doc element) async {
    final detectedImage = DetectedImage.fromJson(element['image']);
    final image = await FileUtility.getS3Image(
        detectedImage.bucketName, detectedImage.value);
    images.add(image);
  }

  Future<void> _insertS3Image(QDoc element) async {
    final detectedImage = DetectedImage.fromJson(element['image']);
    final image = await FileUtility.getS3Image(
        detectedImage.bucketName, detectedImage.value);
    images.insert(0, image);
  }

  Future<void> init() => onReload();
  Future<void> fetchDocs();
  Future<void> onRefresh(RefreshController refreshController);
  Future<void> onReload() async {
    _startLoading();
    await fetchDocs();
    _endLoading();
  }

  Future<void> onLoading(RefreshController refreshController);
}
