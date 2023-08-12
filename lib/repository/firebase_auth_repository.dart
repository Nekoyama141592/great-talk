import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/common/ui_helper.dart';
import 'package:great_talk/infrastructure/firebase_auth/firebase_auth_client.dart';
import 'package:great_talk/repository/result.dart';

class FirebaseAuthRepository {
  final client = FirebaseAuthClient();

  FutureResult<User> signInAnonymously() async {
    late Result<User> result;
    try {
      final res = await client.signInAnonymously();
      if (res.user == null) {
        result = const Result.failure();
      }
      result = Result.success(res.user!);
    } catch (e) {
      debugPrint(e.toString());
      result = const Result.failure();
    }
    return result;
  }

  FutureResult<User> signInWithApple() async {
    late Result<User> result;
    try {
      final res = await client.signinWithApple();
      if (res == null || res.user == null) {
        result = const Result.failure();
      }
      result = Result.success(res!.user!);
    } on FirebaseAuthException catch (e) {
      result = const Result.failure();
      _manageErrorCredential(e);
    }
    return result;
  }

  FutureResult<User> signInWithGoogle() async {
    late Result<User> result;
    try {
      final res = await client.signInWithGoogle();
      if (res == null || res.user == null) {
        result = const Result.failure();
      }
      result = Result.success(res!.user!);
    } on FirebaseAuthException catch (e) {
      result = const Result.failure();
      _manageErrorCredential(e);
    }
    return result;
  }

  FutureResult<bool> signOut() async {
    try {
      await client.signOut();
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> reauthenticateWithCredential(
      User user, AuthCredential credential) async {
    try {
      await client.reauthenticateWithCredential(user, credential);
      return const Result.success(true);
    } on FirebaseAuthException catch (e) {
      final String errorCode = e.code;
      debugPrint(errorCode);
      switch (errorCode) {
        case 'user-mismatch':
          UIHelper.showErrorFlutterToast("ユーザーのミスマッチが発生しました。");
          break;
        case 'user-not-found':
          UIHelper.showErrorFlutterToast("ユーザーが見つかりません。");
          break;
        case 'invalid-credential':
          UIHelper.showErrorFlutterToast("クレデンシャルが不正、もしくは期限切れです。");
          break;
      }
      return const Result.failure();
    }
  }

  FutureResult<bool> deleteUser(User user) async {
    try {
      await client.deleteUser(user);
      return const Result.success(true);
    } on FirebaseAuthException catch (e) {
      final String errorCode = e.code;
      debugPrint(errorCode);
      switch (errorCode) {
        case 'requires-recent-login':
          UIHelper.showErrorFlutterToast("再認証が必要です。");
          break;
      }
      return const Result.failure();
    }
  }

  void _manageErrorCredential(FirebaseAuthException e) {
    final String errorCode = e.code;
    debugPrint(errorCode);
    switch (errorCode) {
      case 'account-exists-with-different-credential':
        UIHelper.showErrorFlutterToast("同じメールアドレスを持つアカウントが存在します。");
        break;
      case 'invalid-credential':
        UIHelper.showErrorFlutterToast("クレデンシャルが不正、もしくは期限切れです。");
        break;
      case 'user-disabled':
        UIHelper.showErrorFlutterToast('ユーザーが無効化されています。');
        break;
    }
  }
}
