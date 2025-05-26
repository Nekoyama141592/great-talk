import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/view_model_state/docs/docs_state.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/mixin/current_uid_mixin.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/database_schema/q_doc_info/q_doc_info.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/model/database_schema/follower/follower.dart';
import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';

class DocsController extends GetxController with CurrentUserMixin {
  DocsController(this.type);
  final DocsType type;

  // 状態管理をDocsStateに一本化
  final state = Rx(DocsState());

  // state.valueを介してプロパティにアクセス
  bool isLoading() => state.value.isLoading;
  void startLoading() => state.value = state.value.copyWith(isLoading: true);
  void endLoading() => state.value = state.value.copyWith(isLoading: false);

  Future<void> init() async {
    if (type == DocsType.userProfiles) {
      await getPassiveUser();
    }
    // isTimelineをDocsState内で初期化
    final isTimeline = type == DocsType.bookmarks || type == DocsType.feeds;
    await onReload();
    state.value = state.value.copyWith(isTimeline: isTimeline);
    super.onInit();
  }

  void close() {
    state.value = DocsState();
  }

  // Query
  String passiveUid() => Get.parameters['uid']!;
  MapQuery setQuery() {
    switch (type) {
      case DocsType.bookmarks:
        final token = CurrentUserController.to.bookmarkCategoryTokens
            .firstWhere((element) => element.id == Get.parameters["categoryId"]);
        return QueryCore.bookmarks(token);
      case DocsType.feeds:
        return QueryCore.timelines(DocRefCore.user(currentUid()));
      case DocsType.mutePosts:
      case DocsType.muteUsers:
        throw UnimplementedError();
      case DocsType.newPosts:
        return QueryCore.postsByNewest();
      case DocsType.rankingPosts:
        return QueryCore.postsByMsgCount();
      case DocsType.userProfiles:
        return QueryCore.userPostsByNewest(passiveUid());
      case DocsType.rankingUsers:
        return QueryCore.usersByFollowerCount();
    }
  }

  Future<void> _updateDocInfoList(List<QDoc> elements, {bool front = false}) async {
    if (state.value.isLoading || elements.isEmpty) return;
    startLoading();
    try {
      final currentDocs = state.value.qDocInfoList;
      final docIds = currentDocs.map((e) => e.qDoc.id).toSet();
      final newElements = elements.where((e) => !docIds.contains(e.id)).toList();
      if (newElements.isEmpty) {
        endLoading();
        return;
      }

      final uids = newElements.map((e) => e.data()['uid'] as String).toSet();
      final fetchedUsers = await _getUsersByUids(uids.toList());
      final userMap = {for (final user in fetchedUsers) user.uid: user};

      final newQDocInfoList = await Future.wait(newElements
          .where((element) => userMap.containsKey(element.data()['uid']))
          .map((element) async {
        final publicUser = userMap[element.data()['uid']]!;
        final userImage = await _getImageFromDoc(element);
        return QDocInfo(publicUser: publicUser, qDoc: element, userImage: userImage);
      }));

      if (front) {
        state.value = state.value.copyWith(qDocInfoList: [...newQDocInfoList.reversed, ...currentDocs]);
      } else {
        state.value = state.value.copyWith(qDocInfoList: [...currentDocs, ...newQDocInfoList]);
      }
    } finally {
      endLoading();
    }
  }

  Future<void> addAllDocs(List<QDoc> elements) async {
    await _updateDocInfoList(elements);
  }

  Future<void> insertAllDocs(List<QDoc> elements) async {
    await _updateDocInfoList(elements, front: true);
  }

  List<QDoc> sortedDocs(List<QDoc> elements) {
    if (elements.isEmpty) {
      return [];
    } else {
      return elements..sort((a, b) => (b["createdAt"]).compareTo(a["createdAt"]));
    }
  }

  Future<Uint8List?> _getImageFromDoc(Doc doc) async {
    final detectedImage = DetectedImage.fromJson(doc['image']);
    final image = await FileUtility.getS3Image(detectedImage.bucketName, detectedImage.value);
    return image;
  }

  Future<void> fetchDocs() async {
    if (state.value.isTimeline) {
      fetchTimelineDocs();
      return;
    }
    try {
      final elements = await setQuery().get();
      await addAllDocs(elements.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
  }

  Future<void> onReload() async {
    startLoading();
    await fetchDocs();
    endLoading();
  }

  Future<void> onLoading(RefreshController refreshController) async {
    if (state.value.qDocInfoList.isEmpty) {
      refreshController.loadComplete();
      return;
    }
    if (state.value.isTimeline) {
      onLoadingTimeline(refreshController);
      return;
    }
    try {
      final elements = await setQuery().startAtDocument(state.value.qDocInfoList.last.qDoc).get();
      await addAllDocs(elements.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    if (state.value.qDocInfoList.isEmpty) return;
    try {
      final elements = await setQuery().endBeforeDocument(state.value.qDocInfoList.first.qDoc).get();
      await insertAllDocs(elements.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
  }

  Future<List<PublicUser>> _getUsersByUids(List<String> uids) async {
    if (uids.isEmpty) return [];
    final repository = FirestoreRepository();
    final query = QueryCore.usersByWhereIn(uids);
    final result = await repository.getDocs(query);
    late List<PublicUser> users;
    result.when(success: (res) {
      users = res.map((e) => PublicUser.fromJson(e.data())).toList();
    }, failure: (e) {
      users = [];
    });
    return users;
  }

  Future<List<QDoc>> _timelinesToPostsResult(List<QDoc> fetchedDocs) async {
    final repository = FirestoreRepository();
    final List<String> postIds = fetchedDocs.map((e) => e.data()["postId"] as String).toList();
    final query = QueryCore.timelinePosts(postIds);
    final posts = await repository.getDocsWithList(query);
    return posts;
  }

  Future<void> _fetchTimelinePosts(List<QDoc> fetchedTimelines) async {
    final res = await _timelinesToPostsResult(fetchedTimelines);
    addAllDocs(sortedDocs(res));
  }

  Future<void> _fetchMoreTimelinePosts(List<QDoc> fetchedTimelines) async {
    final res = await _timelinesToPostsResult(fetchedTimelines);
    addAllDocs(sortedDocs(res));
  }

  Future<void> fetchTimelineDocs() async {
    try {
      final result = await setQuery().get();
      // indexDocsをstate内で更新
      state.value = state.value.copyWith(indexDocs: result.docs);
      await _fetchTimelinePosts(result.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
  }

  Future<void> onLoadingTimeline(RefreshController refreshController) async {
    try {
      final result = await setQuery().startAfterDocument(state.value.indexDocs.last).get();
      final newIndexDocs = [...state.value.indexDocs, ...result.docs];
      // indexDocsをstate内で更新
      state.value = state.value.copyWith(indexDocs: newIndexDocs);
      await _fetchMoreTimelinePosts(result.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
    refreshController.loadComplete();
  }

  List<String> createRequestPostIds() {
    final int userDocsLength = state.value.qDocInfoList.length;
    final muteUids = CurrentUserController.to.mutePostIds;
    if (muteUids.length > state.value.qDocInfoList.length) {
      final List<String> requestUids =
          (muteUids.length - state.value.qDocInfoList.length) >= whereInLimit
              ? muteUids.sublist(userDocsLength, userDocsLength + whereInLimit)
              : muteUids.sublist(userDocsLength, muteUids.length);
      return requestUids;
    } else {
      return [];
    }
  }

  void onMutePostCardTap(Post post) {
    UIHelper.cupertinoAlertDialog("ミュートを解除しますがよろしいですか？",
        () => unMutePost(post).then((value) => Get.back()));
  }

  Future<void> unMutePost(Post post) async {
    final repository = FirestoreRepository();
    final postId = post.postId;
    final deleteToken = CurrentUserController.to.mutePostTokens
        .firstWhere((element) => element.postId == postId);
    CurrentUserController.to.removeMutePost(deleteToken);
    state.value.qDocInfoList.removeWhere(
        (element) => Post.fromJson(element.qDoc.data()).postId == postId);
    final tokenId = deleteToken.tokenId;
    final tokenRef = DocRefCore.token(currentUid(), tokenId);
    await repository.deleteDoc(tokenRef);
    final postRef = post.typedRef();
    final postMuteRef = DocRefCore.postMute(postRef, currentUid());
    await repository.deleteDoc(postMuteRef);
  }

  List<String> createRequestUids() {
    final int userDocsLength = state.value.qDocInfoList.length;
    final muteUids = CurrentUserController.to.muteUids;
    if (muteUids.length > state.value.qDocInfoList.length) {
      final List<String> requestUids =
          (muteUids.length - state.value.qDocInfoList.length) >= whereInLimit
              ? muteUids.sublist(userDocsLength, userDocsLength + whereInLimit)
              : muteUids.sublist(userDocsLength, muteUids.length);
      return requestUids;
    } else {
      return [];
    }
  }

  void onMuteUserCardTap(String passiveUid) {
    UIHelper.cupertinoAlertDialog("ミュートを解除しますがよろしいですか？",
        () => unMuteUser(passiveUid).then((value) => Get.back()));
  }

  Future<void> unMuteUser(String passiveUid) async {
    final repository = FirestoreRepository();
    final deleteToken = CurrentUserController.to.muteUserTokens
        .firstWhere((element) => element.passiveUid == passiveUid);
    CurrentUserController.to.removeMuteUer(deleteToken);
    state.value.qDocInfoList.removeWhere((element) =>
        PublicUser.fromJson(element.qDoc.data()).uid == passiveUid);
    final tokenId = deleteToken.tokenId;
    final tokenRef = DocRefCore.token(currentUid(), tokenId);
    await repository.deleteDoc(tokenRef);
    final userMuteRef = DocRefCore.userMute(passiveUid, currentUid());
    await repository.deleteDoc(userMuteRef);
  }
  Future<void> getPassiveUser() async {
    final repository = FirestoreRepository();
    final ref = DocRefCore.user(passiveUid());
    final result = await repository.getDoc(ref);
    result.when(success: (res) {
      if (res.exists) {
        state.value = state.value.copyWith(passiveUser: PublicUser.fromJson(res.data()!));
      }
    }, failure: (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    });
    final user = state.value.passiveUser;
    if (user == null) return;
    final detectedImage = user.typedImage();
    final s3Image = await FileUtility.getS3Image(
        detectedImage.bucketName, detectedImage.value);
    state.value = state.value.copyWith(uint8list: s3Image);
  }

  void onFollowPressed() async {
    if (state.value.passiveUser == null) {
      return;
    }
    if (state.value.passiveUser!.uid == currentUid()) {
      UIHelper.showFlutterToast("自分をフォローすることはできません。");
      return;
    }
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です。");
      return;
    }
    if (CurrentUserController.to.followingUids.length >= followLimit) {
      UIHelper.showFlutterToast("フォローできるのは$followLimit人までです。");
      return;
    }
    await _follow();
  }

  Future<void> _follow() async {
    final repository = FirestoreRepository();
    final String tokenId = randomString();
    final Timestamp now = Timestamp.now();
    final newUser = state.value.passiveUser!
        .copyWith(followerCount: state.value.passiveUser!.followerCount + plusOne);
    state.value = state.value.copyWith(passiveUser: newUser);
    final followingToken = FollowingToken(
        createdAt: now,
        passiveUid: passiveUid(),
        tokenId: tokenId,
        passiveUserRef: state.value.passiveUser!.ref,
        tokenType: TokenType.following.name);
    CurrentUserController.to.addFollowing(followingToken);
    final tokenRef = DocRefCore.token(currentUid(), tokenId);
    await repository.createDoc(tokenRef, followingToken.toJson());
    // 受動的なユーザーがフォローされたdataを生成する
    final follower = Follower(
        activeUserRef: CurrentUserController.to.rxPublicUser.value!.typedRef(),
        createdAt: now,
        passiveUserRef: state.value.passiveUser!.typedRef());
    final followerRef = DocRefCore.follower(currentUid(), passiveUid());
    await repository.createDoc(followerRef, follower.toJson());
  }

  void onUnFollowPressed() async {
    if (state.value.passiveUser == null) {
      return;
    }
    if (CurrentUserController.to.hasNoPublicUser()) {
      UIHelper.showFlutterToast("ログインが必要です");
      return;
    }
    await _unfollow();
  }

  Future<void> _unfollow() async {
    final repository = FirestoreRepository();
    final newUser = state.value.passiveUser!.copyWith(
        followerCount: state.value.passiveUser!.followerCount + minusOne);
    state.value = state.value.copyWith(passiveUser: newUser);
    final deleteToken = CurrentUserController.to.followingTokens
        .firstWhere((element) => element.passiveUid == passiveUid());
    CurrentUserController.to.removeFollowing(deleteToken);
    final tokenRef = DocRefCore.token(currentUid(), deleteToken.tokenId);
    await repository.deleteDoc(tokenRef);
    final followerRef = DocRefCore.follower(currentUid(), passiveUid());
    await repository.deleteDoc(followerRef);
  }

  bool isMyProfile() => passiveUid() == currentUid();
}