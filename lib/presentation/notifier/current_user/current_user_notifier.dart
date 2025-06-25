import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/domain/entity/private_user/private_user.dart';
import 'package:great_talk/domain/entity/public_user/public_user.dart';
import 'package:great_talk/presentation/state/current_user/current_user/current_user_state.dart';
import 'package:great_talk/provider/keep_alive/stream/auth/stream_auth_provider.dart';
import 'package:great_talk/provider/repository/api/api_repository_provider.dart';
import 'package:great_talk/provider/repository/auth/auth_repository_provider.dart';
import 'package:great_talk/provider/repository/database/database_repository_provider.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/core/credential_core.dart';
import 'package:great_talk/repository/auth_repository.dart';
import 'package:great_talk/repository/database_repository.dart';
import 'package:great_talk/provider/keep_alive/usecase/file/file_use_case_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_notifier.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {
  AuthRepository get _authRepository => ref.watch(authRepositoryProvider);
  DatabaseRepository get _databaseRepository =>
      ref.watch(databaseRepositoryProvider);
  @override
  Future<CurrentUserState> build() async {
    final initialState = CurrentUserState();
    final authUserData = ref.watch(streamAuthProvider).value;
    if (authUserData == null) {
      await _createAnonymousUser(); // 匿名ユーザーを作成
      return initialState;
    }
    if (authUserData.isAnonymous) {
      return initialState;
    }

    return _fetchData();
  }

  FutureResult<User> _createAnonymousUser() {
    return _authRepository.signInAnonymously();
  }

  FutureResult<User> onAppleButtonPressed() {
    return _authRepository.signInWithApple();
  }

  FutureResult<User> onGoogleButtonPressed() {
    return _authRepository.signInWithGoogle();
  }

  String? _getCurrentUid() => ref.watch(streamAuthUidProvider).value;

  Future<PublicUser?> _createPublicUser(String uid) {
    final newUser = PublicUser.fromRegister(uid);
    final json = newUser.toJson();
    return _databaseRepository.createPublicUser(uid, json);
  }

  Future<PrivateUser?> _createPrivateUser(String uid) {
    final newPrivateUser = PrivateUser.fromUid(uid);
    final json = newPrivateUser.toJson();
    return _databaseRepository.createPrivateUser(uid, json);
  }

  Future<CurrentUserState> _fetchData() async {
    final uid = _getCurrentUid();
    if (uid == null) {
      return CurrentUserState();
    }
    final publicUser = await _getPublicUser(uid);
    final privateUser = await _getPrivateUser(uid);
    final base64 = await _getBase64Image(publicUser);
    return CurrentUserState(
      publicUser: publicUser,
      privateUser: privateUser,
      base64: base64,
    );
  }

  Future<PublicUser?> _getPublicUser(String uid) async {
    var publicUser = await _databaseRepository.getPublicUser(uid);
    publicUser ??= await _createPublicUser(uid);
    return publicUser;
  }

  Future<PrivateUser?> _getPrivateUser(String uid) async {
    var privateUser = await _databaseRepository.getPrivateUser(uid);
    privateUser ??= await _createPrivateUser(uid);
    return privateUser;
  }

  Future<String?> _getBase64Image(PublicUser? publicUser) async {
    if (publicUser == null) return null;
    final bucketName = publicUser.typedImage().bucketName;
    final fileName = publicUser.typedImage().value;
    if (bucketName.isEmpty || fileName.isEmpty) return null;
    final image = await ref
        .read(fileUseCaseProvider)
        .getS3Image(bucketName, fileName);
    return image;
  }

  FutureResult<bool> signOut() async {
    final result = await _authRepository.signOut();
    return result;
  }

  FutureResult<bool> reauthenticateWithAppleToDelete() async {
    final credential = await CredentialCore.appleCredential();
    return await _reauthenticateToDelete(credential);
  }

  FutureResult<bool> reauthenticateWithGoogleToDelete() async {
    final credential = await CredentialCore.googleCredential();
    return _reauthenticateToDelete(credential);
  }

  FutureResult<bool> _reauthenticateToDelete(AuthCredential credential) {
    return _authRepository.reauthenticateWithCredential(credential);
  }

  FutureResult<bool> deletePublicUser() async {
    final user = state.value?.publicUser;
    if (user == null) {
      return const Result.failure('ログインしてください');
    }
    final result = await _databaseRepository.deletePublicUser(user.uid);
    late Result<bool> authResult;
    await result.when(
      success: (_) async => authResult = await _deleteAuthUser(),
      failure:
          (e) async =>
              authResult = const Result.failure('データベースからユーザーを削除できませんでした'),
    );
    authResult.when(
      success: (_) {
        final image = user.typedImage();
        ref.read(apiRepositoryProvider).deleteObject(image);
      },
      failure: (_) {},
    );
    return authResult;
  }

  FutureResult<bool> _deleteAuthUser() async {
    final result = await _authRepository.deleteUser();
    return result;
  }

  Future<void> updateUser() async {
    final uid = ref.read(streamAuthUidProvider).value;
    final stateValue = state.value;
    if (uid == null || stateValue == null) return;
    state = await AsyncValue.guard(() async {
      final publicUser = await _getPublicUser(uid);
      final base64 = await _getBase64Image(publicUser);
      return stateValue.copyWith(publicUser: publicUser, base64: base64);
    });
  }
}
