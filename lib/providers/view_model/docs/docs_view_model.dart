import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/core/firestore/query_core.dart';
import 'package:great_talk/core/strings.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/database_schema/follower/follower.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/database_schema/q_doc_info/q_doc_info.dart';
import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/model/global/tokens/tokens_state.dart';
import 'package:great_talk/model/view_model_state/docs/docs_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'docs_view_model.g.dart';

@riverpod
class DocsViewModel extends _$DocsViewModel {
  String? get _uid => state.value?.passiveUser?.uid;

  @override
  FutureOr<DocsState> build(DocsType type,{String? passiveUid}) async {
    final isTimeline = type == DocsType.bookmarks || type == DocsType.feeds;
    var initialState = DocsState(isTimeline: isTimeline);

    if (type == DocsType.userProfiles) {
      final passiveUser = await _getPassiveUser(passiveUid);
      if (passiveUser != null) {
        final image = await _getImageFromUser(passiveUser);
        initialState = initialState.copyWith(
          passiveUser: passiveUser,
          uint8list: image,
        );
      }
    }

    // `build`メソッド内で初期データを取得
    state = AsyncValue.loading();
    final docsState = await _fetchInitialDocs(initialState);
    return docsState;
  }

  // DI
  String _currentUid() => ref.read(streamAuthUidProvider).value!;
  TokensNotifier _tokensNotifier() => ref.read(tokensNotifierProvider.notifier);
  TokensState _tokensState() =>
      ref.read(tokensNotifierProvider).value ?? TokensState();
  final _repository = FirestoreRepository();

  // Query
  MapQuery _setQuery() {
    switch (type) {
      case DocsType.bookmarks:
        final token = _tokensState().bookmarkCategoryTokens.firstWhere(
          (element) => element.id == Get.parameters["categoryId"],
        );
        return QueryCore.bookmarks(token);
      case DocsType.feeds:
        return QueryCore.timelines(DocRefCore.user(_currentUid()));
      case DocsType.mutePosts:
        return QueryCore.postsByWhereIn(_createRequestPostIds());
      case DocsType.muteUsers:
        return QueryCore.usersByWhereIn(_createRequestUids());
      case DocsType.newPosts:
        return QueryCore.postsByNewest();
      case DocsType.rankingPosts:
        return QueryCore.postsByMsgCount();
      case DocsType.userProfiles:
        return QueryCore.userPostsByNewest(_uid!);
      case DocsType.rankingUsers:
        return QueryCore.usersByFollowerCount();
    }
  }

  Future<DocsState> _fetchInitialDocs(DocsState currentState) async {
    if ((type == DocsType.mutePosts && _createRequestPostIds().isEmpty) ||
        (type == DocsType.muteUsers && _createRequestUids().isEmpty)) {
      return currentState;
    }

    try {
      if (currentState.isTimeline) {
        final result = await _setQuery().get();
        final postResult = await _timelinesToPostsResult(result.docs);
        final newQDocInfoList = await _createQDocInfoList(postResult);
        return currentState.copyWith(
          indexDocs: result.docs,
          qDocInfoList: newQDocInfoList,
        );
      } else {
        final elements = await _setQuery().get();
        final newQDocInfoList = await _createQDocInfoList(elements.docs);
        return currentState.copyWith(qDocInfoList: newQDocInfoList);
      }
    } catch (e, st) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      state = AsyncValue.error(e, st);
      return currentState;
    }
  }

  Future<void> onReload() async {
    state = const AsyncValue.loading();
    final newState = await _fetchInitialDocs(state.value ?? DocsState());
    state = AsyncValue.data(newState);
  }

  Future<void> onLoading(RefreshController refreshController) async {
    if (state.isLoading) return;
    if ((type == DocsType.mutePosts && _createRequestPostIds().isEmpty) ||
        (type == DocsType.muteUsers && _createRequestUids().isEmpty) ||
        (state.value?.qDocInfoList.isEmpty ?? true)) {
      refreshController.loadComplete();
      return;
    }

    final currentState = state.value!;
    try {
      if (currentState.isTimeline) {
        await _onLoadingTimeline(refreshController);
      } else {
        final elements =
            await _setQuery()
                .startAfterDocument(currentState.qDocInfoList.last.qDoc)
                .get();
        await _addAllDocs(elements.docs);
      }
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    } finally {
      refreshController.loadComplete();
    }
  }

  Future<void> _onLoadingTimeline(RefreshController refreshController) async {
    final currentState = state.value!;
    final result =
        await _setQuery().startAfterDocument(currentState.indexDocs.last).get();
    final newIndexDocs = [...currentState.indexDocs, ...result.docs];
    final postResult = await _timelinesToPostsResult(result.docs);
    await _addAllDocs(postResult);
    state = AsyncValue.data(currentState.copyWith(indexDocs: newIndexDocs));
  }

  Future<void> onRefresh() async {
    if (state.value?.qDocInfoList.isEmpty ?? true) return;
    final currentState = state.value!;
    try {
      final elements =
          await _setQuery()
              .endBeforeDocument(currentState.qDocInfoList.first.qDoc)
              .get();
      await _insertAllDocs(elements.docs);
    } catch (e) {
      UIHelper.showErrorFlutterToast("データの取得に失敗しました");
    }
  }

  Future<void> _updateDocInfoList(
    List<QDoc> elements, {
    bool front = false,
  }) async {
    if (state.isLoading || elements.isEmpty) return;
    final currentState = state.value!;
    final currentDocs = currentState.qDocInfoList;
    final docIds = currentDocs.map((e) => e.qDoc.id).toSet();
    final newElements = elements.where((e) => !docIds.contains(e.id)).toList();

    if (newElements.isEmpty) return;

    final newQDocInfoList = await _createQDocInfoList(newElements);
    if (front) {
      state = AsyncValue.data(
        currentState.copyWith(
          qDocInfoList: [...newQDocInfoList.reversed, ...currentDocs],
        ),
      );
    } else {
      state = AsyncValue.data(
        currentState.copyWith(
          qDocInfoList: [...currentDocs, ...newQDocInfoList],
        ),
      );
    }
  }

  Future<List<QDocInfo>> _createQDocInfoList(List<QDoc> elements) async {
    if (elements.isEmpty) return [];
    final uids = elements.map((e) => e.data()['uid'] as String).toSet();
    final fetchedUsers = await _getUsersByUids(uids.toList());
    final userMap = {for (final user in fetchedUsers) user.uid: user};

    final newQDocInfoList = await Future.wait(
      elements
          .where((element) {
            final uid = element.data()['uid'];
            return userMap.containsKey(uid);
          })
          .map((element) async {
            final publicUser = userMap[element.data()['uid']]!;
            final userImage = await _getImageFromDoc(element);
            return QDocInfo(
              publicUser: publicUser,
              qDoc: element,
              userImage: userImage,
            );
          }),
    );
    return newQDocInfoList;
  }

  Future<void> _addAllDocs(List<QDoc> elements) async =>
      await _updateDocInfoList(_sortedDocs(elements));

  Future<void> _insertAllDocs(List<QDoc> elements) async =>
      await _updateDocInfoList(_sortedDocs(elements), front: true);

  List<QDoc> _sortedDocs(List<QDoc> elements) {
    if (elements.isEmpty) return [];
    return elements..sort((a, b) => (b["createdAt"]).compareTo(a["createdAt"]));
  }

  Future<Uint8List?> _getImageFromDoc(Doc doc) async {
    final detectedImage = DetectedImage.fromJson(doc['image']);
    return FileUtility.getS3Image(
      detectedImage.bucketName,
      detectedImage.value,
    );
  }

  Future<Uint8List?> _getImageFromUser(PublicUser user) async {
    final detectedImage = user.typedImage();
    return FileUtility.getS3Image(
      detectedImage.bucketName,
      detectedImage.value,
    );
  }

  Future<List<PublicUser>> _getUsersByUids(List<String> uids) async {
    if (uids.isEmpty) return [];
    final query = QueryCore.usersByWhereIn(uids);
    final result = await _repository.getDocs(query);
    return result.when(
      success: (res) => res.map((e) => PublicUser.fromJson(e.data())).toList(),
      failure: (_) => [],
    );
  }

  Future<List<QDoc>> _timelinesToPostsResult(List<QDoc> fetchedDocs) async {
    if (fetchedDocs.isEmpty) return [];
    final postIds =
        fetchedDocs.map((e) => e.data()["postId"] as String).toList();
    if (postIds.isEmpty) return [];
    final query = QueryCore.timelinePosts(postIds);
    return await _repository.getDocsWithList(query);
  }

  // Mute Post
  List<String> _createRequestPostIds() {
    final currentDocsLength = state.value?.qDocInfoList.length ?? 0;
    final mutePostIds = _tokensState().mutePostIds;
    if (mutePostIds.length > currentDocsLength) {
      final remaining = mutePostIds.length - currentDocsLength;
      final limit = remaining >= whereInLimit ? whereInLimit : remaining;
      return mutePostIds.sublist(currentDocsLength, currentDocsLength + limit);
    }
    return [];
  }

  void onMutePostCardTap(Post post) {
    UIHelper.cupertinoAlertDialog(
      "ミュートを解除しますがよろしいですか？",
      () => unMutePost(post).then((_) => Get.back()),
    );
  }

  Future<void> unMutePost(Post post) async {
    final postId = post.postId;
    final deleteToken = _tokensState().mutePostTokens.firstWhere(
      (e) => e.postId == postId,
    );
    _tokensNotifier().removeMutePost(deleteToken);

    final newQDocInfoList =
        state.value!.qDocInfoList
            .where((e) => Post.fromJson(e.qDoc.data()).postId != postId)
            .toList();
    state = AsyncValue.data(
      state.value!.copyWith(qDocInfoList: newQDocInfoList),
    );

    final tokenRef = DocRefCore.token(_currentUid(), deleteToken.tokenId);
    await _repository.deleteDoc(tokenRef);
    final postMuteRef = DocRefCore.postMute(post.typedRef(), _currentUid());
    await _repository.deleteDoc(postMuteRef);
  }

  // Mute User
  List<String> _createRequestUids() {
    final currentDocsLength = state.value?.qDocInfoList.length ?? 0;
    final muteUids = _tokensState().muteUids;
    if (muteUids.length > currentDocsLength) {
      final remaining = muteUids.length - currentDocsLength;
      final limit = remaining >= whereInLimit ? whereInLimit : remaining;
      return muteUids.sublist(currentDocsLength, currentDocsLength + limit);
    }
    return [];
  }

  void onMuteUserCardTap(String passiveUid) {
    UIHelper.cupertinoAlertDialog(
      "ミュートを解除しますがよろしいですか？",
      () => unMuteUser(passiveUid).then((_) => Get.back()),
    );
  }

  Future<void> unMuteUser(String passiveUid) async {
    final deleteToken = _tokensState().muteUserTokens.firstWhere(
      (e) => e.passiveUid == passiveUid,
    );
    _tokensNotifier().removeMuteUser(deleteToken);

    final newQDocInfoList =
        state.value!.qDocInfoList
            .where((e) => PublicUser.fromJson(e.qDoc.data()).uid != passiveUid)
            .toList();
    state = AsyncValue.data(
      state.value!.copyWith(qDocInfoList: newQDocInfoList),
    );

    final tokenRef = DocRefCore.token(_currentUid(), deleteToken.tokenId);
    await _repository.deleteDoc(tokenRef);
    final userMuteRef = DocRefCore.userMute(passiveUid, _currentUid());
    await _repository.deleteDoc(userMuteRef);
  }

  // User Profile
  Future<PublicUser?> _getPassiveUser(String? passiveUid) async {
    if (passiveUid == null) return null;
    final ref = DocRefCore.user(passiveUid);
    final result = await _repository.getDoc(ref);
    return result.when(
      success: (res) {
        final data = res.data();
        if (data == null) return null;
        return PublicUser.fromJson(data);
      },
      failure: (_) {
        UIHelper.showErrorFlutterToast("ユーザー情報の取得に失敗しました");
        return null;
      },
    );
  }

  // Follow/Unfollow
  void onFollowPressed() async {
    if (state.value?.passiveUser == null) return;
    final passiveUser = state.value!.passiveUser!;
    if (passiveUser.uid == _currentUid()) {
      UIHelper.showFlutterToast("自分をフォローすることはできません。");
      return;
    }
    if (_tokensState().followingUids.length >= followLimit) {
      UIHelper.showFlutterToast("フォローできるのは$followLimit人までです。");
      return;
    }
    await _follow(passiveUser);
  }

  Future<void> _follow(PublicUser passiveUser) async {
    final newUser = passiveUser.copyWith(
      followerCount: passiveUser.followerCount + 1,
    );
    state = AsyncValue.data(state.value!.copyWith(passiveUser: newUser));

    final tokenId = randomString();
    final now = Timestamp.now();
    final followingToken = FollowingToken(
      createdAt: now,
      passiveUid: _uid!,
      tokenId: tokenId,
      passiveUserRef: passiveUser.ref,
      tokenType: TokenType.following.name,
    );
    _tokensNotifier().addFollowing(followingToken);

    final tokenRef = DocRefCore.token(_currentUid(), tokenId);
    await _repository.createDoc(tokenRef, followingToken.toJson());

    final follower = Follower(
      activeUserRef: DocRefCore.user(_currentUid()),
      createdAt: now,
      passiveUserRef: passiveUser.typedRef(),
    );
    final followerRef = DocRefCore.follower(_currentUid(), _uid!);
    await _repository.createDoc(followerRef, follower.toJson());
  }

  void onUnFollowPressed() async {
    if (state.value?.passiveUser == null) return;
    await _unfollow(state.value!.passiveUser!);
  }

  Future<void> _unfollow(PublicUser passiveUser) async {
    final newUser = passiveUser.copyWith(
      followerCount: passiveUser.followerCount - 1,
    );
    state = AsyncValue.data(state.value!.copyWith(passiveUser: newUser));

    final deleteToken = _tokensState().followingTokens.firstWhere(
      (element) => element.passiveUid == _uid!,
    );
    _tokensNotifier().removeFollowing(deleteToken);

    final tokenRef = DocRefCore.token(_currentUid(), deleteToken.tokenId);
    await _repository.deleteDoc(tokenRef);
    final followerRef = DocRefCore.follower(_currentUid(), _uid!);
    await _repository.deleteDoc(followerRef);
  }

  bool isMyProfile() => _uid == _currentUid();
}
