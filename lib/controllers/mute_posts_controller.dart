import 'package:get/get.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/abstract/docs_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MutePostsController extends DocsController {
  @override
  bool get enablePullDown => true;
  @override
  bool get requiresValueReset => true;
  static MutePostsController get to => Get.find<MutePostsController>();
  @override
  void setQuery() {
    final requestPostIds = _createRequestPostIds();
    query = QueryCore.postsByWhereIn(requestPostIds);
  }

  @override
  Future<void> fetchDocs() async {
    final requestPostIds = _createRequestPostIds();
    if (requestPostIds.isNotEmpty) {
      await super.fetchDocs();
    }
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    setQuery();
    final requestPostIds = _createRequestPostIds();
    if (requestPostIds.isNotEmpty) {
      await super.onLoading(refreshController);
    }
  }

  List<String> _createRequestPostIds() {
    final int userDocsLength = qDocInfoList.length;
    final muteUids = CurrentUserController.to.mutePostIds;
    if (muteUids.length > qDocInfoList.length) {
      final List<String> requestUids =
          (muteUids.length - qDocInfoList.length) >= whereInLimit
              ? muteUids.sublist(userDocsLength, userDocsLength + whereInLimit)
              : muteUids.sublist(userDocsLength, muteUids.length);
      return requestUids;
    } else {
      return [];
    }
  }

  void onTap(Post post) {
    UIHelper.cupertinoAlertDialog("ミュートを解除しますがよろしいですか？",
        () => unMutePost(post).then((value) => Get.back()));
  }

  Future<void> unMutePost(Post post) async {
    final repository = FirestoreRepository();
    final postId = post.postId;
    final deleteToken = CurrentUserController.to.mutePostTokens
        .firstWhere((element) => element.postId == postId);
    CurrentUserController.to.removeMutePost(deleteToken);
    qDocInfoList.removeWhere(
        (element) => Post.fromJson(element.qDoc.data()).postId == postId);
    final tokenId = deleteToken.tokenId;
    final tokenRef = DocRefCore.token(currentUid(), tokenId);
    await repository.deleteDoc(tokenRef);
    final postRef = post.typedRef();
    final postMuteRef = DocRefCore.postMute(postRef, currentUid());
    await repository.deleteDoc(postMuteRef);
  }
}
