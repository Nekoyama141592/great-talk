import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/repository/database_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/application/use_case/post/mute_post_use_case.dart';
import 'package:great_talk/domain/entity/post/post.dart';
import 'package:great_talk/domain/entity/post_mute/post_mute.dart';
import 'package:great_talk/domain/entity/tokens/mute_post_token/mute_post_token.dart';

class FakeDatabaseRepository implements DatabaseRepository {
  bool shouldSucceed = true;
  String? errorMessage;
  Map<String, dynamic> capturedArguments = {};

  @override
  FutureResult<bool> createMutePostInfo(
    String currentUid,
    Post post,
    MutePostToken token,
    PostMute postMute,
  ) async {
    capturedArguments = {
      'currentUid': currentUid,
      'post': post,
      'token': token,
      'postMute': postMute,
    };

    if (shouldSucceed) {
      return const Result.success(true);
    } else {
      return Result.failure(errorMessage ?? 'Database error');
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return Future.value(const Result.success({}));
  }
}

void main() {
  group('MutePostUseCase', () {
    late MutePostUseCase mutePostUseCase;
    late FakeDatabaseRepository fakeDatabaseRepository;

    setUp(() {
      fakeDatabaseRepository = FakeDatabaseRepository();
      mutePostUseCase = MutePostUseCase(
        firestoreRepository: fakeDatabaseRepository,
      );
    });

    group('mutePost', () {
      late Post testPost;
      late MutePostToken testToken;
      const String testCurrentUid = 'test_current_uid';

      setUp(() {
        testPost = const Post(
          postId: 'test_post_id',
          uid: 'test_post_owner_uid',
          createdAt: 'test_timestamp',
          customCompleteText: {},
          description: {},
          image: {},
          searchToken: {},
          title: {},
          updatedAt: 'test_timestamp',
        );

        testToken = const MutePostToken(
          tokenId: 'test_token_id',
          postId: 'test_post_id',
          activeUid: testCurrentUid,
          tokenType: 'mute_post',
          createdAt: 'test_timestamp',
        );
      });

      test('should return success when muting post succeeds', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        final result = await mutePostUseCase.mutePost(
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

        final result = await mutePostUseCase.mutePost(
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

        await mutePostUseCase.mutePost(
          testPost,
          testCurrentUid,
          testToken,
        );

        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['currentUid'], equals(testCurrentUid));
        expect(capturedArgs['post'], equals(testPost));
        expect(capturedArgs['token'], equals(testToken));
        expect(capturedArgs['postMute'], isA<PostMute>());
      });

      test('should create PostMute from post and currentUid', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        await mutePostUseCase.mutePost(
          testPost,
          testCurrentUid,
          testToken,
        );

        final capturedPostMute = fakeDatabaseRepository.capturedArguments['postMute'] as PostMute;
        expect(capturedPostMute.activeUid, equals(testCurrentUid));
        expect(capturedPostMute.postId, equals(testPost.postId));
      });

      test('should handle empty currentUid', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        const emptyUid = '';

        final result = await mutePostUseCase.mutePost(
          testPost,
          emptyUid,
          testToken,
        );

        expect(result, isA<Result<bool>>());
        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['currentUid'], equals(emptyUid));
      });

      test('should handle different post configurations', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        
        final differentPost = testPost.copyWith(
          postId: 'different_post_id',
          uid: 'different_owner_uid',
          likeCount: 100,
          muteCount: 5,
        );

        final result = await mutePostUseCase.mutePost(
          differentPost,
          testCurrentUid,
          testToken,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        final capturedPost = fakeDatabaseRepository.capturedArguments['post'] as Post;
        expect(capturedPost.postId, equals('different_post_id'));
        expect(capturedPost.uid, equals('different_owner_uid'));
        expect(capturedPost.likeCount, equals(100));
        expect(capturedPost.muteCount, equals(5));
      });
    });

    group('constructor', () {
      test('should create MutePostUseCase with required dependencies', () {
        final useCase = MutePostUseCase(
          firestoreRepository: fakeDatabaseRepository,
        );

        expect(useCase, isA<MutePostUseCase>());
        expect(useCase.firestoreRepository, equals(fakeDatabaseRepository));
      });
    });

    group('error handling', () {
      late Post testPost;
      late MutePostToken testToken;
      const String testCurrentUid = 'test_current_uid';

      setUp(() {
        testPost = const Post(
          postId: 'test_post_id',
          uid: 'test_post_owner_uid',
          createdAt: 'test_timestamp',
          customCompleteText: {},
          description: {},
          image: {},
          searchToken: {},
          title: {},
          updatedAt: 'test_timestamp',
        );

        testToken = const MutePostToken(
          tokenId: 'test_token_id',
          postId: 'test_post_id',
          activeUid: testCurrentUid,
          tokenType: 'mute_post',
          createdAt: 'test_timestamp',
        );
      });

      test('should handle network timeout errors', () async {
        const timeoutError = 'Network timeout';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = timeoutError;

        final result = await mutePostUseCase.mutePost(
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

        final result = await mutePostUseCase.mutePost(
          testPost,
          testCurrentUid,
          testToken,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(permissionError)),
        );
      });

      test('should handle generic database errors', () async {
        const genericError = 'Database error';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = genericError;

        final result = await mutePostUseCase.mutePost(
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