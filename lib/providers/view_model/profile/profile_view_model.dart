import 'dart:convert';

import 'package:great_talk/model/database_schema/follower/follower.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/view_model_state/profile/profile_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/providers/usecase/file/file_usecase.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_view_model.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel {
  FirestoreRepository get _repository => ref.read(firestoreRepositoryProvider);
  @override
  FutureOr<ProfileState> build(String passiveUid) {
    return _fetchData();
  }

  Future<ProfileState> _fetchData() async {
    final user = await _fetchUser();
    final base64 = await _getImageFromUser(user);
    final posts = await _fetchPosts();
    return ProfileState(user: user, base64: base64, posts: posts);
  }

  Future<PublicUser?> _fetchUser() async {
    return _repository.getPublicUser(passiveUid);
  }

  Future<String?> _getImageFromUser(PublicUser? user) async {
    if (user == null) return null;
    final detectedImage = user.typedImage();
    final image = await ref
        .read(fileUseCaseProvider)
        .getS3Image(detectedImage.bucketName, detectedImage.value);
    if (image == null) return null;
    return base64Encode(image);
  }

  Future<List<Post>> _fetchPosts() {
    return _repository.getUserPosts(passiveUid);
  }

  // TODO: 実装
  void onReload() async {}
  // Follow/Unfollow
  FutureResult<bool> onFollowPressed() async {
    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) return const Result.failure('ログインしてください');
    final user = state.value?.user;
    if (user == null) return const Result.failure('ユーザーが存在しません');
    if (currentUid == user.uid) {
      return const Result.failure('自分をフォローすることはできません');
    }
    return await _follow(currentUid, user);
  }

  FutureResult<bool> _follow(String currentUid, PublicUser passiveUser) async {
    // 楽観的に増やす
    final newUser = passiveUser.copyWith(
      followerCount: passiveUser.followerCount + 1,
    );
    state = AsyncValue.data(state.value!.copyWith(user: newUser));
    final follower = Follower.fromUid(currentUid, passiveUid);
    final token = ref
        .read(tokensNotifierProvider.notifier)
        .addFollowing(passiveUid);
    return await _repository.createFollowInfo(
      currentUid,
      passiveUid,
      token,
      follower,
    );
  }

  void onFollowFailed() {
    // 元に戻す
    final user = state.value?.user;
    if (user == null) return;
    final newUser = user.copyWith(followerCount: user.followerCount - 1);
    state = AsyncValue.data(state.value!.copyWith(user: newUser));
    ref.read(tokensNotifierProvider.notifier).removeFollowing(passiveUid);
  }

  FutureResult<bool> onUnFollowPressed() async {
    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) return const Result.failure('ログインしてください');
    final user = state.value?.user;
    if (user == null) return const Result.failure('ユーザーが存在しません');
    // 楽観的に減らす
    final newUser = user.copyWith(followerCount: user.followerCount + 1);
    state = AsyncValue.data(state.value!.copyWith(user: newUser));
    return _unfollow(currentUid, user);
  }

  FutureResult<bool> _unfollow(String currentUid, PublicUser user) async {
    final newUser = user.copyWith(followerCount: user.followerCount - 1);
    state = AsyncValue.data(state.value!.copyWith(user: newUser));
    final token = ref
        .read(tokensNotifierProvider.notifier)
        .removeFollowing(passiveUid);
    if (token == null) return const Result.failure('フォローした証が存在しません');
    return await _repository.deleteFollowInfoList(
      currentUid,
      passiveUid,
      token.tokenId,
    );
  }

  void onUnFollowFailed() {
    // 元に戻す
    final user = state.value?.user;
    if (user == null) return;
    final newUser = user.copyWith(followerCount: user.followerCount + 1);
    state = AsyncValue.data(state.value!.copyWith(user: newUser));
    ref.read(tokensNotifierProvider.notifier).addFollowing(passiveUid);
  }

  void onLoading(RefreshController controller) async {
    final stateValue = state.value;
    final uid = ref.read(streamAuthUidProvider).value;
    if (stateValue == null || uid == null) return;
    state = await AsyncValue.guard(() async {
      final posts = await _repository.getUserOldPosts(uid, stateValue.posts);
      return stateValue.copyWith(posts: posts);
    });
    controller.loadComplete();
  }
}
