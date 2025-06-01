import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/model/view_model_state/mute_users/mute_users_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/providers/global/tokens/tokens_notifier.dart';
import 'package:great_talk/providers/usecase/user/user_use_case_provider.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'mute_users_view_model.g.dart';

@riverpod
class MuteUsersViewModel extends _$MuteUsersViewModel {

  FirestoreRepository get _repository => ref.read(firestoreRepositoryProvider);
  @override
  FutureOr<MuteUsersState> build() {
    return _fetchData();
  }

  Future<MuteUsersState> _fetchData() async {
    final users = await _repository.getMuteUsers(_createRequestUids());
    final imageUsers = await ref.read(userUseCaseProvider).usersToImageUsers(users);
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

  void onLoading(RefreshController controller) async {
    final stateValue = state.value;
    if (stateValue == null) return;
    state = await AsyncValue.guard(() async {
      final oldUsers = stateValue.users();
      final users = await _repository.getMoreMuteUsers(_createRequestUids(),oldUsers.last);
      final newUsers = [...oldUsers,...users];
      final imageUsers = await ref.read(userUseCaseProvider).usersToImageUsers(newUsers);
      return stateValue.copyWith(imageUsers: imageUsers);
    });
    controller.loadComplete();
  }

  FutureResult<bool> unMuteUser(String passiveUid) async {
    final currentUid = ref.read(streamAuthUidProvider).value;
    if (currentUid == null) {
      return const Result.failure('ログインしてください');
    }
    final deleteToken = ref.read(tokensNotifierProvider.notifier).removeMuteUser(passiveUid);
    if (deleteToken == null) {
      return const Result.failure('ユーザーが見つかりませんでした');
    }
    final newImageUsers =
        state.value!.imageUsers
            .where((e) => e.user?.uid != passiveUid)
            .toList();
    state = AsyncValue.data(
      state.value!.copyWith(imageUsers: newImageUsers),
    );
    final tokenId = deleteToken.tokenId;
    return await _repository.deleteMuteUserInfo(
      currentUid,
      passiveUid,
      tokenId,
    );
  }
}