import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/controllers/docs_controller.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MutePostsController extends DocsController {
  MutePostsController() : super(enablePullDown: true, requiresValueReset: true);
  static MutePostsController get to => Get.find<MutePostsController>();
  @override
  Future<void> fetchDocs() async {
    final requestPostIds = _createRequestPostIds();
    if (requestPostIds.isNotEmpty) {
      final result = await repository.getPostsByWhereIn(requestPostIds);
      result.when(success: (res) {
        setAllDocs(res);
      }, failure: () {
        UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      });
    }
  }

  @override
  Future<void> onLoading(RefreshController refreshController) async {
    final requestPostIds = _createRequestPostIds();
    if (requestPostIds.isNotEmpty) {
      final result = await repository.getPostsByWhereIn(requestPostIds);
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

  List<String> _createRequestPostIds() {
    final int userDocsLength = docs.length;
    final muteUids = CurrentUserController.to.mutePostIds;
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

  void onTap(Post post) {
    Get.dialog(CupertinoAlertDialog(
      content: const Text("ミュートを解除しますがよろしいですか？"),
      actions: [
        CupertinoDialogAction(
            onPressed: Get.back, child: const Text(cancelText)),
        CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              await unMutePost(post).then((value) => Get.back());
            },
            child: const Text(okText))
      ],
    ));
  }

  Future<void> unMutePost(Post post) async {
    final postId = post.postId;
    final deleteToken = CurrentUserController.to.mutePostTokens
        .firstWhere((element) => element.postId == postId);
    CurrentUserController.to.removeMutePost(deleteToken);
    docs.removeWhere(
        (element) => Post.fromJson(element.doc.data()).postId == postId);
    docs([...docs]);
    await repository.deleteToken(currentUid(), deleteToken.tokenId);
    await repository.deletePostMute(post.typedRef(), currentUid());
  }
}
