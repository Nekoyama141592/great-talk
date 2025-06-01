import 'dart:convert';

import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/view_model_state/common/image_user/image_user.dart';
import 'package:great_talk/model/view_model_state/ranking_users/ranking_users_state.dart';
import 'package:great_talk/providers/usecase/file/file_usecase.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'ranking_users_view_model.g.dart';

@riverpod
class RankingUsersViewModel extends _$RankingUsersViewModel {
  FirestoreRepository get _repository => ref.read(firestoreRepositoryProvider);
  @override
  FutureOr<RankingUsersState> build() {
    return _fetchData();
  }

  Future<RankingUsersState> _fetchData() async {
    final users = await _repository.getRankingUsers();
    final imageUsers = await _usersToImageUsers(users);
    return RankingUsersState(imageUsers: imageUsers);
  }

  Future<List<ImageUser>> _usersToImageUsers(List<PublicUser> users) async {
    final futures = users.map((user) async {
      final detectedImage = user.typedImage();
      final base64 = await ref.read(fileUseCaseProvider).getS3Image(detectedImage.bucketName,detectedImage.value);
      return ImageUser(user: user, base64: base64 != null ? base64Encode(base64) : null);
    }).toList();
    return Future.wait(futures);
  }

  void onLoading(RefreshController controller) async {
    final stateValue = state.value;
    if (stateValue == null) return;
    state = await AsyncValue.guard(() async {
      final oldUsers = stateValue.users();
      final users = await _repository.getMoreRankingUsers(oldUsers.last);
      final newUsers = [...oldUsers,...users];
      final userPosts = await _usersToImageUsers(newUsers);
      return stateValue.copyWith(imageUsers: userPosts);
    });
    controller.loadComplete();
  }
}