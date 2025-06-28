import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/infrastructure/repository/auth_repository.dart';

class MockFirebaseAuthWithExceptions extends MockFirebaseAuth {
  final FirebaseAuthException? _signInException;
  final Exception? _signOutException;

  MockFirebaseAuthWithExceptions({
    FirebaseAuthException? signInException,
    Exception? signOutException,
    Map<String, FirebaseAuthException>? authExceptions,
    super.signedIn = false,
    super.mockUser,
  }) : _signInException = signInException,
       _signOutException = signOutException;

  @override
  Future<UserCredential> signInAnonymously() async {
    if (_signInException != null) {
      throw _signInException;
    }
    return super.signInAnonymously();
  }

  @override
  Future<void> signOut() async {
    if (_signOutException != null) {
      throw _signOutException;
    }
    return super.signOut();
  }
}

class MockUserWithExceptions extends MockUser {
  final Map<String, FirebaseAuthException>? _authExceptions;

  MockUserWithExceptions({
    required super.uid,
    super.email,
    super.displayName,
    super.photoURL,
    super.isAnonymous = false,
    super.isEmailVerified = false,
    Map<String, FirebaseAuthException>? authExceptions,
  }) : _authExceptions = authExceptions;

  @override
  Future<UserCredential> reauthenticateWithCredential(
    AuthCredential? credential,
  ) async {
    if (_authExceptions?.containsKey('reauthenticateWithCredential') == true) {
      throw _authExceptions!['reauthenticateWithCredential']!;
    }
    return super.reauthenticateWithCredential(credential);
  }

  @override
  Future<void> delete() async {
    if (_authExceptions?.containsKey('delete') == true) {
      throw _authExceptions!['delete']!;
    }
    return super.delete();
  }
}

void main() {
  group('AuthRepository', () {
    late AuthRepository authRepository;
    late MockFirebaseAuth mockFirebaseAuth;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      authRepository = AuthRepository(
        mockFirebaseAuth,
        enableDebugPrint: false,
      );
    });

    group('signInAnonymously', () {
      test('should return success when anonymous sign in succeeds', () async {
        final result = await authRepository.signInAnonymously();

        result.when(
          success: (user) {
            expect(user.isAnonymous, true);
          },
          failure: (msg) => fail('Expected success but got failure: $msg'),
        );
      });

      test('should return failure when anonymous sign in fails', () async {
        mockFirebaseAuth = MockFirebaseAuthWithExceptions(
          signInException: FirebaseAuthException(code: 'unknown'),
        );
        authRepository = AuthRepository(
          mockFirebaseAuth,
          enableDebugPrint: false,
        );

        final result = await authRepository.signInAnonymously();

        result.when(
          success: (user) => fail('Expected failure but got success'),
          failure: (msg) {
            expect(msg, '匿名ログインが失敗しました');
          },
        );
      });
    });

    group('signOut', () {
      test('should return success when sign out succeeds', () async {
        await mockFirebaseAuth.signInAnonymously();

        final result = await authRepository.signOut();

        result.when(
          success: (value) {
            expect(value, true);
          },
          failure: (msg) => fail('Expected success but got failure: $msg'),
        );
      });

      test('should return failure when sign out fails', () async {
        mockFirebaseAuth = MockFirebaseAuthWithExceptions(
          signOutException: Exception('Sign out failed'),
        );
        authRepository = AuthRepository(
          mockFirebaseAuth,
          enableDebugPrint: false,
        );

        final result = await authRepository.signOut();

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (msg) {
            expect(msg, 'ログアウトが失敗しました');
          },
        );
      });
    });

    group('reauthenticateWithCredential', () {
      test('should return failure when user is not signed in', () async {
        final credential = EmailAuthProvider.credential(
          email: 'test@example.com',
          password: 'password',
        );

        final result = await authRepository.reauthenticateWithCredential(
          credential,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (msg) {
            expect(msg, 'ログインしてください');
          },
        );
      });

      test('should return success when reauthentication succeeds', () async {
        final mockUser = MockUser(uid: 'test-uid', email: 'test@example.com');
        mockFirebaseAuth = MockFirebaseAuth(mockUser: mockUser, signedIn: true);
        authRepository = AuthRepository(
          mockFirebaseAuth,
          enableDebugPrint: false,
        );

        final credential = EmailAuthProvider.credential(
          email: 'test@example.com',
          password: 'password',
        );

        final result = await authRepository.reauthenticateWithCredential(
          credential,
        );

        result.when(
          success: (value) {
            expect(value, true);
          },
          failure: (msg) => fail('Expected success but got failure: $msg'),
        );
      });

      test(
        'should return appropriate error message for user-mismatch',
        () async {
          final mockUser = MockUserWithExceptions(
            uid: 'test-uid',
            email: 'test@example.com',
            authExceptions: {
              'reauthenticateWithCredential': FirebaseAuthException(
                code: 'user-mismatch',
              ),
            },
          );
          mockFirebaseAuth = MockFirebaseAuth(
            mockUser: mockUser,
            signedIn: true,
          );
          authRepository = AuthRepository(
            mockFirebaseAuth,
            enableDebugPrint: false,
          );

          final credential = EmailAuthProvider.credential(
            email: 'other@example.com',
            password: 'password',
          );

          final result = await authRepository.reauthenticateWithCredential(
            credential,
          );

          result.when(
            success: (value) => fail('Expected failure but got success'),
            failure: (msg) {
              expect(msg, '認証情報がことなります。現在のユーザーと同じ方法で認証してください。');
            },
          );
        },
      );

      test(
        'should return appropriate error message for user-not-found',
        () async {
          final mockUser = MockUserWithExceptions(
            uid: 'test-uid',
            email: 'test@example.com',
            authExceptions: {
              'reauthenticateWithCredential': FirebaseAuthException(
                code: 'user-not-found',
              ),
            },
          );
          mockFirebaseAuth = MockFirebaseAuth(
            mockUser: mockUser,
            signedIn: true,
          );
          authRepository = AuthRepository(
            mockFirebaseAuth,
            enableDebugPrint: false,
          );

          final credential = EmailAuthProvider.credential(
            email: 'test@example.com',
            password: 'password',
          );

          final result = await authRepository.reauthenticateWithCredential(
            credential,
          );

          result.when(
            success: (value) => fail('Expected failure but got success'),
            failure: (msg) {
              expect(msg, 'ユーザーが見つかりません。');
            },
          );
        },
      );

      test(
        'should return appropriate error message for invalid-credential',
        () async {
          final mockUser = MockUserWithExceptions(
            uid: 'test-uid',
            email: 'test@example.com',
            authExceptions: {
              'reauthenticateWithCredential': FirebaseAuthException(
                code: 'invalid-credential',
              ),
            },
          );
          mockFirebaseAuth = MockFirebaseAuth(
            mockUser: mockUser,
            signedIn: true,
          );
          authRepository = AuthRepository(
            mockFirebaseAuth,
            enableDebugPrint: false,
          );

          final credential = EmailAuthProvider.credential(
            email: 'test@example.com',
            password: 'wrong-password',
          );

          final result = await authRepository.reauthenticateWithCredential(
            credential,
          );

          result.when(
            success: (value) => fail('Expected failure but got success'),
            failure: (msg) {
              expect(msg, 'クレデンシャルが不正、もしくは期限切れです。');
            },
          );
        },
      );
    });

    group('deleteUser', () {
      test('should return failure when user is not signed in', () async {
        final result = await authRepository.deleteUser();

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (msg) {
            expect(msg, 'ログインしてください');
          },
        );
      });

      test('should return success when user deletion succeeds', () async {
        final mockUser = MockUser(uid: 'test-uid', email: 'test@example.com');
        mockFirebaseAuth = MockFirebaseAuth(mockUser: mockUser, signedIn: true);
        authRepository = AuthRepository(
          mockFirebaseAuth,
          enableDebugPrint: false,
        );

        final result = await authRepository.deleteUser();

        result.when(
          success: (value) {
            expect(value, true);
          },
          failure: (msg) => fail('Expected success but got failure: $msg'),
        );
      });

      test(
        'should return appropriate error message for requires-recent-login',
        () async {
          final mockUser = MockUserWithExceptions(
            uid: 'test-uid',
            email: 'test@example.com',
            authExceptions: {
              'delete': FirebaseAuthException(code: 'requires-recent-login'),
            },
          );
          mockFirebaseAuth = MockFirebaseAuth(
            mockUser: mockUser,
            signedIn: true,
          );
          authRepository = AuthRepository(
            mockFirebaseAuth,
            enableDebugPrint: false,
          );

          final result = await authRepository.deleteUser();

          result.when(
            success: (value) => fail('Expected failure but got success'),
            failure: (msg) {
              expect(msg, '再認証が必要です。');
            },
          );
        },
      );
    });
  });
}
