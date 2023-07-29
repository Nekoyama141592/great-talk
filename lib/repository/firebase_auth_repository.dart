import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/infrastructure/firebase_auth/firebase_auth_client.dart';
import 'package:great_talk/repository/result.dart';

class FirebaseAuthRepository {
  final client = FirebaseAuthClient();
  FutureResult<User> signInWithApple() async {
    late Result<User> result;
    try {
      final res = await client.signinWithApple();
      if (res == null || res.user == null) {
        result = const Result.failure();
      }
      result = Result.success(res!.user!);
    } catch(e) {
      result = const Result.failure();
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
    } catch(e) {
      result = const Result.failure();
    }
    return result;
  }
}