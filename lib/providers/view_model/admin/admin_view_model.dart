import 'package:great_talk/model/view_model_state/admin/admin_state.dart';
import 'package:great_talk/providers/repository/database/database_repository_provider.dart';
import 'package:great_talk/repository/database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_view_model.g.dart';

@riverpod
class AdminViewModel extends _$AdminViewModel {
  DatabaseRepository get _repository => ref.read(databaseRepositoryProvider);
  @override
  FutureOr<AdminState> build() async {
    final [userCount, postCount, messageCount] = await Future.wait([
      _countUsers(),
      _countPosts(),
      _countMessages(),
    ]);
    return AdminState(
      userCount: userCount,
      postCount: postCount,
      messageCount: messageCount,
    );
  }

  Future<int> _countUsers() async {
    final result = await _repository.countUsers();
    return result ?? 0;
  }

  Future<int> _countPosts() async {
    final result = await _repository.countPosts();
    return result ?? 0;
  }

  Future<int> _countMessages() async {
    final result = await _repository.countMessages();
    return result ?? 0;
  }
}
