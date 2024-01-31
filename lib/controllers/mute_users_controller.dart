import 'package:get/get.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MuteUsersController extends DocsController {
  @override
  bool get enablePullDown => true;
  @override
  bool get requiresValueReset => true;
  static MuteUsersController get to => Get.find<MuteUsersController>();
  @override
  void setQuery() {
    final requestUids = _createRequestUids();
    query = QueryCore.usersByWhereIn(requestUids);
  }

  @override
  Future<void> fetchDocs() async {
    final requestUids = _createRequestUids();
    if (requestUids.isNotEmpty) {
      await super.fetchDocs();
    }
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    setQuery();
    final requestUids = _createRequestUids();
    if (requestUids.isNotEmpty) {
      await super.onLoading(refreshController);
    }
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
    UIHelper.cupertinoAlertDialog("ミュートを解除しますがよろしいですか？",
        () => unMuteUser(passiveUid).then((value) => Get.back()));
  }

  Future<void> unMuteUser(String passiveUid) async {
    final repository = FirestoreRepository();
    final deleteToken = CurrentUserController.to.muteUserTokens
        .firstWhere((element) => element.passiveUid == passiveUid);
    CurrentUserController.to.removeMuteUer(deleteToken);
    docs.removeWhere(
        (element) => PublicUser.fromJson(element.doc.data()).uid == passiveUid);
    docs([...docs]);
    final tokenId = deleteToken.tokenId;
    final tokenRef = DocRefCore.token(currentUid(), tokenId);
    await repository.deleteDoc(tokenRef);
    final userMuteRef = DocRefCore.userMute(passiveUid, currentUid());
    await repository.deleteDoc(userMuteRef);
  }
}
