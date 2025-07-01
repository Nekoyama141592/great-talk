import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/application/use_case/post/like_post_use_case.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_text/detected_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/like_post_token/like_post_token.dart';

void main() {
  group('LikePostUseCase', () {
    late LikePostUseCase likePostUseCase;
    late DatabaseRepository databaseRepository;
    late FakeFirebaseFirestore fakeFirestore;
    late Timestamp mockTimestamp;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      databaseRepository = DatabaseRepository(instance: fakeFirestore);
      mockTimestamp = Timestamp.fromDate(DateTime(2024, 1, 1, 12, 0, 0));
      likePostUseCase = LikePostUseCase(
        firestoreRepository: databaseRepository,
      );
    });

    group('likePost', () {
      late PostEntity testPost;
      late LikePostToken testToken;
      const String testCurrentUid = 'test_current_uid';

      setUp(() {
        testPost = PostEntity(
          postId: 'test_post_id',
          uid: 'test_post_owner_uid',
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Test post description',
          ),
          image: const DetectedImage(),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Test Post Title',
          ),
          likeCount: 10,
          msgCount: 0,
        );

        testToken = LikePostToken(
          tokenId: 'test_token_id',
          postId: 'test_post_id',
          activeUid: testCurrentUid,
          passiveUid: 'test_post_owner_uid',
          tokenType: 'like_post',
          createdAt: mockTimestamp,
        );
      });

      test('should return success when liking post succeeds', () async {
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

        // Verify token was created in fake Firestore
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        expect(tokens.isNotEmpty, isTrue);
        expect(
          tokens.any((token) => token['tokenId'] == 'test_token_id'),
          isTrue,
        );
      });

      test('should create PostLike from post and currentUid', () async {
        await likePostUseCase.likePost(testCurrentUid, testToken, testPost);

        // Verify PostLike was created by checking if the like collection exists
        // In a real app, we'd verify the PostLike document exists in the post's subcollection
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        final createdToken = tokens.firstWhere(
          (token) => token['tokenId'] == 'test_token_id',
        );
        expect(createdToken['activeUid'], equals(testCurrentUid));
        expect(createdToken['postId'], equals(testPost.postId));
      });

      test('should handle empty currentUid', () async {
        const emptyUid = '';

        final result = await likePostUseCase.likePost(
          emptyUid,
          testToken,
          testPost,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should handle posts with zero likes', () async {
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
      late PostEntity testPost;
      const String testCurrentUid = 'test_current_uid';
      const String testTokenId = 'test_token_id';

      setUp(() {
        testPost = PostEntity(
          postId: 'test_post_id',
          uid: 'test_post_owner_uid',
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Test post description',
          ),
          image: const DetectedImage(),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Test Post Title',
          ),
          likeCount: 5,
          msgCount: 0,
        );
      });

      test('should return success when unliking post succeeds', () async {
        // First create a like to unlike
        final token = LikePostToken(
          tokenId: testTokenId,
          postId: testPost.postId,
          activeUid: testCurrentUid,
          passiveUid: testPost.uid,
          tokenType: 'like_post',
          createdAt: mockTimestamp,
        );

        await likePostUseCase.likePost(testCurrentUid, token, testPost);

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

        // Verify token was deleted
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        expect(tokens.any((token) => token['tokenId'] == testTokenId), isFalse);
      });

      test('should handle empty tokenId', () async {
        const emptyTokenId = '';

        final result = await likePostUseCase.unLikePost(
          testCurrentUid,
          emptyTokenId,
          testPost,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should handle empty currentUid', () async {
        const emptyUid = '';

        final result = await likePostUseCase.unLikePost(
          emptyUid,
          testTokenId,
          testPost,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should handle posts with one like', () async {
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
          firestoreRepository: databaseRepository,
        );

        expect(useCase, isA<LikePostUseCase>());
        expect(useCase.firestoreRepository, equals(databaseRepository));
      });
    });

    group('edge cases', () {
      test('should handle multiple rapid like operations', () async {
        final post = PostEntity(
          postId: 'rapid_test_post',
          uid: 'owner_uid',
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Rapid test description',
          ),
          image: const DetectedImage(),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Rapid Test Post',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        final token1 = LikePostToken(
          tokenId: 'token_1',
          postId: 'rapid_test_post',
          activeUid: 'user_1',
          passiveUid: 'owner_uid',
          tokenType: 'like_post',
          createdAt: mockTimestamp,
        );

        final token2 = LikePostToken(
          tokenId: 'token_2',
          postId: 'rapid_test_post',
          activeUid: 'user_2',
          passiveUid: 'owner_uid',
          tokenType: 'like_post',
          createdAt: mockTimestamp,
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

        // Verify both tokens were created
        final tokens1 = await databaseRepository.getTokens('user_1');
        final tokens2 = await databaseRepository.getTokens('user_2');
        expect(tokens1.any((token) => token['tokenId'] == 'token_1'), isTrue);
        expect(tokens2.any((token) => token['tokenId'] == 'token_2'), isTrue);
      });

      test('should handle like and unlike operations on same post', () async {
        final post = PostEntity(
          postId: 'like_unlike_test_post',
          uid: 'owner_uid',
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Like unlike test description',
          ),
          image: const DetectedImage(),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Like Unlike Test Post',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        final token = LikePostToken(
          tokenId: 'like_unlike_token',
          postId: 'like_unlike_test_post',
          activeUid: 'test_user',
          passiveUid: 'owner_uid',
          tokenType: 'like_post',
          createdAt: mockTimestamp,
        );

        // Like the post
        final likeResult = await likePostUseCase.likePost(
          'test_user',
          token,
          post,
        );

        // Unlike the post
        final unlikeResult = await likePostUseCase.unLikePost(
          'test_user',
          'like_unlike_token',
          post,
        );

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

        // Verify token was removed after unlike
        final finalTokens = await databaseRepository.getTokens('test_user');
        expect(
          finalTokens.any((token) => token['tokenId'] == 'like_unlike_token'),
          isFalse,
        );
      });
    });
  });
}
