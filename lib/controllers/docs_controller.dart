import 'package:get/get.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class DocsController extends GetxController with CurrentUserMixin {
  DocsController({required this.enablePullDown, required this.isUserDocs});
  final FirestoreRepository repository = FirestoreRepository();
  final bool enablePullDown;
  final bool isUserDocs;
  final docs = <QDoc>[].obs;
  final isLoading = false.obs;

  bool cannotShow() => isLoading.value;
  void _startLoading() => isLoading(true);
  void _endLoading() => isLoading(false);
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
