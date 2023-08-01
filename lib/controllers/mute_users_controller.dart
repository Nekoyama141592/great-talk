import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MuteUsersController extends DocsController {
  MuteUsersController() : super(enablePullDown: true, isUserDocs: true);
  @override
  Future<void> fetchDocs() async {
    final requestUids = _createRequestUids();
    if (requestUids.isNotEmpty) {
      final result = await repository.getUsersByWhereIn(requestUids);
      result.when(success: (res) {
        docs(res);
      }, failure: () {
        UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      });
    }
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    final requestUids = _createRequestUids();
    if (requestUids.isNotEmpty) {
      final result = await repository.getUsersByWhereIn(requestUids);
      result.when(success: (res) {
        addAllDocs(res);
      }, failure: () {
        UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      });
    }
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh(RefreshController refreshController) async {
    refreshController.refreshCompleted();
    return;
  }

  List<String> _createRequestUids() {
    final int userDocsLength = docs.length;
    final muteUids = CurrentUserController.to.muteUids;
    if (muteUids.length > docs.length) {
      final List<String> requestUids =
          (muteUids.length - docs.length) >= whereInLimit
              ? muteUids.sublist(userDocsLength, userDocsLength + whereInLimit)
              : muteUids.sublist(userDocsLength, muteUids.length);
      return requestUids;
    } else {
      return [];
    }
  }

  Future<void> unMuteUser(String passiveUid) async {
    final deleteToken = CurrentUserController.to.muteUserTokens
        .firstWhere((element) => element.passiveUid == passiveUid);
    CurrentUserController.to.removeMuteUer(deleteToken);
    docs.removeWhere(
        (element) => FirestoreUser.fromJson(element.data()).uid == passiveUid);
    docs([...docs]);
    await repository.deleteToken(currentUid(), deleteToken.tokenId);
    await repository.deleteUserMute(passiveUid);
  }
}
