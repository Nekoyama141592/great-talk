import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:great_talk/infrastructure/credential_composer.dart';

class FirebaseAuthClient {
  Future<UserCredential> signInAnonymously() async {
    final credential = await FirebaseAuth.instance.signInAnonymously();
    return credential;
  }

  Future<UserCredential?> signinWithApple() async {
    if (!CurrentUserController.to.isAnonymous()) {
      return null;
    }
    final credential = await CredentialComposer.appleCredential();
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    return result;
  }

  Future<UserCredential?> signInWithGoogle() async {
    if (!CurrentUserController.to.isAnonymous()) {
      return null;
    }
    final credential = await CredentialComposer.googleCredential();
    final result = await FirebaseAuth.instance.signInWithCredential(credential);
    return result;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> reauthenticateWithCredential(
      User user, AuthCredential credential) async {
    await user.reauthenticateWithCredential(credential);
  }

  Future<void> deleteUser(User user) async {
    await user.delete();
  }
}
