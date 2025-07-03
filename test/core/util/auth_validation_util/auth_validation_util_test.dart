import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:great_talk/core/util/auth_validation_util.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';

@GenerateMocks([User])
import 'auth_validation_util_test.mocks.dart';

void main() {
  group('AuthValidationUtil', () {
    late MockUser mockUser;
    late MockUser mockAnonymousUser;

    setUp(() {
      mockUser = MockUser();
      mockAnonymousUser = MockUser();

      when(mockUser.uid).thenReturn('test_uid');
      when(mockUser.isAnonymous).thenReturn(false);

      when(mockAnonymousUser.uid).thenReturn('anonymous_uid');
      when(mockAnonymousUser.isAnonymous).thenReturn(true);
    });

    group('validateAuthenticated', () {
      test('should return success for authenticated user', () {
        final result = AuthValidationUtil.validateAuthenticated(mockUser);

        expect(result, isA<Success<User>>());
        result.when(
          success: (user) => expect(user.uid, 'test_uid'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return failure for null user', () {
        final result = AuthValidationUtil.validateAuthenticated(null);

        expect(result, isA<Failure<User>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ログインしてください'),
        );
      });

      test('should return failure for anonymous user', () {
        final result = AuthValidationUtil.validateAuthenticated(
          mockAnonymousUser,
        );

        expect(result, isA<Failure<User>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ログインが必要です'),
        );
      });
    });

    group('validateAuthenticatedUid', () {
      test('should return UID for authenticated user', () {
        final result = AuthValidationUtil.validateAuthenticatedUid(mockUser);

        expect(result, isA<Success<String>>());
        result.when(
          success: (uid) => expect(uid, 'test_uid'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return failure for null user', () {
        final result = AuthValidationUtil.validateAuthenticatedUid(null);

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ログインしてください'),
        );
      });

      test('should return failure for anonymous user', () {
        final result = AuthValidationUtil.validateAuthenticatedUid(
          mockAnonymousUser,
        );

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ログインが必要です'),
        );
      });
    });

    group('validateUserExists', () {
      test('should return success for authenticated user', () {
        final result = AuthValidationUtil.validateUserExists(mockUser);

        expect(result, isA<Success<User>>());
        result.when(
          success: (user) => expect(user.uid, 'test_uid'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return success for anonymous user', () {
        final result = AuthValidationUtil.validateUserExists(mockAnonymousUser);

        expect(result, isA<Success<User>>());
        result.when(
          success: (user) => expect(user.uid, 'anonymous_uid'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return failure for null user', () {
        final result = AuthValidationUtil.validateUserExists(null);

        expect(result, isA<Failure<User>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ユーザー情報が取得できません'),
        );
      });
    });

    group('validateUserExistsUid', () {
      test('should return UID for authenticated user', () {
        final result = AuthValidationUtil.validateUserExistsUid(mockUser);

        expect(result, isA<Success<String>>());
        result.when(
          success: (uid) => expect(uid, 'test_uid'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return UID for anonymous user', () {
        final result = AuthValidationUtil.validateUserExistsUid(
          mockAnonymousUser,
        );

        expect(result, isA<Success<String>>());
        result.when(
          success: (uid) => expect(uid, 'anonymous_uid'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return failure for null user', () {
        final result = AuthValidationUtil.validateUserExistsUid(null);

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ユーザー情報が取得できません'),
        );
      });
    });

    group('isAuthenticated', () {
      test('should return true for authenticated user', () {
        final result = AuthValidationUtil.isAuthenticated(mockUser);
        expect(result, true);
      });

      test('should return false for anonymous user', () {
        final result = AuthValidationUtil.isAuthenticated(mockAnonymousUser);
        expect(result, false);
      });

      test('should return false for null user', () {
        final result = AuthValidationUtil.isAuthenticated(null);
        expect(result, false);
      });
    });

    group('userExists', () {
      test('should return true for authenticated user', () {
        final result = AuthValidationUtil.userExists(mockUser);
        expect(result, true);
      });

      test('should return true for anonymous user', () {
        final result = AuthValidationUtil.userExists(mockAnonymousUser);
        expect(result, true);
      });

      test('should return false for null user', () {
        final result = AuthValidationUtil.userExists(null);
        expect(result, false);
      });
    });

    group('getUidSafely', () {
      test('should return UID for authenticated user', () {
        final result = AuthValidationUtil.getUidSafely(mockUser);
        expect(result, 'test_uid');
      });

      test('should return UID for anonymous user', () {
        final result = AuthValidationUtil.getUidSafely(mockAnonymousUser);
        expect(result, 'anonymous_uid');
      });

      test('should return null for null user', () {
        final result = AuthValidationUtil.getUidSafely(null);
        expect(result, null);
      });
    });

    group('validateUidMatch', () {
      test('should return success when UIDs match', () {
        final result = AuthValidationUtil.validateUidMatch(
          'test_uid',
          'test_uid',
        );

        expect(result, isA<Success<String>>());
        result.when(
          success: (uid) => expect(uid, 'test_uid'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return failure when UIDs do not match', () {
        final result = AuthValidationUtil.validateUidMatch('uid1', 'uid2');

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, '権限がありません'),
        );
      });

      test('should return failure when current UID is null', () {
        final result = AuthValidationUtil.validateUidMatch(null, 'target_uid');

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, '認証エラー: ユーザーIDが取得できません'),
        );
      });

      test('should return failure when target UID is null', () {
        final result = AuthValidationUtil.validateUidMatch('current_uid', null);

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, '対象のユーザーIDが無効です'),
        );
      });
    });

    group('validateUid', () {
      test('should return success for valid UID', () {
        final result = AuthValidationUtil.validateUid('test_uid');

        expect(result, isA<Success<String>>());
        result.when(
          success: (uid) => expect(uid, 'test_uid'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return failure for null UID', () {
        final result = AuthValidationUtil.validateUid(null);

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ユーザーIDが無効です'),
        );
      });

      test('should return failure for empty UID', () {
        final result = AuthValidationUtil.validateUid('');

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ユーザーIDが無効です'),
        );
      });
    });

    group('validateEmail', () {
      test('should return success for valid email', () {
        final result = AuthValidationUtil.validateEmail('test@example.com');

        expect(result, isA<Success<String>>());
        result.when(
          success: (email) => expect(email, 'test@example.com'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return failure for null email', () {
        final result = AuthValidationUtil.validateEmail(null);

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'メールアドレスを入力してください'),
        );
      });

      test('should return failure for empty email', () {
        final result = AuthValidationUtil.validateEmail('');

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'メールアドレスを入力してください'),
        );
      });

      test('should return failure for invalid email format', () {
        final result = AuthValidationUtil.validateEmail('invalid-email');

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, '正しいメールアドレスを入力してください'),
        );
      });

      test('should trim whitespace from email', () {
        final result = AuthValidationUtil.validateEmail('  test@example.com  ');

        expect(result, isA<Success<String>>());
        result.when(
          success: (email) => expect(email, 'test@example.com'),
          failure: (_) => fail('Should not fail'),
        );
      });
    });

    group('validatePassword', () {
      test('should return success for valid password', () {
        final result = AuthValidationUtil.validatePassword('password123');

        expect(result, isA<Success<String>>());
        result.when(
          success: (password) => expect(password, 'password123'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return failure for null password', () {
        final result = AuthValidationUtil.validatePassword(null);

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'パスワードを入力してください'),
        );
      });

      test('should return failure for empty password', () {
        final result = AuthValidationUtil.validatePassword('');

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'パスワードを入力してください'),
        );
      });

      test('should return failure for short password', () {
        final result = AuthValidationUtil.validatePassword('12345');

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'パスワードは6文字以上で入力してください'),
        );
      });
    });

    group('requireAuthenticatedUid', () {
      test('should return UID for authenticated user', () {
        final result = AuthValidationUtil.requireAuthenticatedUid(mockUser);

        expect(result, isA<Success<String>>());
        result.when(
          success: (uid) => expect(uid, 'test_uid'),
          failure: (_) => fail('Should not fail'),
        );
      });

      test('should return failure for null user', () {
        final result = AuthValidationUtil.requireAuthenticatedUid(null);

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ログインしてください'),
        );
      });

      test('should return failure for anonymous user', () {
        final result = AuthValidationUtil.requireAuthenticatedUid(
          mockAnonymousUser,
        );

        expect(result, isA<Failure<String>>());
        result.when(
          success: (_) => fail('Should not succeed'),
          failure: (error) => expect(error, 'ログインが必要です'),
        );
      });
    });
  });
}
