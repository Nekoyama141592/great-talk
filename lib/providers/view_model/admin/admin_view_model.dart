import 'package:great_talk/model/view_model_state/admin/admin_state.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_view_model.g.dart';
@riverpod
class AdminViewModel extends _$AdminViewModel {
  final repository = FirestoreRepository();
  @override
  FutureOr<AdminState> build() async {
    final [userCount,postCount,messageCount,searchCount] = await Future.wait(
        [_countUsers(), _countPosts(), _countMessages(), _countSearchLogs()]);
    return AdminState(userCount: userCount, postCount: postCount, messageCount: messageCount, searchCount: searchCount);
  }
  Future<int> _countUsers() async {
    final result = await repository.countUsers();
    return result ?? 0;
  }

  Future<int> _countPosts() async {
    final result = await repository.countPosts();
    return result ?? 0;
  }

  Future<int> _countMessages() async {
    final result = await repository.countMessages();
    return result ?? 0;
  }

  Future<int> _countSearchLogs() async {
    final result = await repository.countSearchLogs();
    return result ?? 0;
  }
}