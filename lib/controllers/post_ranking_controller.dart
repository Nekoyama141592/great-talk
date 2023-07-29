import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/repository/firestore_repository.dart';

class PostRankingController extends DocsController {
  PostRankingController() : super(enablePullDown: false);
  final _repository = FirestoreRepository();
  @override
  Future<void> onRefresh() async {
    return;
  }

  @override
  Future<void> fetchDocs() async {
    final result = await _repository.getPostsByLikeCount();
    result.when(success: (res) {
      docs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }

  @override
  Future<void> onLoading() async {
    final result = await _repository.getMorePostsByLikeCount(docs.last);
    result.when(success: (res) {
      addAllDocs(res);
    }, failure: () {
      UIHelper.showFlutterToast("データの取得に失敗しました");
    });
  }
}