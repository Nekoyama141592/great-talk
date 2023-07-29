import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:great_talk/controllers/current_user_controller.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class FirebaseAuthClient {
  Future<UserCredential?> signinWithApple() async {
    if (!CurrentUserController.to.isAnonymous()) {
      return null;
    }
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    // OAthCredentialのインスタンスを作成
    OAuthProvider oauthProvider = OAuthProvider('apple.com');
    final credential = oauthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
    final result = await CurrentUserController.to.currentUser.value!
        .linkWithCredential(credential);
    return result;
  }

  Future<UserCredential?> signInWithGoogle() async {
    if (!CurrentUserController.to.isAnonymous()) {
      return null;
    }
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final result = await CurrentUserController.to.currentUser.value!
        .linkWithCredential(credential);
    return result;
  }
}
