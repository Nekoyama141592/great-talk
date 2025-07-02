import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/infrastructure/repository/result/result.dart';
import 'package:great_talk/application/use_case/post/mute_post_use_case.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_text/detected_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/custom_complete_text/custom_complete_text.dart';

void main() {
  group('MutePostUseCase', () {
    late MutePostUseCase mutePostUseCase;
    late DatabaseRepository databaseRepository;
    late FakeFirebaseFirestore fakeFirestore;
    late DateTime mockDateTime;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      databaseRepository = DatabaseRepository(instance: fakeFirestore);
      mockDateTime = DateTime(2024, 1, 1, 12, 0, 0);
      mutePostUseCase = MutePostUseCase(
        firestoreRepository: databaseRepository,
      );
    });

    group('mutePost', () {
      late PostEntity testPost;
      late MutePostToken testToken;
      const String testCurrentUid = 'test_current_uid';

      setUp(() {
        testPost = PostEntity(
          postId: 'test_post_id',
          uid: 'test_post_owner_uid',
          createdAt: mockDateTime,
          updatedAt: mockDateTime,
          customCompleteText: const CustomCompleteText(systemPrompt: ''),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 5,
            positiveScore: 95,
            sentiment: 'positive',
            value: 'Test post description',
          ),
          image: const DetectedImage(),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 10,
            positiveScore: 90,
            sentiment: 'positive',
            value: 'Test Post Title',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        testToken = MutePostToken(
          tokenId: 'test_token_id',
          postId: 'test_post_id',
          activeUid: testCurrentUid,
          tokenType: 'mute_post',
          createdAt: Timestamp.fromDate(mockDateTime),
        );
      });

      test('should return success when muting post succeeds', () async {
        final result = await mutePostUseCase.mutePost(
          testPost,
          testCurrentUid,
          testToken,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) {
            expect(value, isTrue);

            // Verify token was created in fake Firestore
            databaseRepository.getTokens(testCurrentUid).then((tokens) {
              expect(tokens.isNotEmpty, isTrue);
              expect(
                tokens.any(
                  (token) =>
                      token['postId'] == 'test_post_id' &&
                      token['activeUid'] == testCurrentUid &&
                      token['tokenType'] == 'mutePost',
                ),
                isTrue,
              );
            });
          },
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should create PostMute from post and currentUid', () async {
        await mutePostUseCase.mutePost(testPost, testCurrentUid, testToken);

        // Verify token was created with correct data
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        final createdToken = tokens.firstWhere(
          (token) =>
              token['postId'] == testPost.postId &&
              token['activeUid'] == testCurrentUid &&
              token['tokenType'] == 'mutePost',
        );
        expect(createdToken['activeUid'], equals(testCurrentUid));
        expect(createdToken['postId'], equals(testPost.postId));
      });

      test('should handle empty currentUid', () async {
        const emptyUid = '';

        final result = await mutePostUseCase.mutePost(
          testPost,
          emptyUid,
          testToken,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });

      test('should handle different post configurations', () async {
        final differentPost = testPost.copyWith(
          postId: 'different_post_id',
          uid: 'different_owner_uid',
          likeCount: 100,
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

        // Verify token was created
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        expect(tokens.isNotEmpty, isTrue);
      });

      test('should handle posts with various counts', () async {
        final postWithCounts = testPost.copyWith(likeCount: 50, msgCount: 25);

        final result = await mutePostUseCase.mutePost(
          postWithCounts,
          testCurrentUid,
          testToken,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );
      });
    });

    group('constructor', () {
      test('should create MutePostUseCase with required dependencies', () {
        final useCase = MutePostUseCase(
          firestoreRepository: databaseRepository,
        );

        expect(useCase, isA<MutePostUseCase>());
        expect(useCase.firestoreRepository, equals(databaseRepository));
      });
    });

    group('edge cases', () {
      test('should handle multiple rapid mute operations', () async {
        final post1 = PostEntity(
          postId: 'mute_test_post_1',
          uid: 'owner_uid_1',
          createdAt: mockDateTime,
          updatedAt: mockDateTime,
          customCompleteText: const CustomCompleteText(systemPrompt: ''),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 5,
            positiveScore: 95,
            sentiment: 'positive',
            value: 'Mute test description 1',
          ),
          image: const DetectedImage(),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 10,
            positiveScore: 90,
            sentiment: 'positive',
            value: 'Mute Test Post 1',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        final post2 = PostEntity(
          postId: 'mute_test_post_2',
          uid: 'owner_uid_2',
          createdAt: mockDateTime,
          updatedAt: mockDateTime,
          customCompleteText: const CustomCompleteText(systemPrompt: ''),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 5,
            positiveScore: 95,
            sentiment: 'positive',
            value: 'Mute test description 2',
          ),
          image: const DetectedImage(),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 10,
            positiveScore: 90,
            sentiment: 'positive',
            value: 'Mute Test Post 2',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        final token1 = MutePostToken(
          tokenId: 'mute_token_1',
          postId: 'mute_test_post_1',
          activeUid: 'test_user',
          tokenType: 'mute_post',
          createdAt: Timestamp.fromDate(mockDateTime),
        );

        final token2 = MutePostToken(
          tokenId: 'mute_token_2',
          postId: 'mute_test_post_2',
          activeUid: 'test_user',
          tokenType: 'mute_post',
          createdAt: Timestamp.fromDate(mockDateTime),
        );

        final result1 = await mutePostUseCase.mutePost(
          post1,
          'test_user',
          token1,
        );
        final result2 = await mutePostUseCase.mutePost(
          post2,
          'test_user',
          token2,
        );

        expect(result1, isA<Result<bool>>());
        expect(result2, isA<Result<bool>>());

        result1.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('First mute failed: $error'),
        );

        result2.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Second mute failed: $error'),
        );

        // Verify both tokens were created
        final tokens = await databaseRepository.getTokens('test_user');
        expect(
          tokens.any(
            (token) =>
                token['postId'] == 'mute_test_post_1' &&
                token['activeUid'] == 'test_user' &&
                token['tokenType'] == 'mutePost',
          ),
          isTrue,
        );
        expect(
          tokens.any(
            (token) =>
                token['postId'] == 'mute_test_post_2' &&
                token['activeUid'] == 'test_user' &&
                token['tokenType'] == 'mutePost',
          ),
          isTrue,
        );
        expect(tokens.length, greaterThanOrEqualTo(2));
      });

      test('should handle posts with special content', () async {
        final specialPost = PostEntity(
          postId: 'special_content_post',
          uid: 'special_owner',
          createdAt: mockDateTime,
          updatedAt: mockDateTime,
          customCompleteText: const CustomCompleteText(
            systemPrompt: 'Special system prompt',
          ),
          description: const DetectedText(
            languageCode: 'ja',
            negativeScore: 30,
            positiveScore: 70,
            sentiment: 'positive',
            value: '特別なテスト投稿の説明',
          ),
          image: const DetectedImage(
            value: 'special_image.png',
            bucketName: 'special_bucket',
            moderationLabels: [],
            moderationModelVersion: '2.0',
          ),
          title: const DetectedText(
            languageCode: 'ja',
            negativeScore: 10,
            positiveScore: 90,
            sentiment: 'positive',
            value: '特別なテスト投稿',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        final specialToken = MutePostToken(
          tokenId: 'special_mute_token',
          postId: 'special_content_post',
          activeUid: 'test_user',
          tokenType: 'mute_post',
          createdAt: Timestamp.fromDate(mockDateTime),
        );

        final result = await mutePostUseCase.mutePost(
          specialPost,
          'test_user',
          specialToken,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Special content mute failed: $error'),
        );

        // Verify token was created
        final tokens = await databaseRepository.getTokens('test_user');
        expect(
          tokens.any(
            (token) =>
                token['postId'] == 'special_content_post' &&
                token['activeUid'] == 'test_user' &&
                token['tokenType'] == 'mutePost',
          ),
          isTrue,
        );
      });

      test('should handle same user muting multiple posts', () async {
        const testUser = 'multi_mute_user';

        final posts = List.generate(
          3,
          (index) => PostEntity(
            postId: 'multi_post_$index',
            uid: 'owner_$index',
            createdAt: mockDateTime,
            updatedAt: mockDateTime,
            customCompleteText: const CustomCompleteText(systemPrompt: ''),
            description: DetectedText(
              languageCode: 'en',
              negativeScore: 5,
              positiveScore: 95,
              sentiment: 'positive',
              value: 'Multi mute test description $index',
            ),
            image: const DetectedImage(),
            title: DetectedText(
              languageCode: 'en',
              negativeScore: 10,
              positiveScore: 90,
              sentiment: 'positive',
              value: 'Multi Mute Test Post $index',
            ),
            likeCount: 0,
            msgCount: 0,
          ),
        );

        final tokens = List.generate(
          3,
          (index) => MutePostToken(
            tokenId: 'multi_mute_token_$index',
            postId: 'multi_post_$index',
            activeUid: testUser,
            tokenType: 'mute_post',
            createdAt: Timestamp.fromDate(mockDateTime),
          ),
        );

        // Mute all posts
        final results = <Result<bool>>[];
        for (int i = 0; i < 3; i++) {
          final result = await mutePostUseCase.mutePost(
            posts[i],
            testUser,
            tokens[i],
          );
          results.add(result);
        }

        // Verify all mutes succeeded
        for (int i = 0; i < 3; i++) {
          expect(results[i], isA<Result<bool>>());
          results[i].when(
            success: (value) => expect(value, isTrue),
            failure: (error) => fail('Mute $i failed: $error'),
          );
        }

        // Verify all tokens were created
        final userTokens = await databaseRepository.getTokens(testUser);
        expect(userTokens.length, greaterThanOrEqualTo(3));
        for (int i = 0; i < 3; i++) {
          expect(
            userTokens.any(
              (token) =>
                  token['postId'] == 'multi_post_$i' &&
                  token['activeUid'] == testUser &&
                  token['tokenType'] == 'mutePost',
            ),
            isTrue,
          );
        }
      });
    });
  });
}
