import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/core/credential_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'firebase_auth_client.g.dart';
@riverpod
FirebaseAuthClient firebaseAuthClient(Ref ref) => FirebaseAuthClient();

class FirebaseAuthClient {
  Future<UserCredential> signInAnonymously() async {
    final credential = await FirebaseAuth.instance.signInAnonymously();
    return credential;
  }

  Future<UserCredential?> signinWithApple() async {
    final credential = await CredentialCore.appleCredential();
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    return result;
  }

  Future<UserCredential?> signInWithGoogle() async {
    final credential = await CredentialCore.googleCredential();
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    return result;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> reauthenticateWithCredential(
    User user,
    AuthCredential credential,
  ) async {
    await user.reauthenticateWithCredential(credential);
  }

  Future<void> deleteUser(User user) async {
    await user.delete();
  }
}
