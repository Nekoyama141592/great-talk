import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/credential_core.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/domain/repository_interface/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this.instance, {this.enableDebugPrint = true});
  FirebaseAuth instance;
  final bool enableDebugPrint;

  @override
  FutureResult<User> signInAnonymously() async {
    try {
      final res = await instance.signInAnonymously();
      final user = res.user;
      const e = 'user not found.';
      if (user == null) {
        return Result.failure(e);
      } else {
        return Result.success(user);
      }
    } on FirebaseAuthException catch (e) {
      if (enableDebugPrint) debugPrint('signInAnonymously: ${e.toString()}');
      return Result.failure('匿名ログインが失敗しました');
    } catch (e) {
      if (enableDebugPrint) debugPrint('signInAnonymously: ${e.toString()}');
      return Result.failure('匿名ログインが失敗しました');
    }
  }

  @override
  FutureResult<User> signInWithApple() async {
    try {
      final credential = await CredentialCore.appleCredential();
      final res = await instance.signInWithCredential(credential);
      final user = res.user;
      if (user == null) {
        const e = 'Signin Failed.';
        return Result.failure(e);
      } else {
        return Result.success(user);
      }
    } on FirebaseAuthException catch (e) {
      if (enableDebugPrint) debugPrint('signInWithApple: ${e.toString()}');
      final msg = _manageErrorCredential(e);
      return Result.failure(msg);
    }
  }

  @override
  FutureResult<User> signInWithGoogle() async {
    try {
      final credential = await CredentialCore.googleCredential();
      final res = await instance.signInWithCredential(credential);
      final user = res.user;
      if (user == null) {
        const e = 'Signin Failed.';
        return Result.failure(e);
      } else {
        return Result.success(user);
      }
    } on FirebaseAuthException catch (e) {
      if (enableDebugPrint) debugPrint('signInWithGoogle: ${e.toString()}');
      final msg = _manageErrorCredential(e);
      return Result.failure(msg);
    }
  }

  @override
  FutureResult<bool> signOut() async {
    try {
      await instance.signOut();
      return const Result.success(true);
    } on FirebaseAuthException catch (e) {
      if (enableDebugPrint) debugPrint('signOut: ${e.toString()}');
      return Result.failure('ログアウトが失敗しました');
    } catch (e) {
      if (enableDebugPrint) debugPrint('signOut: ${e.toString()}');
      return Result.failure('ログアウトが失敗しました');
    }
  }

  @override
  FutureResult<bool> reauthenticateWithCredential(
    AuthCredential credential,
  ) async {
    try {
      final user = instance.currentUser;
      if (user == null) return const Result.failure('ログインしてください');
      await user.reauthenticateWithCredential(credential);
      return const Result.success(true);
    } on FirebaseAuthException catch (e) {
      if (enableDebugPrint) {
        debugPrint('reauthenticateWithCredential: ${e.toString()}');
      }
      final String errorCode = e.code;
      String msg = '';
      switch (errorCode) {
        case 'user-mismatch':
          msg = '認証情報がことなります。現在のユーザーと同じ方法で認証してください。';
          break;
        case 'user-not-found':
          msg = 'ユーザーが見つかりません。';
          break;
        case 'invalid-credential':
          msg = 'クレデンシャルが不正、もしくは期限切れです。';
          break;
      }
      return Result.failure(msg);
    }
  }

  @override
  FutureResult<bool> deleteUser() async {
    try {
      final user = instance.currentUser;
      if (user == null) return const Result.failure('ログインしてください');
      await user.delete();
      return const Result.success(true);
    } on FirebaseAuthException catch (e) {
      final String errorCode = e.code;
      if (enableDebugPrint) debugPrint('deleteUser: $errorCode');
      String msg = '';
      switch (errorCode) {
        case 'requires-recent-login':
          msg = '再認証が必要です。';
          break;
      }
      return Result.failure(msg);
    }
  }

  String _manageErrorCredential(FirebaseAuthException e) {
    final String errorCode = e.code;
    switch (errorCode) {
      case 'account-exists-with-different-credential':
        return '同じメールアドレスを持つアカウントが存在します。';
      case 'invalid-credential':
        return 'クレデンシャルが不正、もしくは期限切れです。';
      case 'user-disabled':
        return 'ユーザーが無効化されています。';
      default:
        return 'エラーが発生しました';
    }
  }
}
