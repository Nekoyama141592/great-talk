import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/model/global/current_user/auth_user/auth_user.dart';
import 'package:great_talk/model/global/current_user/current_user_state.dart';
import 'package:great_talk/ui_core/ui_helper.dart';
import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/infrastructure/credential_composer.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/rest_api/delete_object/request/delete_object_request.dart';
import 'package:great_talk/model/database_schema/private_user/private_user.dart';
import 'package:great_talk/repository/aws_s3_repository.dart';
import 'package:great_talk/repository/firebase_auth_repository.dart';
import 'package:great_talk/repository/firestore_repository.dart';
import 'package:great_talk/utility/file_utility.dart';
import 'package:great_talk/utility/new_content.dart';
import 'package:great_talk/views/auth/logouted_page.dart';
import 'package:great_talk/views/auth/user_deleted_page.dart';

class CurrentUserController extends GetxController {
  static CurrentUserController get to => Get.find<CurrentUserController>();
  final state = const CurrentUserState().obs;

  @override
  void onInit() async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser != null) {
      // stateを更新
      state.value =
          state.value.copyWith(authUser: AuthUser.fromFirebaseAuthUser(authUser));
    }
    await _fetchData();
    super.onInit();
  }

  Future<void> _createAnonymousUser() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInAnonymously();
    result.when(success: setAuthUser, failure: (e) {});
  }

  void setAuthUser(User user) {
    // stateを更新
    state.value =
        state.value.copyWith(authUser: AuthUser.fromFirebaseAuthUser(user));
  }
  // stateから値を取得
  String currentUid() => state.value.authUser?.uid ?? '';

  bool isAdmin() => state.value.privateUser?.isAdmin ?? false;
  bool isOfficial() => state.value.publicUser?.isOfficial ?? false;

  bool isAnonymous() => state.value.authUser!.isAnonymous;

  bool isNotLoggedIn() => state.value.authUser == null || isAnonymous();
  bool isLoggedIn() => !isNotLoggedIn();

  bool isNotVerified() => !state.value.authUser!.emailVerified;

  Future<void> onAppleButtonPressed() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInWithApple();
    await result.when(success: onLoginSuccess, failure: (e) {});
  }

  Future<void> onGoogleButtonPressed() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInWithGoogle();
    await result.when(success: onLoginSuccess, failure: (e) {});
  }

  Future<void> onLoginSuccess(User user) async {
    Get.back();
    UIHelper.showFlutterToast("ログインに成功しました");
    await user.reload();
    setAuthUser(user);
    await _fetchData();
  }

  Future<void> _createPublicUser() async {
    final repository = FirestoreRepository();
    final newUser = NewContent.newUser(currentUid());
    final ref = DocRefCore.user(currentUid());
    final json = newUser.toJson();
    final result = await repository.createDoc(ref, json);
    result.when(
      success: (_) {
        // stateを更新
        state.value = state.value.copyWith(publicUser: newUser);
        UIHelper.showFlutterToast("ユーザーが作成されました");
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データベースにユーザーを作成できませんでした");
      },
    );
  }

  Future<void> _createPrivateUser() async {
    final repository = FirestoreRepository();
    final newPrivateUser = NewContent.newPrivateUser(currentUid());
    final ref = DocRefCore.privateUser(currentUid());
    final json = newPrivateUser.toJson();
    final result = await repository.createDoc(ref, json);
    result.when(
      success: (_) {
        // stateを更新
        state.value = state.value.copyWith(privateUser: newPrivateUser);
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データベースにユーザーを作成できませんでした");
      },
    );
  }

  Future<void> _fetchData() async {
    if (state.value.authUser == null) {
      await _createAnonymousUser();
      return;
    }
    if (state.value.authUser!.isAnonymous) {
      return;
    }
    await _getPublicUser();
    await _getPrivateUser();
  }

  Future<void> _getPublicUser() async {
    final repository = FirestoreRepository();
    final ref = DocRefCore.user(currentUid());
    final result = await repository.getDoc(ref);
    await result.when(
      success: (res) async {
        final data = res.data();
        if (res.exists && data != null) {
          final user = PublicUser.fromJson(data);
          String? newBase64;
          final bucketName = user.typedImage().bucketName;
          final fileName = user.typedImage().value;
          if (bucketName.isNotEmpty && fileName.isNotEmpty) {
            final image = await FileUtility.getS3Image(bucketName, fileName);
            if (image != null) {
              newBase64 = base64Encode(image);
            }
          }
          // publicUserとbase64を同時に更新
          state.value = state.value.copyWith(publicUser: user, base64: newBase64);
        } else {
          await _createPublicUser();
        }
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      },
    );
  }

  Future<void> _getPrivateUser() async {
    final repository = FirestoreRepository();
    final ref = DocRefCore.privateUser(currentUid());
    final result = await repository.getDoc(ref);
    await result.when(
      success: (res) async {
        final data = res.data();
        if (res.exists && data != null) {
          // stateを更新
          state.value = state.value.copyWith(privateUser: PrivateUser.fromJson(data));
        } else {
          await _createPrivateUser();
        }
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      },
    );
  }

  String currentAuthStateString() {
    final authState = currentAuthState();
    switch (authState) {
      case CurrentAuthState.isAnonymous:
        return "匿名ログイン中";
      case CurrentAuthState.loggedIn:
        return "ログイン中";
      case CurrentAuthState.notLoggedIn:
        return "ログイン中";
    }
  }

  CurrentAuthState currentAuthState() {
    if (state.value.authUser == null) {
      return CurrentAuthState.notLoggedIn;
    } else if (state.value.authUser!.isAnonymous) {
      return CurrentAuthState.isAnonymous;
    } else {
      // ログイン済みだが匿名ではない場合
      return CurrentAuthState.loggedIn;
    }
  }

  void onLogoutButtonPressed() {
    UIHelper.cupertinoAlertDialog("ログアウトしますが本当によろしいですか？", _signOut);
  }

  Future<void> _signOut() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signOut();
    result.when(
      success: (_) {
        Get.toNamed(LogoutedPage.path);
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("ログアウトできませんでした");
      },
    );
  }

  Future<void> reauthenticateWithAppleToDelete() async {
    final credential = await CredentialComposer.appleCredential();
    await _reauthenticateToDelete(credential);
  }

  Future<void> reauthenticateWithGoogleToDelete() async {
    final credential = await CredentialComposer.googleCredential();
    await _reauthenticateToDelete(credential);
  }

  Future<void> _reauthenticateToDelete(AuthCredential credential) async {
    final repository = FirebaseAuthRepository();
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final result = await repository.reauthenticateWithCredential(
      user,
      credential,
    );
    result.when(
      success: (_) {
        _showDeleteUserDialog();
      },
      failure: (e) {},
    );
  }

  void _showDeleteUserDialog() {
    UIHelper.cupertinoAlertDialog("ユーザーを削除しますが本当によろしいですか？", _deletePublicUser);
  }

  Future<void> _deletePublicUser() async {
    final user = state.value.publicUser;
    if (user == null) return;
    final repository = FirestoreRepository();
    final ref = user.typedRef();
    final result = await repository.deleteDoc(ref);
    await result.when(
      success: (_) async {
        await _deleteAuthUser();
        await _removeImage();
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データベースからユーザーを削除できませんでした");
      },
    );
  }

  Future<void> _deleteAuthUser() async {
    final repository = FirebaseAuthRepository();
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final result = await repository.deleteUser(user);
    result.when(
      success: (_) {
        Get.toNamed(UserDeletedPage.path);
      },
      failure: (e) {},
    );
  }

  Future<void> _removeImage() async {
    final publicUser = state.value.publicUser;
    if (publicUser == null) return;
    final fileName = publicUser.typedImage().value;
    final request = DeleteObjectRequest(object: fileName);
    await AWSS3Repository().deleteObject(request);
  }

  void updateUser(String userName, String bio, String fileName) async {
    final user = state.value.publicUser;
    if (user == null) return;

    final updatedUser = user.copyWith(
      bio: user.typedBio().copyWith(value: bio).toJson(),
      userName: user.typedUserName().copyWith(value: userName).toJson(),
      image: user.typedImage().copyWith(value: fileName).toJson(),
    );

    String? newBase64;
    final image = await FileUtility.getS3Image(
      user.typedImage().bucketName,
      fileName,
    );
    if (image != null) {
      newBase64 = base64Encode(image);
    }
    // publicUserとbase64を同時に更新
    state.value = state.value.copyWith(publicUser: updatedUser, base64: newBase64);
  }
}