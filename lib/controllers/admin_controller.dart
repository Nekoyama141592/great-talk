import 'package:get/get.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/abstract/loading_controller.dart';
import 'package:great_talk/repository/firestore_repository.dart';

class AdminController extends LoadingController {
  final userCount = 0.obs;
  final postCount = 0.obs;
  final messageCount = 0.obs;
  final searchCount = 0.obs;
  final repository = FirestoreRepository();

  Future<void> init() async {
    startLoading();
    await Future.wait(
        [_countUsers(), _countPosts(), _countMessages(), _countSearchLogs()]);
    endLoading();
  }

  Future<void> _countUsers() async {
    final result = await repository.countUsers();
    result.when(success: (res) {
      userCount(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("ユーザー数の取得に失敗しました");
    });
  }

  Future<void> _countPosts() async {
    final result = await repository.countPosts();
    result.when(success: (res) {
      postCount(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("投稿数の取得に失敗しました");
    });
  }

  Future<void> _countMessages() async {
    final result = await repository.countMessages();
    result.when(success: (res) {
      messageCount(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("メッセージ数の取得に失敗しました");
    });
  }

  Future<void> _countSearchLogs() async {
    final result = await repository.countSearchLogs();
    result.when(success: (res) {
      searchCount(res);
    }, failure: () {
      UIHelper.showErrorFlutterToast("検索数の取得に失敗しました");
    });
  }
}
