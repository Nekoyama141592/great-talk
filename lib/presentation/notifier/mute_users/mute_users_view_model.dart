import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/presentation/state/mute_users/mute_users_state.dart';
import 'package:great_talk/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/presentation/notifier/tokens/tokens_notifier.dart';
import 'package:great_talk/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/provider/keep_alive/usecase/user/user_use_case_provider.dart';
import 'package:great_talk/repository/database_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mute_users_view_model.g.dart';

@riverpod
class MuteUsersViewModel extends _$MuteUsersViewModel {
  DatabaseRepository get _repository => ref.read(databaseRepositoryProvider);
  @override
  FutureOr<MuteUsersState> build() {
    return _fetchData();
  }

  Future<MuteUsersState> _fetchData() async {
    final users = await _repository.getMuteUsers(_createRequestUids());
    final imageUsers = await ref
        .read(userUseCaseProvider)
        .usersToImageUsers(users);
    return MuteUsersState(imageUsers: imageUsers);
  }

  // Mute User
  List<String> _createRequestUids() {
    final currentDocsLength = state.value?.imageUsers.length ?? 0;
    final muteUids = ref.read(tokensNotifierProvider).value?.muteUids ?? [];
    if (muteUids.length > currentDocsLength) {
      final remaining = muteUids.length - currentDocsLength;
      final limit = remaining >= whereInLimit ? whereInLimit : remaining;
      return muteUids.sublist(currentDocsLength, currentDocsLength + limit);
    }
    return [];
  }

  FutureResult<bool> onLoading() async {
    final stateValue = state.value!;
    state = await AsyncValue.guard(() async {
      final oldUsers = stateValue.users();
      final users = await _repository.getMoreMuteUsers(
        _createRequestUids(),
        oldUsers.last,
      );
      final newUsers = [...oldUsers, ...users];
      final imageUsers = await ref
          .read(userUseCaseProvider)
          .usersToImageUsers(newUsers);
      return stateValue.copyWith(imageUsers: imageUsers);
    });
    return const Result.success(true);
  }

  FutureResult<bool> unMuteUser(String passiveUid) async {
    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) {
      return const Result.failure('ログインしてください');
    }
    final deleteToken = ref
        .read(tokensNotifierProvider.notifier)
        .removeMuteUser(passiveUid);
    if (deleteToken == null) {
      return const Result.failure('ユーザーが見つかりませんでした');
    }
    final newImageUsers =
        state.value!.imageUsers
            .where((e) => e.user?.uid != passiveUid)
            .toList();
    state = AsyncValue.data(state.value!.copyWith(imageUsers: newImageUsers));
    final tokenId = deleteToken.tokenId;
    return await _repository.deleteMuteUserInfo(
      currentUid,
      passiveUid,
      tokenId,
    );
  }
}
