import 'package:get/get.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

abstract class DocsController extends GetxController {
  final docs = <QDoc>[].obs;
  final isLoading = false.obs;

  void startLoading() => isLoading(true);
  void endLoading() => isLoading(false);

  Future<void> init();
  Future<void> fetchDocs();
  Future<void> onReload() => fetchDocs();
}
