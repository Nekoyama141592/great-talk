import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/interfaces/new_docs_interface.dart';
import 'package:great_talk/repository/firestore_repository.dart';

class UserProfileController extends DocsController implements NewDocsInterface {
  final _repository = FirestoreRepository();
  String passiveUid = "";
  @override
  Future<void> fetchDocs() async {
    final result = await _repository.getUserPostsByNewest(passiveUid);
    result.when(success: (res) {
      docs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading() async {
    final result =
        await _repository.getMoreUserPostsByNewest(passiveUid, docs.last);
    result.when(success: (res) {
      addAllDocs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onRefresh() async {
    final result =
        await _repository.getNewUserPostsByNewest(passiveUid, docs.first);
    result.when(success: (res) {
      insertAllDocs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }
}
