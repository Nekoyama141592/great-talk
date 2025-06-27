import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/application/use_case/post/like_post_use_case.dart';
import 'package:great_talk/domain/entity/post/post.dart';
import 'package:great_talk/domain/entity/post_like/post_like.dart';
import 'package:great_talk/domain/entity/tokens/like_post_token/like_post_token.dart';
import '../../repository/fake/fake_database_repository.dart';

// Using shared FakeDatabaseRepository

void main() {
  group('LikePostUseCase', () {
    late LikePostUseCase likePostUseCase;
    late FakeDatabaseRepository fakeDatabaseRepository;

    setUp(() {
      fakeDatabaseRepository = FakeDatabaseRepository();
      likePostUseCase = LikePostUseCase(
        firestoreRepository: fakeDatabaseRepository,
      );
    });

    group('likePost', () {
      late Post testPost;
      late LikePostToken testToken;
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
          likeCount: 10,
        );

        testToken = const LikePostToken(
          tokenId: 'test_token_id',
          postId: 'test_post_id',
          activeUid: testCurrentUid,
          passiveUid: 'test_post_owner_uid',
          tokenType: 'like_post',
          createdAt: 'test_timestamp',
        );
      });

      test('should return success when liking post succeeds', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        final result = await likePostUseCase.likePost(
          testCurrentUid,
          testToken,
          testPost,
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

        final result = await likePostUseCase.likePost(
          testCurrentUid,
          testToken,
          testPost,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => fail('Expected failure but got success: $value'),
          failure: (error) => expect(error, equals(expectedError)),
        );
      });

      test('should pass correct arguments to database repository', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        await likePostUseCase.likePost(
          testCurrentUid,
          testToken,
          testPost,
        );

        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['method'], equals('createLikePostInfo'));
        expect(capturedArgs['currentUid'], equals(testCurrentUid));
        expect(capturedArgs['post'], equals(testPost));
        expect(capturedArgs['token'], equals(testToken));
        expect(capturedArgs['postLike'], isA<PostLike>());
      });

      test('should create PostLike from post and currentUid', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        await likePostUseCase.likePost(
          testCurrentUid,
          testToken,
          testPost,
        );

        final capturedPostLike = fakeDatabaseRepository.capturedArguments['postLike'] as PostLike;
        expect(capturedPostLike.activeUid, equals(testCurrentUid));
        expect(capturedPostLike.postId, equals(testPost.postId));
      });

      test('should handle empty currentUid', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        const emptyUid = '';

        final result = await likePostUseCase.likePost(
          emptyUid,
          testToken,
          testPost,
        );

        expect(result, isA<Result<bool>>());
        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['currentUid'], equals(emptyUid));
      });

      test('should handle posts with zero likes', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        
        final zeroLikesPost = testPost.copyWith(likeCount: 0);

        final result = await likePostUseCase.likePost(
          testCurrentUid,
          testToken,
          zeroLikesPost,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should handle posts with high like counts', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        
        final highLikesPost = testPost.copyWith(likeCount: 999999);

        final result = await likePostUseCase.likePost(
          testCurrentUid,
          testToken,
          highLikesPost,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });
    });

    group('unLikePost', () {
      late Post testPost;
      const String testCurrentUid = 'test_current_uid';
      const String testTokenId = 'test_token_id';

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
          likeCount: 5,
        );
      });

      test('should return success when unliking post succeeds', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        final result = await likePostUseCase.unLikePost(
          testCurrentUid,
          testTokenId,
          testPost,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should return failure when database operation fails', () async {
        const expectedError = 'Delete operation failed';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = expectedError;

        final result = await likePostUseCase.unLikePost(
          testCurrentUid,
          testTokenId,
          testPost,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => fail('Expected failure but got success: $value'),
          failure: (error) => expect(error, equals(expectedError)),
        );
      });

      test('should pass correct arguments to database repository', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        await likePostUseCase.unLikePost(
          testCurrentUid,
          testTokenId,
          testPost,
        );

        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['method'], equals('deleteLikePostInfo'));
        expect(capturedArgs['currentUid'], equals(testCurrentUid));
        expect(capturedArgs['post'], equals(testPost));
        expect(capturedArgs['tokenId'], equals(testTokenId));
      });

      test('should handle empty tokenId', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        const emptyTokenId = '';

        final result = await likePostUseCase.unLikePost(
          testCurrentUid,
          emptyTokenId,
          testPost,
        );

        expect(result, isA<Result<bool>>());
        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['tokenId'], equals(emptyTokenId));
      });

      test('should handle empty currentUid', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        const emptyUid = '';

        final result = await likePostUseCase.unLikePost(
          emptyUid,
          testTokenId,
          testPost,
        );

        expect(result, isA<Result<bool>>());
        final capturedArgs = fakeDatabaseRepository.capturedArguments;
        expect(capturedArgs['currentUid'], equals(emptyUid));
      });

      test('should handle posts with one like', () async {
        fakeDatabaseRepository.shouldSucceed = true;
        
        final oneLikePost = testPost.copyWith(likeCount: 1);

        final result = await likePostUseCase.unLikePost(
          testCurrentUid,
          testTokenId,
          oneLikePost,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });
    });

    group('constructor', () {
      test('should create LikePostUseCase with required dependencies', () {
        final useCase = LikePostUseCase(
          firestoreRepository: fakeDatabaseRepository,
        );

        expect(useCase, isA<LikePostUseCase>());
        expect(useCase.firestoreRepository, equals(fakeDatabaseRepository));
      });
    });

    group('error handling', () {
      late Post testPost;
      late LikePostToken testToken;
      const String testCurrentUid = 'test_current_uid';
      const String testTokenId = 'test_token_id';

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

        testToken = const LikePostToken(
          tokenId: testTokenId,
          postId: 'test_post_id',
          activeUid: testCurrentUid,
          passiveUid: 'test_post_owner_uid',
          tokenType: 'like_post',
          createdAt: 'test_timestamp',
        );
      });

      test('should handle network timeout errors for likePost', () async {
        const timeoutError = 'Network timeout';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = timeoutError;

        final result = await likePostUseCase.likePost(
          testCurrentUid,
          testToken,
          testPost,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(timeoutError)),
        );
      });

      test('should handle permission denied errors for likePost', () async {
        const permissionError = 'Permission denied';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = permissionError;

        final result = await likePostUseCase.likePost(
          testCurrentUid,
          testToken,
          testPost,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(permissionError)),
        );
      });

      test('should handle network timeout errors for unLikePost', () async {
        const timeoutError = 'Network timeout';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = timeoutError;

        final result = await likePostUseCase.unLikePost(
          testCurrentUid,
          testTokenId,
          testPost,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(timeoutError)),
        );
      });

      test('should handle post not found errors for unLikePost', () async {
        const notFoundError = 'Post not found';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = notFoundError;

        final result = await likePostUseCase.unLikePost(
          testCurrentUid,
          testTokenId,
          testPost,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(notFoundError)),
        );
      });

      test('should handle token not found errors for unLikePost', () async {
        const tokenNotFoundError = 'Token not found';
        fakeDatabaseRepository.shouldSucceed = false;
        fakeDatabaseRepository.errorMessage = tokenNotFoundError;

        final result = await likePostUseCase.unLikePost(
          testCurrentUid,
          testTokenId,
          testPost,
        );

        result.when(
          success: (value) => fail('Expected failure but got success'),
          failure: (error) => expect(error, equals(tokenNotFoundError)),
        );
      });
    });

    group('edge cases', () {
      test('should handle multiple rapid like operations', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        final post = const Post(
          postId: 'rapid_test_post',
          uid: 'owner_uid',
          createdAt: 'test_timestamp',
          customCompleteText: {},
          description: {},
          image: {},
          searchToken: {},
          title: {},
          updatedAt: 'test_timestamp',
        );

        final token1 = const LikePostToken(
          tokenId: 'token_1',
          postId: 'rapid_test_post',
          activeUid: 'user_1',
          passiveUid: 'owner_uid',
          tokenType: 'like_post',
          createdAt: 'test_timestamp',
        );

        final token2 = const LikePostToken(
          tokenId: 'token_2',
          postId: 'rapid_test_post',
          activeUid: 'user_2',
          passiveUid: 'owner_uid',
          tokenType: 'like_post',
          createdAt: 'test_timestamp',
        );

        final result1 = await likePostUseCase.likePost('user_1', token1, post);
        final result2 = await likePostUseCase.likePost('user_2', token2, post);

        expect(result1, isA<Result<bool>>());
        expect(result2, isA<Result<bool>>());
        
        result1.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('First like failed: $error'),
        );
        
        result2.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Second like failed: $error'),
        );
      });

      test('should handle like and unlike operations on same post', () async {
        fakeDatabaseRepository.shouldSucceed = true;

        final post = const Post(
          postId: 'like_unlike_test_post',
          uid: 'owner_uid',
          createdAt: 'test_timestamp',
          customCompleteText: {},
          description: {},
          image: {},
          searchToken: {},
          title: {},
          updatedAt: 'test_timestamp',
        );

        final token = const LikePostToken(
          tokenId: 'like_unlike_token',
          postId: 'like_unlike_test_post',
          activeUid: 'test_user',
          passiveUid: 'owner_uid',
          tokenType: 'like_post',
          createdAt: 'test_timestamp',
        );

        // Like the post
        final likeResult = await likePostUseCase.likePost('test_user', token, post);
        
        // Unlike the post
        final unlikeResult = await likePostUseCase.unLikePost('test_user', 'like_unlike_token', post);

        expect(likeResult, isA<Result<bool>>());
        expect(unlikeResult, isA<Result<bool>>());
        
        likeResult.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Like failed: $error'),
        );
        
        unlikeResult.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Unlike failed: $error'),
        );
      });
    });
  });
}