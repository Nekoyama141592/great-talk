import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:great_talk/core/util/credential_util.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/domain/repository_interface/i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this.instance, {this.enableDebugPrint = true});
  FirebaseAuth instance;
  final bool enableDebugPrint;

  @override
  FutureResult<User> signInWithApple() async {
    try {
      final credential = await CredentialUtil.appleCredential();
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
      final credential = await CredentialUtil.googleCredential();
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

  @override
  FutureResult<User> signUp(String email, String password) async {
    try {
      final res = await instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = res.user;
      if (user == null) {
        return const Result.failure('ユーザー作成に失敗しました');
      } else {
        return Result.success(user);
      }
    } on FirebaseAuthException catch (e) {
      if (enableDebugPrint) debugPrint('signUp: ${e.toString()}');
      final msg = _manageEmailPasswordError(e);
      return Result.failure(msg);
    } catch (e) {
      if (enableDebugPrint) debugPrint('signUp: ${e.toString()}');
      return Result.failure('ユーザー作成に失敗しました');
    }
  }

  @override
  FutureResult<User> signIn(String email, String password) async {
    try {
      final res = await instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = res.user;
      if (user == null) {
        return const Result.failure('ログインに失敗しました');
      } else {
        return Result.success(user);
      }
    } on FirebaseAuthException catch (e) {
      if (enableDebugPrint) debugPrint('signIn: ${e.toString()}');
      final msg = _manageEmailPasswordError(e);
      return Result.failure(msg);
    } catch (e) {
      if (enableDebugPrint) debugPrint('signIn: ${e.toString()}');
      return Result.failure('ログインに失敗しました');
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

  @override
  FutureResult<bool> sendEmailVerification() async {
    try {
      final user = instance.currentUser;
      if (user == null) return const Result.failure('ログインしてください');
      await user.sendEmailVerification();
      return const Result.success(true);
    } on FirebaseAuthException catch (e) {
      if (enableDebugPrint) {
        debugPrint('sendEmailVerification: ${e.toString()}');
      }
      final msg = _manageEmailPasswordError(e);
      return Result.failure(msg);
    } catch (e) {
      if (enableDebugPrint) {
        debugPrint('sendEmailVerification: ${e.toString()}');
      }
      return Result.failure('確認メールの送信に失敗しました');
    }
  }

  @override
  FutureResult<bool> reloadCurrentUser() async {
    try {
      final user = instance.currentUser;
      if (user == null) return const Result.failure('ログインしてください');
      await user.reload();
      return const Result.success(true);
    } on FirebaseAuthException catch (e) {
      if (enableDebugPrint) debugPrint('reloadCurrentUser: ${e.toString()}');
      return Result.failure('ユーザー情報の更新に失敗しました');
    } catch (e) {
      if (enableDebugPrint) debugPrint('reloadCurrentUser: ${e.toString()}');
      return Result.failure('ユーザー情報の更新に失敗しました');
    }
  }

  String _manageEmailPasswordError(FirebaseAuthException e) {
    final String errorCode = e.code;
    switch (errorCode) {
      case 'email-already-in-use':
        return 'このメールアドレスは既に使用されています。';
      case 'invalid-email':
        return 'メールアドレスの形式が正しくありません。';
      case 'operation-not-allowed':
        return 'メール/パスワード認証が無効になっています。';
      case 'weak-password':
        return 'パスワードが弱すぎます。';
      case 'user-not-found':
        return 'ユーザーが見つかりません。';
      case 'wrong-password':
        return 'パスワードが間違っています。';
      case 'user-disabled':
        return 'ユーザーが無効化されています。';
      case 'invalid-credential':
        return 'メールアドレスまたはパスワードが正しくありません。';
      case 'too-many-requests':
        return 'リクエストが多すぎます。しばらく時間をおいてから再度お試しください。';
      default:
        return 'エラーが発生しました';
    }
  }
}
