import 'package:get/get.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

abstract class DocsController extends GetxController {
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
  Future<void> onReload() => fetchDocs();
  Future<void> onLoading();
}
