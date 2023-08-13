import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MuteUsersController extends DocsController {
  MuteUsersController() : super(enablePullDown: true);
  static MuteUsersController get to => Get.find<MuteUsersController>();
  @override
  Future<void> fetchDocs() async {
    final requestUids = _createRequestUids();
    if (requestUids.isNotEmpty) {
      final result = await repository.getUsersByWhereIn(requestUids);
      result.when(success: (res) {
        setAllDocs(res);
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

  void onTap(String passiveUid) {
    Get.dialog(CupertinoAlertDialog(
      content: const Text("ミュートを解除しますがよろしいですか？"),
      actions: [
        CupertinoDialogAction(
            onPressed: Get.back, child: const Text(cancelText)),
        CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              await unMuteUser(passiveUid).then((value) => Get.back());
            },
            child: const Text(okText))
      ],
    ));
  }

  Future<void> unMuteUser(String passiveUid) async {
    final deleteToken = CurrentUserController.to.muteUserTokens
        .firstWhere((element) => element.passiveUid == passiveUid);
    CurrentUserController.to.removeMuteUer(deleteToken);
    docs.removeWhere(
        (element) => PublicUser.fromJson(element.doc.data()).uid == passiveUid);
    docs([...docs]);
    await repository.deleteToken(currentUid(), deleteToken.tokenId);
    await repository.deleteUserMute(passiveUid, currentUid());
  }
}
