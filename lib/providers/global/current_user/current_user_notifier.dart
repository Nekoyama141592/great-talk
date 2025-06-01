import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/model/database_schema/private_user/private_user.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/global/current_user/current_user/current_user_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/core/credential_core.dart';
import 'package:great_talk/repository/real/firebase_auth/firebase_auth_repository.dart';
import 'package:great_talk/repository/real/firestore/firestore_repository.dart';
import 'package:great_talk/providers/usecase/file/file_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_notifier.g.dart';

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {
  FirebaseAuthRepository get _firebaseAuthRepository =>
      ref.read(firebaseAuthRepositoryProvider);
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

  FutureResult<User> _createAnonymousUser() async {
    return await _firebaseAuthRepository.signInAnonymously();
  }

  FutureResult<User> onAppleButtonPressed() async {
    final repository = ref.read(
      firebaseAuthRepositoryProvider,
    ); // RiverpodでRepositoryを取得
    final result = await repository.signInWithApple();
    return result;
  }

  FutureResult<User> onGoogleButtonPressed() async {
    final repository = ref.read(
      firebaseAuthRepositoryProvider,
    ); // RiverpodでRepositoryを取得
    final result = await repository.signInWithGoogle();
    return result;
  }

  String? _getCurrentUid() => ref.watch(streamAuthUidProvider).value;

  Future<PublicUser?> _createPublicUser(String uid) {
    final repository = ref.read(firestoreRepositoryProvider);
    final newUser = PublicUser.fromRegister(uid);
    final json = newUser.toJson();
    return repository.createPublicUser(uid, json);
  }

  Future<PrivateUser?> _createPrivateUser(String uid) {
    final repository = ref.read(firestoreRepositoryProvider);
    final newPrivateUser = PrivateUser.fromUid(uid);
    final json = newPrivateUser.toJson();
    return repository.createPrivateUser(uid, json);
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
    final repository = ref.read(firestoreRepositoryProvider);
    var publicUser = await repository.getPublicUser(uid);
    publicUser ??= await _createPublicUser(uid);
    return publicUser; 
  }

  Future<PrivateUser?> _getPrivateUser(String uid) async {
    final repository = ref.read(firestoreRepositoryProvider);
    var privateUser = await repository.getPrivateUser(uid);
    privateUser ??= await _createPrivateUser(uid);
    return privateUser;
  }

  Future<String?> _getBase64Image(PublicUser? publicUser) async {
    if (publicUser == null) return null;
    final bucketName = publicUser.typedImage().bucketName;
    final fileName = publicUser.typedImage().value;
    if (bucketName.isEmpty || fileName.isEmpty) return null;
    final image = await ref.read(fileUseCaseProvider).getS3Image(bucketName, fileName);
    if (image == null) return null;
    return base64Encode(image);
  }

  FutureResult<bool> signOut() async {
    final repository = ref.read(firebaseAuthRepositoryProvider);
    final result = await repository.signOut();
    return result;
  }

  FutureResult<bool> reauthenticateWithAppleToDelete() async {
    final credential = await CredentialCore.appleCredential();
    return await _reauthenticateToDelete(credential);
  }

  FutureResult<bool> reauthenticateWithGoogleToDelete() async {
    final credential = await CredentialCore.googleCredential();
    return await _reauthenticateToDelete(credential);
  }

  FutureResult<bool> _reauthenticateToDelete(AuthCredential credential) async {
    final repository = ref.read(firebaseAuthRepositoryProvider);
    final result = await repository.reauthenticateWithCredential(credential);
    return result;
  }

  FutureResult<bool> deletePublicUser() async {
    final user = state.value?.publicUser;
    if (user == null) {
      return const Result.failure('ログインしてください');
    }
    final firestoreRepository = ref.read(firestoreRepositoryProvider);
    final result = await firestoreRepository.deletePublicUser(user.uid);
    late Result<bool> authResult;
    await result.when(
      success: (_) async => authResult = await _deleteAuthUser(),
      failure:
          (e) async =>
              authResult = const Result.failure('データベースからユーザーを削除できませんでした'),
    );
    return authResult;
  }

  FutureResult<bool> _deleteAuthUser() async {
    final firebaseAuthRepository = ref.read(firebaseAuthRepositoryProvider);
    final result = await firebaseAuthRepository.deleteUser();
    return result;
  }

  Future<void> _removeUserImage() async {}

  Future<void> updateUser() async {
    final uid = ref.read(streamAuthUidProvider).value;
    final stateValue = state.value;
    if (uid == null || stateValue == null) return;
    state = await AsyncValue.guard(() async {
      final publicUser = await _getPublicUser(uid);
      final base64 = await _getBase64Image(publicUser);
      return stateValue.copyWith(publicUser: publicUser,base64: base64);
    });
  }
}
