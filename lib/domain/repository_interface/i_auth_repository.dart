import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';

/// Abstract interface for authentication operations including
/// sign-in, sign-out, and user account management.
abstract class IAuthRepository {
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

  /// Signs up a user with email and password
  FutureResult<User> signUp(String email, String password);

  /// Signs in a user with email and password
  FutureResult<User> signIn(String email, String password);

  /// Sends email verification to current user
  FutureResult<bool> sendEmailVerification();

  /// Reloads current user data
  FutureResult<bool> reloadCurrentUser();
}
