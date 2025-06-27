import 'package:great_talk/infrastructure/model/database_schema/follower/follower.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post.dart';
import 'package:great_talk/infrastructure/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/presentation/state/common/user_post/user_post.dart';
import 'package:great_talk/presentation/state/profile/profile_state.dart';
import 'package:great_talk/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/provider/keep_alive/usecase/file/file_use_case_provider.dart';
import 'package:great_talk/provider/view_model/refresh_interface.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_view_model.g.dart';

@riverpod
class ProfileViewModel extends _$ProfileViewModel implements RefreshInterface {
  DatabaseRepository get _repository => ref.read(databaseRepositoryProvider);
  @override
  FutureOr<ProfileState> build(String passiveUid) {
    return _fetchData();
  }

  Future<ProfileState> _fetchData() async {
    final user = await _fetchUser();
    final base64 = await _getImageFromUser(user);
    final userPosts = await _fetchUserPosts(user, base64);
    return ProfileState(user: user, base64: base64, userPosts: userPosts);
  }

  Future<PublicUser?> _fetchUser() async {
    return _repository.getPublicUser(passiveUid);
  }

  Future<String?> _getImageFromPost(Post post) async {
    final detectedImage = post.typedImage();
    final image = await ref
        .read(fileUseCaseProvider)
        .getObject(detectedImage.bucketName, detectedImage.value);
    return image;
  }

  Future<String?> _getImageFromUser(PublicUser? user) async {
    if (user == null) return null;
    final detectedImage = user.typedImage();
    final image = await ref
        .read(fileUseCaseProvider)
        .getObject(detectedImage.bucketName, detectedImage.value);
    return image;
  }

  Future<List<UserPost>> _fetchUserPosts(
    PublicUser? user,
    String? base64,
  ) async {
    final posts = await _repository.getUserPosts(passiveUid);
    final userPosts = await _postsToUserPosts(posts);
    return userPosts;
  }

  Future<List<UserPost>> _postsToUserPosts(List<Post> posts) async {
    final uids = posts.map((e) => e.uid).toSet();
    final fetchedUsers = await _repository.getUsersByUids(uids.toList());
    final userMap = {for (final user in fetchedUsers) user.uid: user};
    final futures =
        posts
            .where((post) {
              return userMap.containsKey(post.uid);
            })
            .map((post) async {
              final userImageBase64 = await _getImageFromPost(post);
              return UserPost(
                post: post,
                user: userMap[post.uid]!,
                base64: userImageBase64,
              );
            })
            .toList();

    final results = await Future.wait(futures);
    return results;
  }

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

  @override
  FutureResult<bool> onLoading() async {
    final stateValue = state.value!;
    state = await AsyncValue.guard(() async {
      final oldPosts = stateValue.posts();
      final posts = await _repository.getMoreUserPosts(oldPosts.last);
      final newPosts = [...oldPosts, ...posts];
      final userPosts = await _postsToUserPosts(newPosts);
      return stateValue.copyWith(userPosts: userPosts);
    });
    return const Result.success(true);
  }
}
