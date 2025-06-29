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

  @override
  Future<void> sendEmailVerification([
    ActionCodeSettings? actionCodeSettings,
  ]) async {
    if (_authExceptions?.containsKey('sendEmailVerification') == true) {
      throw _authExceptions!['sendEmailVerification']!;
    }
    return super.sendEmailVerification(actionCodeSettings);
  }

  @override
  Future<void> reload() async {
    if (_authExceptions?.containsKey('reload') == true) {
      throw _authExceptions!['reload']!;
    }
    return super.reload();
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

    group('sendEmailVerification', () {
      test('should return failure when user is not signed in', () async {
        final result = await authRepository.sendEmailVerification();

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (msg) {
            expect(msg, 'ログインしてください');
          },
        );
      });

      test('should return success when email verification is sent', () async {
        final mockUser = MockUser(uid: 'test-uid', email: 'test@example.com');
        mockFirebaseAuth = MockFirebaseAuth(mockUser: mockUser, signedIn: true);
        authRepository = AuthRepository(
          mockFirebaseAuth,
          enableDebugPrint: false,
        );

        final result = await authRepository.sendEmailVerification();

        result.when(
          success: (value) {
            expect(value, true);
          },
          failure: (msg) => fail('Expected success but got failure: $msg'),
        );
      });

      test(
        'should return appropriate error message for too-many-requests',
        () async {
          final mockUser = MockUserWithExceptions(
            uid: 'test-uid',
            email: 'test@example.com',
            authExceptions: {
              'sendEmailVerification': FirebaseAuthException(
                code: 'too-many-requests',
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

          final result = await authRepository.sendEmailVerification();

          result.when(
            success: (value) => fail('Expected failure but got success'),
            failure: (msg) {
              expect(msg, 'リクエストが多すぎます。しばらく時間をおいてから再度お試しください。');
            },
          );
        },
      );

      test(
        'should return general error message for unknown exception',
        () async {
          final mockUser = MockUserWithExceptions(
            uid: 'test-uid',
            email: 'test@example.com',
            authExceptions: {
              'sendEmailVerification': FirebaseAuthException(
                code: 'unknown-error',
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

          final result = await authRepository.sendEmailVerification();

          result.when(
            success: (value) => fail('Expected failure but got success'),
            failure: (msg) {
              expect(msg, 'エラーが発生しました');
            },
          );
        },
      );
    });

    group('reloadCurrentUser', () {
      test('should return failure when user is not signed in', () async {
        final result = await authRepository.reloadCurrentUser();

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (msg) {
            expect(msg, 'ログインしてください');
          },
        );
      });

      test('should return success when user is reloaded', () async {
        final mockUser = MockUser(uid: 'test-uid', email: 'test@example.com');
        mockFirebaseAuth = MockFirebaseAuth(mockUser: mockUser, signedIn: true);
        authRepository = AuthRepository(
          mockFirebaseAuth,
          enableDebugPrint: false,
        );

        final result = await authRepository.reloadCurrentUser();

        result.when(
          success: (value) {
            expect(value, true);
          },
          failure: (msg) => fail('Expected success but got failure: $msg'),
        );
      });

      test('should return error message for FirebaseAuthException', () async {
        final mockUser = MockUserWithExceptions(
          uid: 'test-uid',
          email: 'test@example.com',
          authExceptions: {
            'reload': FirebaseAuthException(code: 'network-request-failed'),
          },
        );
        mockFirebaseAuth = MockFirebaseAuth(mockUser: mockUser, signedIn: true);
        authRepository = AuthRepository(
          mockFirebaseAuth,
          enableDebugPrint: false,
        );

        final result = await authRepository.reloadCurrentUser();

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (msg) {
            expect(msg, 'ユーザー情報の更新に失敗しました');
          },
        );
      });
    });
  });
}
