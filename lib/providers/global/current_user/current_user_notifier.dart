import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/model/global/current_user/current_user/current_user_state.dart';
import 'package:great_talk/providers/global/auth/stream_auth_provider.dart';
import 'package:great_talk/repository/on_call/on_call_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/infrastructure/credential_composer.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/database_schema/private_user/private_user.dart';
import 'package:great_talk/repository/firebase_auth/firebase_auth_repository.dart';
import 'package:great_talk/repository/firestore/firestore_repository.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/new_content.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_notifier.g.dart'; // 自動生成されるファイル

@Riverpod(keepAlive: true)
class CurrentUserNotifier extends _$CurrentUserNotifier {
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
    final repository = FirebaseAuthRepository();
    return await repository.signInAnonymously();
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

  String? _getCurrentUid() => ref.read(streamAuthUidProvider).value;

  Future<void> _createPublicUser() async {
    final repository = ref.read(firestoreRepositoryProvider);
    final uid = _getCurrentUid();
    if (uid == null) return;
    final newUser = NewContent.newUser(uid);
    final refDoc = DocRefCore.user(uid);
    final json = newUser.toJson();
    final result = await repository.createDoc(refDoc, json);
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
    final newPrivateUser = NewContent.newPrivateUser(uid);
    final refDoc = DocRefCore.privateUser(uid);
    final json = newPrivateUser.toJson();
    final result = await repository.createDoc(refDoc, json);
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
    final refDoc = DocRefCore.user(uid);
    final result = await repository.getDoc(refDoc);
    await result.when(
      success: (res) async {
        final data = res.data();
        if (res.exists && data != null) {
          final user = PublicUser.fromJson(data);
          String? base64Image;
          final bucketName = user.typedImage().bucketName;
          final fileName = user.typedImage().value;
          if (bucketName.isNotEmpty && fileName.isNotEmpty) {
            final image = await FileUtility.getS3Image(bucketName, fileName);
            if (image != null) {
              base64Image = base64Encode(image);
            }
          }
          _updateState(
            state.value!.copyWith(publicUser: user, base64: base64Image),
          );
        } else {
          await _createPublicUser();
        }
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("公開ユーザーデータの取得に失敗しました: ${e.toString()}");
      },
    );
  }

  Future<void> _getPrivateUser() async {
    final uid = _getCurrentUid();
    if (uid == null) return;
    final repository = ref.read(firestoreRepositoryProvider);
    final refDoc = DocRefCore.privateUser(uid);
    final result = await repository.getDoc(refDoc);
    await result.when(
      success: (res) async {
        final data = res.data();
        if (res.exists && data != null) {
          _updateState(
            state.value!.copyWith(privateUser: PrivateUser.fromJson(data)),
          );
        } else {
          await _createPrivateUser();
        }
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast(
          "プライベートユーザーデータの取得に失敗しました: ${e.toString()}",
        );
      },
    );
  }

  FutureResult<bool> signOut() async {
    final repository = ref.read(firebaseAuthRepositoryProvider);
    final result = await repository.signOut();
    return result;
  }

  FutureResult<bool> reauthenticateWithAppleToDelete() async {
    final credential = await CredentialComposer.appleCredential();
    return await _reauthenticateToDelete(credential);
  }

  FutureResult<bool> reauthenticateWithGoogleToDelete() async {
    final credential = await CredentialComposer.googleCredential();
    return await _reauthenticateToDelete(credential);
  }

  FutureResult<bool> _reauthenticateToDelete(AuthCredential credential) async {
    final repository = ref.read(firebaseAuthRepositoryProvider);
    final user = ref.read(streamAuthProvider).value;
    if (user == null) {
      return const Result.failure('ログインしてください');
    }
    final result = await repository.reauthenticateWithCredential(
      user,
      credential,
    );
    return result;
  }

  FutureResult<bool> deletePublicUser() async {
    final user = state.value?.publicUser;
    if (user == null) {
      return const Result.failure('ログインしてください');
    }
    final firestoreRepository = ref.read(firestoreRepositoryProvider);
    final refDoc = user.typedRef();
    final result = await firestoreRepository.deleteDoc(refDoc);
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
    final user = ref.read(streamAuthProvider).value;
    if (user == null) {
      return const Result.failure('ログインしてください');
    }
    final result = await firebaseAuthRepository.deleteUser(user);
    return result;
  }
  // TODO: Cloud Function
  // Future<void> _removeImage() async {
  //   final publicUser = state.value?.publicUser;
  //   if (publicUser == null) return;
  //   final fileName = publicUser.typedImage().value;
  //   final request = DeleteObjectRequest(object: fileName);
  //   await ref
  //       .read(awsS3RepositoryProvider)
  //       .deleteObject(request); // RiverpodでRepositoryを取得
  // }

  Future<void> updateUser() async {
    await _getPublicUser();
  }
}

@Riverpod(keepAlive: true)
FirebaseAuthRepository firebaseAuthRepository(Ref ref) {
  return FirebaseAuthRepository();
}

@Riverpod(keepAlive: true)
FirestoreRepository firestoreRepository(Ref ref) {
  return FirestoreRepository();
}

@Riverpod(keepAlive: true)
OnCallRepository awsS3Repository(Ref ref) {
  return OnCallRepository();
}
