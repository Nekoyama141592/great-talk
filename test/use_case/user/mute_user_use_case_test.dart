import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/application/use_case/user/mute_user_use_case.dart';
import 'package:great_talk/domain/entity/post/post.dart';
import 'package:great_talk/domain/entity/user_mute/user_mute.dart';
import 'package:great_talk/domain/entity/tokens/mute_user_token/mute_user_token.dart';
import '../../repository/fake/fake_database_repository.dart';

// Using shared FakeDatabaseRepository

void main() {
  group('MuteUserUseCase', () {
    late MuteUserUseCase muteUserUseCase;
    late FakeDatabaseRepository fakeDatabaseRepository;

    setUp(() {
      fakeDatabaseRepository = FakeDatabaseRepository();
      muteUserUseCase = MuteUserUseCase(
        firestoreRepository: fakeDatabaseRepository,
      );
    });

    group('muteUser', () {
      late Post testPost;
      late MuteUserToken testToken;
      const String testCurrentUid = 'test_current_uid';
      const String testPassiveUid = 'test_passive_uid';

      setUp(() {
        testPost = const Post(
          postId: 'test_post_id',
          uid: testPassiveUid,
          createdAt: 'test_timestamp',
          customCompleteText: {},
          description: {},
          image: {},
          searchToken: {},
          title: {},
          updatedAt: 'test_timestamp',
        );

        testToken = const MuteUserToken(
          tokenId: 'test_token_id',
          activeUid: testCurrentUid,
          passiveUid: testPassiveUid,
          tokenType: 'mute_user',
          createdAt: 'test_timestamp',
        );
      });

      test('should return success when muting user succeeds', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        final result = await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should return failure when database operation fails', () async {
        const expectedError = 'Database connection failed';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = expectedError;

        final result = await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => fail('Expected failure but got success: $value'),
          failure: (error) => expect(error, equals(expectedError)),
        );
      });

      test('should pass correct arguments to database repository', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['method'], equals('createMuteUserInfo'));
        expect(capturedArgs['currentUid'], equals(testCurrentUid));
        expect(capturedArgs['passiveUid'], equals(testPassiveUid));
        expect(capturedArgs['token'], equals(testToken));
        expect(capturedArgs['userMute'], isA<UserMute>());
      });

      test('should extract passiveUid from post.uid', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['passiveUid'], equals(testPost.uid));
      });

      test('should create UserMute from currentUid and post', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        final capturedUserMute = fakeDatabaseRepository.capturedArguments['userMute'] as UserMute;
        expect(capturedUserMute.activeUid, equals(testCurrentUid));
        expect(capturedUserMute.passiveUid, equals(testPost.uid));
      });

      test('should handle empty currentUid', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        const emptyUid = '';

        final result = await muteUserUseCase.muteUser(
          testPost,
          emptyUid,
          testToken,
        );

        expect(result, isA<Result<bool>>());
        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['currentUid'], equals(emptyUid));
      });

      test('should handle different post owner configurations', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        
        final differentPost = testPost.copyWith(
          uid: 'different_user_uid',
          postId: 'different_post_id',
        );

        final result = await muteUserUseCase.muteUser(
          differentPost,
          testCurrentUid,
          testToken,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['passiveUid'], equals('different_user_uid'));
      });

      test('should handle same user muting themselves', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        const sameUid = 'same_user_uid';
        
        final selfPost = testPost.copyWith(uid: sameUid);
        final selfToken = testToken.copyWith(
          activeUid: sameUid,
          passiveUid: sameUid,
        );

        final result = await muteUserUseCase.muteUser(
          selfPost,
          sameUid,
          selfToken,
        );

        expect(result, isA<Result<bool>>());
        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['currentUid'], equals(sameUid));
        expect(capturedArgs['passiveUid'], equals(sameUid));
      });
    });

    group('constructor', () {
      test('should create MuteUserUseCase with required dependencies', () {
        final useCase = MuteUserUseCase(
          firestoreRepository: fakeDatabaseRepository,
        );

        expect(useCase, isA<MuteUserUseCase>());
        expect(useCase.firestoreRepository, equals(fakeDatabaseRepository));
      });
    });

    group('error handling', () {
      late Post testPost;
      late MuteUserToken testToken;
      const String testCurrentUid = 'test_current_uid';

      setUp(() {
        testPost = const Post(
          postId: 'test_post_id',
          uid: 'test_passive_uid',
          createdAt: 'test_timestamp',
          customCompleteText: {},
          description: {},
          image: {},
          searchToken: {},
          title: {},
          updatedAt: 'test_timestamp',
        );

        testToken = const MuteUserToken(
          tokenId: 'test_token_id',
          activeUid: testCurrentUid,
          passiveUid: 'test_passive_uid',
          tokenType: 'mute_user',
          createdAt: 'test_timestamp',
        );
      });

      test('should handle network timeout errors', () async {
        const timeoutError = 'Network timeout';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = timeoutError;

        final result = await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(timeoutError)),
        );
      });

      test('should handle permission denied errors', () async {
        const permissionError = 'Permission denied';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = permissionError;

        final result = await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(permissionError)),
        );
      });

      test('should handle user not found errors', () async {
        const userNotFoundError = 'User not found';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = userNotFoundError;

        final result = await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(userNotFoundError)),
        );
      });

      test('should handle generic database errors', () async {
        const genericError = 'Database error';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = genericError;

        final result = await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(genericError)),
        );
      });
    });
  });
}