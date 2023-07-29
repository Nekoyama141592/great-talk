import 'package:get/get.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class DocsController extends GetxController {
  DocsController({required this.enablePullDown});

  final bool enablePullDown;
  final docs = <QDoc>[].obs;
  final isLoading = false.obs;

  void startLoading() => isLoading(true);
  void endLoading() => isLoading(false);
  void addAllDocs(List<QDoc> elements) {
    docs.addAll(elements);
    docs([...docs]);
  }

  void insertAllDocs(List<QDoc> elements) {
    for (final element in elements.reversed.toList()) {
      docs.insert(0, element);
    }
    docs([...docs]);
  }

  Future<void> init() => fetchDocs();
  Future<void> fetchDocs();
  Future<void> onRefresh(RefreshController refreshController);
  Future<void> onReload() => fetchDocs();
  Future<void> onLoading(RefreshController refreshController);
}
