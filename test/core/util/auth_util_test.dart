import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/util/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TestUser implements User {
  final bool _isAnonymous;

  TestUser({bool isAnonymous = false}) : _isAnonymous = isAnonymous;

  @override
  bool get isAnonymous => _isAnonymous;

  @override
  String? get displayName => throw UnimplementedError();

  @override
  String? get email => throw UnimplementedError();

  @override
  bool get emailVerified => throw UnimplementedError();

  @override
  UserMetadata get metadata => throw UnimplementedError();

  @override
  String? get phoneNumber => throw UnimplementedError();

  @override
  String? get photoURL => throw UnimplementedError();

  @override
  List<UserInfo> get providerData => throw UnimplementedError();

  @override
  String? get refreshToken => throw UnimplementedError();

  @override
  String? get tenantId => throw UnimplementedError();

  @override
  String get uid => throw UnimplementedError();

  @override
  Future<void> delete() => throw UnimplementedError();

  @override
  Future<String> getIdToken([bool forceRefresh = false]) =>
      throw UnimplementedError();

  @override
  Future<IdTokenResult> getIdTokenResult([bool forceRefresh = false]) =>
      throw UnimplementedError();

  @override
  Future<UserCredential> linkWithCredential(AuthCredential credential) =>
      throw UnimplementedError();

  @override
  Future<ConfirmationResult> linkWithPhoneNumber(
    String phoneNumber, [
    RecaptchaVerifier? verifier,
  ]) => throw UnimplementedError();

  @override
  Future<UserCredential> linkWithPopup(AuthProvider provider) =>
      throw UnimplementedError();

  @override
  Future<void> linkWithRedirect(AuthProvider provider) =>
      throw UnimplementedError();

  @override
  Future<UserCredential> reauthenticateWithCredential(
    AuthCredential credential,
  ) => throw UnimplementedError();

  @override
  Future<UserCredential> reauthenticateWithPopup(AuthProvider provider) =>
      throw UnimplementedError();

  @override
  Future<void> reauthenticateWithRedirect(AuthProvider provider) =>
      throw UnimplementedError();

  @override
  Future<void> reload() => throw UnimplementedError();

  @override
  Future<void> sendEmailVerification([
    ActionCodeSettings? actionCodeSettings,
  ]) => throw UnimplementedError();

  @override
  Future<User> unlink(String providerId) => throw UnimplementedError();

  @override
  Future<void> updateDisplayName(String? displayName) =>
      throw UnimplementedError();

  @override
  Future<void> updateEmail(String newEmail) => throw UnimplementedError();

  @override
  Future<void> updatePassword(String newPassword) => throw UnimplementedError();

  @override
  Future<void> updatePhoneNumber(PhoneAuthCredential phoneCredential) =>
      throw UnimplementedError();

  @override
  Future<void> updatePhotoURL(String? photoURL) => throw UnimplementedError();

  @override
  Future<void> updateProfile({String? displayName, String? photoURL}) =>
      throw UnimplementedError();

  @override
  Future<void> verifyBeforeUpdateEmail(
    String newEmail, [
    ActionCodeSettings? actionCodeSettings,
  ]) => throw UnimplementedError();

  @override
  MultiFactor get multiFactor => throw UnimplementedError();

  @override
  Future<UserCredential> linkWithProvider(AuthProvider provider) =>
      throw UnimplementedError();

  @override
  Future<UserCredential> reauthenticateWithProvider(AuthProvider provider) =>
      throw UnimplementedError();
}

void main() {
  group('AuthUtil', () {
    group('currentAuthStateString', () {
      test('should return "isAnonymous Text" for null user', () {
        const User? authUser = null;
        final result = AuthUtil.currentAuthStateString(authUser);

        expect(result, '未ログイン状態');
      });

      test('should return "loggedIn Text" for anonymous user', () {
        final authUser = TestUser(isAnonymous: true);
        final result = AuthUtil.currentAuthStateString(authUser);

        expect(result, '匿名ログイン中');
      });

      test('should return "notLoggedIn Text" for logged in user', () {
        final authUser = TestUser(isAnonymous: false);
        final result = AuthUtil.currentAuthStateString(authUser);

        expect(result, 'ログイン中');
      });
    });

    group('auth state logic verification', () {
      test('should correctly identify not logged in state', () {
        const User? authUser = null;
        final result = AuthUtil.currentAuthStateString(authUser);

        expect(result, '未ログイン状態');

        expect(result, isNot('匿名ログイン中'));
        expect(result, isNot('ログイン中'));
      });

      test('should correctly identify anonymous state', () {
        final authUser = TestUser(isAnonymous: true);
        final result = AuthUtil.currentAuthStateString(authUser);

        expect(result, '匿名ログイン中');

        expect(result, isNot('未ログイン状態'));
        expect(result, isNot('ログイン中'));
      });

      test('should correctly identify logged in state', () {
        final authUser = TestUser(isAnonymous: false);
        final result = AuthUtil.currentAuthStateString(authUser);

        expect(result, 'ログイン中');

        expect(result, isNot('未ログイン状態'));
        expect(result, isNot('匿名ログイン中'));
      });
    });

    group('consistency tests', () {
      test('should return consistent results for same input', () {
        final authUser = TestUser(isAnonymous: false);

        final result1 = AuthUtil.currentAuthStateString(authUser);
        final result2 = AuthUtil.currentAuthStateString(authUser);

        expect(result1, equals(result2));
        expect(result1, 'ログイン中');
      });

      test('should return consistent results for null input', () {
        const User? authUser = null;

        final result1 = AuthUtil.currentAuthStateString(authUser);
        final result2 = AuthUtil.currentAuthStateString(authUser);

        expect(result1, equals(result2));
        expect(result1, '未ログイン状態');
      });

      test('should return consistent results for anonymous input', () {
        final authUser = TestUser(isAnonymous: true);

        final result1 = AuthUtil.currentAuthStateString(authUser);
        final result2 = AuthUtil.currentAuthStateString(authUser);

        expect(result1, equals(result2));
        expect(result1, '匿名ログイン中');
      });
    });

    group('edge cases', () {
      test('should handle multiple different anonymous users', () {
        final authUser1 = TestUser(isAnonymous: true);
        final authUser2 = TestUser(isAnonymous: true);

        final result1 = AuthUtil.currentAuthStateString(authUser1);
        final result2 = AuthUtil.currentAuthStateString(authUser2);

        expect(result1, equals(result2));
        expect(result1, '匿名ログイン中');
      });

      test('should handle multiple different logged in users', () {
        final authUser1 = TestUser(isAnonymous: false);
        final authUser2 = TestUser(isAnonymous: false);

        final result1 = AuthUtil.currentAuthStateString(authUser1);
        final result2 = AuthUtil.currentAuthStateString(authUser2);

        expect(result1, equals(result2));
        expect(result1, 'ログイン中');
      });

      test('should handle transition between states', () {
        const User? nullUser = null;
        final anonymousUser = TestUser(isAnonymous: true);
        final loggedInUser = TestUser(isAnonymous: false);

        final result1 = AuthUtil.currentAuthStateString(nullUser);
        final result2 = AuthUtil.currentAuthStateString(anonymousUser);
        final result3 = AuthUtil.currentAuthStateString(loggedInUser);

        expect(result1, '未ログイン状態');
        expect(result2, '匿名ログイン中');
        expect(result3, 'ログイン中');

        expect(result1, isNot(equals(result2)));
        expect(result2, isNot(equals(result3)));
        expect(result1, isNot(equals(result3)));
      });
    });

    group('string format validation', () {
      test('should return Japanese strings', () {
        const User? nullUser = null;
        final anonymousUser = TestUser(isAnonymous: true);
        final loggedInUser = TestUser(isAnonymous: false);

        final result1 = AuthUtil.currentAuthStateString(nullUser);
        final result2 = AuthUtil.currentAuthStateString(anonymousUser);
        final result3 = AuthUtil.currentAuthStateString(loggedInUser);

        expect(result1.isNotEmpty, true);
        expect(result2.isNotEmpty, true);
        expect(result3.isNotEmpty, true);

        expect(result1.contains('未'), true);
        expect(result2.contains('匿名'), true);
        expect(result3.contains('ログイン'), true);
      });

      test('should not return null or empty strings', () {
        const User? nullUser = null;
        final anonymousUser = TestUser(isAnonymous: true);
        final loggedInUser = TestUser(isAnonymous: false);

        final result1 = AuthUtil.currentAuthStateString(nullUser);
        final result2 = AuthUtil.currentAuthStateString(anonymousUser);
        final result3 = AuthUtil.currentAuthStateString(loggedInUser);

        expect(result1.isNotEmpty, true);
        expect(result2.isNotEmpty, true);
        expect(result3.isNotEmpty, true);
      });
    });
  });
}
