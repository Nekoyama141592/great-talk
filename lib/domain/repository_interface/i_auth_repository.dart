import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/repository/result/result.dart';

/// Abstract interface for authentication operations including
/// sign-in, sign-out, and user account management.
abstract class IAuthRepository {
  /// Signs in a user anonymously
  FutureResult<User> signInAnonymously();

  /// Signs in a user with Apple authentication
  FutureResult<User> signInWithApple();

  /// Signs in a user with Google authentication
  FutureResult<User> signInWithGoogle();

  /// Signs out the current user
  FutureResult<bool> signOut();

  /// Reauthenticates the current user with provided credentials
  FutureResult<bool> reauthenticateWithCredential(AuthCredential credential);

  /// Deletes the current user account
  FutureResult<bool> deleteUser();
}
