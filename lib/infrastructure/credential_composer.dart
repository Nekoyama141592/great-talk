import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:great_talk/run_app.dart';
import 'package:great_talk/flavors.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class CredentialComposer {
  static Future<OAuthCredential> appleCredential() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    OAuthProvider oauthProvider = OAuthProvider('apple.com');
    final credential = oauthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
    return credential;
  }

  static Future<AuthCredential> googleCredential() async {
    final clientId = RunApp.getFirebaseOption(F.appFlavor!).iosClientId;
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(clientId: clientId).signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return credential;
  }
}
