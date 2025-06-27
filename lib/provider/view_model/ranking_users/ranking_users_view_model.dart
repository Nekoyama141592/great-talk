import 'package:great_talk/presentation/state/ranking_users/ranking_users_state.dart';
import 'package:great_talk/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/provider/keep_alive/usecase/user/user_use_case_provider.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'ranking_users_view_model.g.dart';

@riverpod
class RankingUsersViewModel extends _$RankingUsersViewModel {
  DatabaseRepository get _repository => ref.read(databaseRepositoryProvider);
  @override
  FutureOr<RankingUsersState> build() {
    return _fetchData();
  }

  Future<RankingUsersState> _fetchData() async {
    final users = await _repository.getRankingUsers();
    final imageUsers = await ref
        .read(userUseCaseProvider)
        .usersToImageUsers(users);
    return RankingUsersState(imageUsers: imageUsers);
  }

  FutureResult<bool> onLoading() async {
    final stateValue = state.value!;
    state = await AsyncValue.guard(() async {
      final oldUsers = stateValue.users();
      final users = await _repository.getMoreRankingUsers(oldUsers.last);
      final newUsers = [...oldUsers, ...users];
      final imageUsers = await ref
          .read(userUseCaseProvider)
          .usersToImageUsers(newUsers);
      return stateValue.copyWith(imageUsers: imageUsers);
    });
    return const Result.success(true);
  }
}
