import 'package:firebase_auth/firebase_auth.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';

/// Utility class for common authentication validation patterns
class AuthValidationUtil {
  /// Validates that a user is authenticated (not null and not anonymous)
  /// Returns success with user if valid, failure with message if invalid
  static Result<User> validateAuthenticated(User? user) {
    if (user == null) {
      return const Result.failure('ログインしてください');
    }
    if (user.isAnonymous) {
      return const Result.failure('ログインが必要です');
    }
    return Result.success(user);
  }

  /// Validates that a user is authenticated and returns the UID
  /// Returns success with UID if valid, failure with message if invalid
  static Result<String> validateAuthenticatedUid(User? user) {
    final result = validateAuthenticated(user);
    return result.when(
      success: (user) => Result.success(user.uid),
      failure: (error) => Result.failure(error),
    );
  }

  /// Validates that a user exists (can be anonymous)
  /// Returns success with user if exists, failure if null
  static Result<User> validateUserExists(User? user) {
    if (user == null) {
      return const Result.failure('ユーザー情報が取得できません');
    }
    return Result.success(user);
  }

  /// Validates that a user exists and returns the UID (can be anonymous)
  /// Returns success with UID if exists, failure if null
  static Result<String> validateUserExistsUid(User? user) {
    final result = validateUserExists(user);
    return result.when(
      success: (user) => Result.success(user.uid),
      failure: (error) => Result.failure(error),
    );
  }

  /// Checks if a user is authenticated without returning Result
  /// Returns true if user is authenticated, false otherwise
  static bool isAuthenticated(User? user) {
    return user != null && !user.isAnonymous;
  }

  /// Checks if a user exists without returning Result
  /// Returns true if user exists (including anonymous), false otherwise
  static bool userExists(User? user) {
    return user != null;
  }

  /// Gets the UID from a user safely
  /// Returns the UID if user exists, null otherwise
  static String? getUidSafely(User? user) {
    return user?.uid;
  }

  /// Validates that two UIDs match
  /// Used for authorization checks
  static Result<String> validateUidMatch(
    String? currentUid,
    String? targetUid,
  ) {
    if (currentUid == null) {
      return const Result.failure('認証エラー: ユーザーIDが取得できません');
    }
    if (targetUid == null) {
      return const Result.failure('対象のユーザーIDが無効です');
    }
    if (currentUid != targetUid) {
      return const Result.failure('権限がありません');
    }
    return Result.success(currentUid);
  }

  /// Validates that a UID is not null or empty
  static Result<String> validateUid(String? uid) {
    if (uid == null || uid.isEmpty) {
      return const Result.failure('ユーザーIDが無効です');
    }
    return Result.success(uid);
  }

  /// Validates email format (basic validation)
  static Result<String> validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return const Result.failure('メールアドレスを入力してください');
    }
    final trimmedEmail = email.trim();
    if (!trimmedEmail.contains('@') || !trimmedEmail.contains('.')) {
      return const Result.failure('正しいメールアドレスを入力してください');
    }
    return Result.success(trimmedEmail);
  }

  /// Validates password strength (basic validation)
  static Result<String> validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return const Result.failure('パスワードを入力してください');
    }
    if (password.length < 6) {
      return const Result.failure('パスワードは6文字以上で入力してください');
    }
    return Result.success(password);
  }

  /// Combines authentication validation with UID extraction
  /// Common pattern used across multiple ViewModels
  static Result<String> requireAuthenticatedUid(User? user) {
    return validateAuthenticated(user).when(
      success: (user) => Result.success(user.uid),
      failure: (error) => Result.failure(error),
    );
  }
}
