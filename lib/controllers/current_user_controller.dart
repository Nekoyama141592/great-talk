import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/model/global/current_user/auth_user/auth_user.dart';
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
  final Rx<AuthUser?> rxAuthUser = Rx(null);
  final Rx<PublicUser?> rxPublicUser = Rx(null);
  final Rx<PrivateUser?> rxPrivateUser = Rx(null);
  final Rx<String?> rxBase64 = Rx(null);


  @override
  void onInit() async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser != null) {
      rxAuthUser.value = AuthUser.fromFirebaseAuthUser(authUser);
    }
    await _fetchData();
    super.onInit();
  }

  Future<void> _createAnonymousUser() async {
    final repository = FirebaseAuthRepository();
    final result = await repository.signInAnonymously();
    result.when(success: (res) => setAuthUser(res), failure: (e) {});
  }

  void setAuthUser(User user) {
    rxAuthUser.value = AuthUser.fromFirebaseAuthUser(user);
  }

  String currentUid() => rxAuthUser.value?.uid ?? '';

  bool isAdmin() => rxPrivateUser.value?.isAdmin ?? false;
  bool isOfficial() => rxPublicUser.value?.isOfficial ?? false;

  bool isAnonymous() => rxAuthUser.value!.isAnonymous;

  bool isNotLoggedIn() => rxAuthUser.value == null || isAnonymous();
  bool isLoggedIn() => !isNotLoggedIn();

  bool isNotVerified() => !rxAuthUser.value!.emailVerified;

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
        rxPublicUser(newUser);
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
        rxPrivateUser(newPrivateUser);
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データベースにユーザーを作成できませんでした");
      },
    );
  }

  Future<void> _fetchData() async {
    if (rxAuthUser.value == null) {
      await _createAnonymousUser();
      return;
    }
    if (rxAuthUser.value!.isAnonymous) {
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
          // アカウントが存在するなら代入する
          final user = PublicUser.fromJson(data);
          rxPublicUser(user);
          final bucketName = user.typedImage().bucketName;
          final fileName = user.typedImage().value;
          if (bucketName.isNotEmpty && fileName.isNotEmpty) {
            final image = await FileUtility.getS3Image(bucketName, fileName);
            if (image == null) return;
            rxBase64.value = base64Encode(image);
          }
        } else {
          // アカウントが存在しないなら作成する
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
          // アカウントが存在するなら代入する
          rxPrivateUser(PrivateUser.fromJson(data));
        } else {
          // アカウントが存在しないなら作成する
          await _createPrivateUser();
        }
      },
      failure: (e) {
        UIHelper.showErrorFlutterToast("データの取得に失敗しました");
      },
    );
  }

  String currentAuthStateString() {
    final state = currentAuthState();
    switch (state) {
      case CurrentAuthState.isAnonymous:
        return "匿名ログイン中";
      case CurrentAuthState.loggedIn:
        return "ログイン中";
      case CurrentAuthState.notLoggedIn:
        return "ログイン中";
    }
  }

  CurrentAuthState currentAuthState() {
    if (rxAuthUser.value == null) {
      return CurrentAuthState.notLoggedIn;
    } else if (rxAuthUser.value!.isAnonymous) {
      return CurrentAuthState.isAnonymous;
    } else {
      return CurrentAuthState.notLoggedIn;
    }
  }

  void onLogoutButtonPressed() async {
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
    final user = rxPublicUser.value;
    if (user == null) return;
    final repository = FirestoreRepository();
    final ref = user.typedRef();
    final result = await repository.deleteDoc(ref);
    await result.when(
      success: (_) async {
        _deleteAuthUser();
        _removeImage();
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
    final publicUser = rxPublicUser.value;
    if (publicUser == null) return;
    final fileName = publicUser.typedImage().value;
    final request = DeleteObjectRequest(object: fileName);
    await AWSS3Repository().deleteObject(request);
  }

  void updateUser(String userName, String bio, String fileName) async {
    final user = rxPublicUser.value!;
    final result = user.copyWith(
      bio: user.typedBio().copyWith(value: bio).toJson(),
      userName: user.typedUserName().copyWith(value: userName).toJson(),
      image: user.typedImage().copyWith(value: fileName).toJson(),
    );
    rxPublicUser(result);
    final image = await FileUtility.getS3Image(
      user.typedImage().bucketName,
      fileName,
    );
    if (image == null) return;
    rxBase64(base64Encode(image));
  }
}

