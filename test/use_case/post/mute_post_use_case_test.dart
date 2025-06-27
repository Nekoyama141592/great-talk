import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/repository/database_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/application/use_case/post/mute_post_use_case.dart';
import 'package:great_talk/domain/entity/post/post.dart';
import 'package:great_talk/domain/entity/tokens/mute_post_token/mute_post_token.dart';

void main() {
  group('MutePostUseCase', () {
    late MutePostUseCase mutePostUseCase;
    late DatabaseRepository databaseRepository;
    late FakeFirebaseFirestore fakeFirestore;
    late Timestamp mockTimestamp;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      databaseRepository = DatabaseRepository(instance: fakeFirestore);
      mockTimestamp = Timestamp.fromDate(DateTime(2024, 1, 1, 12, 0, 0));
      mutePostUseCase = MutePostUseCase(
        firestoreRepository: databaseRepository,
      );
    });

    group('mutePost', () {
      late Post testPost;
      late MutePostToken testToken;
      const String testCurrentUid = 'test_current_uid';

      setUp(() {
        testPost = Post(
          postId: 'test_post_id',
          uid: 'test_post_owner_uid',
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {},
          description: const {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Test post description',
          },
          image: const {},
          searchToken: const {},
          title: const {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Test Post Title',
          },
        );

        testToken = MutePostToken(
          tokenId: 'test_token_id',
          postId: 'test_post_id',
          activeUid: testCurrentUid,
          tokenType: 'mute_post',
          createdAt: mockTimestamp,
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

      test('should create PostMute from post and currentUid', () async {
        await mutePostUseCase.mutePost(testPost, testCurrentUid, testToken);

        // Verify token was created with correct data
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        final createdToken = tokens.firstWhere(
          (token) => token['tokenId'] == 'test_token_id',
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

        // Verify token was created
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        expect(tokens.isNotEmpty, isTrue);
      });

      test('should handle posts with various counts', () async {
        final postWithCounts = testPost.copyWith(
          likeCount: 50,
          muteCount: 10,
          reportCount: 3,
          msgCount: 25,
        );

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
        final post1 = Post(
          postId: 'mute_test_post_1',
          uid: 'owner_uid_1',
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {},
          description: const {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Mute test description 1',
          },
          image: const {},
          searchToken: const {},
          title: const {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Mute Test Post 1',
          },
        );

        final post2 = Post(
          postId: 'mute_test_post_2',
          uid: 'owner_uid_2',
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {},
          description: const {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Mute test description 2',
          },
          image: const {},
          searchToken: const {},
          title: const {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Mute Test Post 2',
          },
        );

        final token1 = MutePostToken(
          tokenId: 'mute_token_1',
          postId: 'mute_test_post_1',
          activeUid: 'test_user',
          tokenType: 'mute_post',
          createdAt: mockTimestamp,
        );

        final token2 = MutePostToken(
          tokenId: 'mute_token_2',
          postId: 'mute_test_post_2',
          activeUid: 'test_user',
          tokenType: 'mute_post',
          createdAt: mockTimestamp,
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
          tokens.any((token) => token['tokenId'] == 'mute_token_1'),
          isTrue,
        );
        expect(
          tokens.any((token) => token['tokenId'] == 'mute_token_2'),
          isTrue,
        );
        expect(tokens.length, greaterThanOrEqualTo(2));
      });

      test('should handle posts with special content', () async {
        final specialPost = Post(
          postId: 'special_content_post',
          uid: 'special_owner',
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {'systemPrompt': 'Special system prompt'},
          description: const {
            'languageCode': 'ja',
            'negativeScore': 0.3,
            'positiveScore': 0.7,
            'sentiment': 'positive',
            'value': '特別なテスト投稿の説明',
          },
          image: const {
            'value': 'special_image.png',
            'bucketName': 'special_bucket',
            'moderationLabels': ['safe', 'appropriate'],
            'moderationModelVersion': '2.0',
          },
          searchToken: const {
            'tokens': ['特別', 'テスト', 'special'],
          },
          title: const {
            'languageCode': 'ja',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': '特別なテスト投稿',
          },
          hashTags: const ['#special', '#テスト'],
          genre: 'test',
          score: 95.5,
        );

        final specialToken = MutePostToken(
          tokenId: 'special_mute_token',
          postId: 'special_content_post',
          activeUid: 'test_user',
          tokenType: 'mute_post',
          createdAt: mockTimestamp,
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
          tokens.any((token) => token['tokenId'] == 'special_mute_token'),
          isTrue,
        );
      });

      test('should handle same user muting multiple posts', () async {
        const testUser = 'multi_mute_user';

        final posts = List.generate(
          3,
          (index) => Post(
            postId: 'multi_post_$index',
            uid: 'owner_$index',
            createdAt: mockTimestamp,
            updatedAt: mockTimestamp,
            customCompleteText: const {},
            description: {
              'languageCode': 'en',
              'negativeScore': 0.05,
              'positiveScore': 0.95,
              'sentiment': 'positive',
              'value': 'Multi mute test description $index',
            },
            image: const {},
            searchToken: const {},
            title: {
              'languageCode': 'en',
              'negativeScore': 0.1,
              'positiveScore': 0.9,
              'sentiment': 'positive',
              'value': 'Multi Mute Test Post $index',
            },
          ),
        );

        final tokens = List.generate(
          3,
          (index) => MutePostToken(
            tokenId: 'multi_mute_token_$index',
            postId: 'multi_post_$index',
            activeUid: testUser,
            tokenType: 'mute_post',
            createdAt: mockTimestamp,
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
              (token) => token['tokenId'] == 'multi_mute_token_$i',
            ),
            isTrue,
          );
        }
      });
    });
  });
}
