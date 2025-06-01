import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/model/database_schema/private_user/private_user.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/global/current_user/current_user/current_user_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
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
    final initialState = CurrentUserState(
      publicUser: null,
      privateUser: null,
      base64: null,
    );

    state = AsyncData(initialState); // 初期状態を設定
    final authUserData = ref.watch(streamAuthProvider).value;
    if (authUserData == null || authUserData.isAnonymous) {
      // 匿名ユーザーまたは未ログインの場合は、データをフェッチせずに終了
      if (authUserData == null) {
        await _createAnonymousUser(); // 匿名ユーザーを作成
      }
      return state.value!;
    }

    await _fetchData(); // ログイン済みユーザーの場合はデータをフェッチ
    return state.value!;
  }

  // 状態を更新するためのヘルパーメソッド
  void _updateState(CurrentUserState newState) {
    state = AsyncData(newState);
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

  Future<void> onLoginSuccess(User user) async {
    await _fetchData();
  }

  String? _getCurrentUid() => ref.watch(streamAuthUidProvider).value;

  Future<void> _createPublicUser() async {
    final repository = ref.read(firestoreRepositoryProvider);
    final uid = _getCurrentUid();
    if (uid == null) return;
    final newUser = PublicUser.fromRegister(uid);
    final json = newUser.toJson();
    final result = await repository.createPublicUser(uid, json);
    result.when(
      success: (_) {
        _updateState(state.value!.copyWith(publicUser: newUser));
        UIHelper.showFlutterToast("ユーザーが作成されました");
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast(
          "データベースにユーザーを作成できませんでした: ${e.toString()}",
        );
      },
    );
  }

  Future<void> _createPrivateUser() async {
    final uid = _getCurrentUid();
    if (uid == null) return;
    final repository = ref.read(firestoreRepositoryProvider);
    final newPrivateUser = PrivateUser.fromUid(uid);
    final json = newPrivateUser.toJson();
    final result = await repository.createPrivateUser(uid, json);
    result.when(
      success: (_) {
        _updateState(state.value!.copyWith(privateUser: newPrivateUser));
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast(
          "データベースにプライベートユーザーを作成できませんでした: ${e.toString()}",
        );
      },
    );
  }

  Future<void> _fetchData() async {
    if (_getCurrentUid() == null) {
      // UIDがない場合は処理をスキップ
      return;
    }
    await _getPublicUser();
    await _getPrivateUser();
  }

  Future<void> _getPublicUser() async {
    final uid = _getCurrentUid();
    if (uid == null) return;
    final repository = ref.read(firestoreRepositoryProvider);
    final publicUser = await repository.getPublicUser(uid);
    if (publicUser == null) {
      await _createPublicUser();
    } else {
      String? base64Image;
      final bucketName = publicUser.typedImage().bucketName;
      final fileName = publicUser.typedImage().value;
      if (bucketName.isNotEmpty && fileName.isNotEmpty) {
        final image = await ref
            .read(fileUseCaseProvider)
            .getS3Image(bucketName, fileName);
        if (image != null) {
          base64Image = base64Encode(image);
        }
      }
      _updateState(
        state.value!.copyWith(publicUser: publicUser, base64: base64Image),
      );
    }
  }

  Future<void> _getPrivateUser() async {
    final uid = _getCurrentUid();
    if (uid == null) return;
    final repository = ref.read(firestoreRepositoryProvider);
    final privateUser = await repository.getPrivateUser(uid);
    if (privateUser == null) {
      await _createPrivateUser();
    } else {
      _updateState(state.value!.copyWith(privateUser: privateUser));
    }
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
    await _getPublicUser();
  }
}
