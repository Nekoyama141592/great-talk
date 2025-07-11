import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/application/use_case/user/mute_user_use_case.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/moderated_image/moderated_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/detected_text/detected_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_user_token/mute_user_token_model.dart';
import 'package:great_talk/domain/entity/database/tokens/mute_user_token_entity/mute_user_token_entity.dart';

void main() {
  group('MuteUserUseCase', () {
    late MuteUserUseCase muteUserUseCase;
    late DatabaseRepository databaseRepository;
    late FakeFirebaseFirestore fakeFirestore;
    late Timestamp mockTimestamp;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      databaseRepository = DatabaseRepository(instance: fakeFirestore);
      mockTimestamp = Timestamp.fromDate(DateTime(2024, 1, 1, 12, 0, 0));
      muteUserUseCase = MuteUserUseCase(
        firestoreRepository: databaseRepository,
      );
    });

    group('muteUser', () {
      late PostEntity testPost;
      late MuteUserTokenEntity testToken;
      const String testCurrentUid = 'test_current_uid';
      const String testPassiveUid = 'test_passive_uid';

      setUp(() {
        testPost = PostEntity(
          postId: 'test_post_id',
          uid: testPassiveUid,
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
          image: const ModeratedImage(),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Test Post Title',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        final muteUserToken = MuteUserTokenModel(
          tokenId: 'test_token_id',
          activeUid: testCurrentUid,
          passiveUid: testPassiveUid,
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        );
        testToken = MuteUserTokenEntity.fromModel(muteUserToken);
      });

      test('should return success when muting user succeeds', () async {
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

        // Verify token was created in fake Firestore
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        expect(tokens.isNotEmpty, isTrue);
        expect(
          tokens.any(
            (token) =>
                token['activeUid'] == testCurrentUid &&
                token['passiveUid'] == testPassiveUid &&
                token['tokenType'] == 'muteUser',
          ),
          isTrue,
        );
      });

      test('should extract passiveUid from post.uid', () async {
        await muteUserUseCase.muteUser(testPost, testCurrentUid, testToken);

        // Verify token was created with correct data
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        final createdToken = tokens.firstWhere(
          (token) =>
              token['activeUid'] == testCurrentUid &&
              token['passiveUid'] == testPost.uid &&
              token['tokenType'] == 'muteUser',
        );
        expect(createdToken['activeUid'], equals(testCurrentUid));
        expect(createdToken['passiveUid'], equals(testPost.uid));
      });

      test('should create UserMute from currentUid and post', () async {
        await muteUserUseCase.muteUser(testPost, testCurrentUid, testToken);

        // Verify token was created with correct relationships
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        final createdToken = tokens.firstWhere(
          (token) =>
              token['activeUid'] == testCurrentUid &&
              token['passiveUid'] == testPost.uid &&
              token['tokenType'] == 'muteUser',
        );
        expect(createdToken['activeUid'], equals(testCurrentUid));
        expect(createdToken['passiveUid'], equals(testPost.uid));
        expect(createdToken['tokenType'], equals('muteUser'));
      });

      test('should handle empty currentUid', () async {
        const emptyUid = '';

        final result = await muteUserUseCase.muteUser(
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

      test('should handle different post owner configurations', () async {
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

        // Verify token was created
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        expect(tokens.isNotEmpty, isTrue);
      });

      test('should handle same user muting themselves', () async {
        const sameUid = 'same_user_uid';

        final selfPost = testPost.copyWith(uid: sameUid);
        final selfMuteUserToken = MuteUserTokenModel(
          tokenId: 'test_token_id',
          activeUid: sameUid,
          passiveUid: sameUid,
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        );
        final selfToken = MuteUserTokenEntity.fromModel(selfMuteUserToken);

        final result = await muteUserUseCase.muteUser(
          selfPost,
          sameUid,
          selfToken,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        // Verify token relationships
        final tokens = await databaseRepository.getTokens(sameUid);
        final createdToken = tokens.firstWhere(
          (token) =>
              token['activeUid'] == sameUid &&
              token['passiveUid'] == sameUid &&
              token['tokenType'] == 'muteUser',
        );
        expect(createdToken['activeUid'], equals(sameUid));
        expect(createdToken['passiveUid'], equals(sameUid));
      });
    });

    group('constructor', () {
      test('should create MuteUserUseCase with required dependencies', () {
        final useCase = MuteUserUseCase(
          firestoreRepository: databaseRepository,
        );

        expect(useCase, isA<MuteUserUseCase>());
        expect(useCase.firestoreRepository, equals(databaseRepository));
      });
    });

    group('edge cases', () {
      test('should handle multiple user mutes by same user', () async {
        const muterUid = 'active_muter';

        final users = ['user1', 'user2', 'user3'];
        final posts =
            users
                .map(
                  (uid) => PostEntity(
                    postId: 'post_by_$uid',
                    uid: uid,
                    createdAt: mockTimestamp.toDate(),
                    updatedAt: mockTimestamp.toDate(),
                    customCompleteText: const CustomCompleteText(
                      systemPrompt: 'test',
                    ),
                    description: DetectedText(
                      languageCode: 'en',
                      negativeScore: 0,
                      positiveScore: 1,
                      sentiment: 'positive',
                      value: 'Post by $uid',
                    ),
                    image: const ModeratedImage(),
                    title: DetectedText(
                      languageCode: 'en',
                      negativeScore: 0,
                      positiveScore: 1,
                      sentiment: 'positive',
                      value: 'Title by $uid',
                    ),
                    likeCount: 0,
                    msgCount: 0,
                  ),
                )
                .toList();

        final modelTokens =
            users
                .map(
                  (uid) => MuteUserTokenModel(
                    tokenId: 'mute_${uid}_token',
                    activeUid: muterUid,
                    passiveUid: uid,
                    tokenType: 'mute_user',
                    createdAt: mockTimestamp,
                  ),
                )
                .toList();
        final tokens =
            modelTokens
                .map((token) => MuteUserTokenEntity.fromModel(token))
                .toList();

        // Mute all users
        final results = <Result<bool>>[];
        for (int i = 0; i < users.length; i++) {
          final result = await muteUserUseCase.muteUser(
            posts[i],
            muterUid,
            tokens[i],
          );
          results.add(result);
        }

        // Verify all mutes succeeded
        for (int i = 0; i < users.length; i++) {
          expect(results[i], isA<Result<bool>>());
          results[i].when(
            success: (value) => expect(value, isTrue),
            failure: (error) => fail('Mute ${users[i]} failed: $error'),
          );
        }

        // Verify all tokens were created
        final userTokens = await databaseRepository.getTokens(muterUid);
        expect(userTokens.length, greaterThanOrEqualTo(3));
        for (final user in users) {
          expect(
            userTokens.any(
              (token) =>
                  token['activeUid'] == muterUid &&
                  token['passiveUid'] == user &&
                  token['tokenType'] == 'muteUser',
            ),
            isTrue,
          );
        }
      });

      test('should handle posts with complex user relationships', () async {
        final complexPost = PostEntity(
          postId: 'complex_post',
          uid: 'complex_user',
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(
            systemPrompt: 'Complex user prompt',
          ),
          description: const DetectedText(
            languageCode: 'ja',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: '複雑なユーザーの投稿',
          ),
          image: const ModeratedImage(
            value: 'complex_user_image.jpg',
            bucketName: 'user_content',
            moderationLabels: [],
            moderationModelVersion: '2.0',
          ),
          title: const DetectedText(
            languageCode: 'ja',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: '複雑なユーザーのタイトル',
          ),
          likeCount: 150,
          msgCount: 50,
        );

        final complexMuteUserToken = MuteUserTokenModel(
          tokenId: 'complex_mute_token',
          activeUid: 'muting_user',
          passiveUid: 'complex_user',
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        );
        final complexToken = MuteUserTokenEntity.fromModel(
          complexMuteUserToken,
        );

        final result = await muteUserUseCase.muteUser(
          complexPost,
          'muting_user',
          complexToken,
        );

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Complex user mute failed: $error'),
        );

        // Verify token was created
        final tokens = await databaseRepository.getTokens('muting_user');
        expect(
          tokens.any(
            (token) =>
                token['activeUid'] == 'muting_user' &&
                token['passiveUid'] == 'complex_user' &&
                token['tokenType'] == 'muteUser',
          ),
          isTrue,
        );
      });

      test('should handle rapid sequential mute operations', () async {
        const rapidMuter = 'rapid_muter';
        const targetUser = 'target_user';

        final posts = List.generate(
          5,
          (index) => PostEntity(
            postId: 'rapid_post_$index',
            uid: targetUser,
            createdAt: mockTimestamp.toDate(),
            updatedAt: mockTimestamp.toDate(),
            customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
            description: DetectedText(
              languageCode: 'en',
              negativeScore: 0,
              positiveScore: 1,
              sentiment: 'positive',
              value: 'Rapid test post $index',
            ),
            image: const ModeratedImage(),
            title: DetectedText(
              languageCode: 'en',
              negativeScore: 0,
              positiveScore: 1,
              sentiment: 'positive',
              value: 'Rapid Test $index',
            ),
            likeCount: 0,
            msgCount: 0,
          ),
        );

        final modelTokens = List.generate(
          5,
          (index) => MuteUserTokenModel(
            tokenId: 'rapid_mute_token_$index',
            activeUid: rapidMuter,
            passiveUid: targetUser,
            tokenType: 'mute_user',
            createdAt: mockTimestamp,
          ),
        );
        final tokens =
            modelTokens
                .map((token) => MuteUserTokenEntity.fromModel(token))
                .toList();

        // Execute mutes rapidly
        final futures = <Future<Result<bool>>>[];
        for (int i = 0; i < 5; i++) {
          futures.add(
            muteUserUseCase.muteUser(posts[i], rapidMuter, tokens[i]),
          );
        }

        final results = await Future.wait(futures);

        // Verify all operations completed successfully
        for (int i = 0; i < 5; i++) {
          expect(results[i], isA<Result<bool>>());
          results[i].when(
            success: (value) => expect(value, isTrue),
            failure: (error) => fail('Rapid mute $i failed: $error'),
          );
        }

        // Verify all tokens were created (some might be duplicates due to same target user)
        final userTokens = await databaseRepository.getTokens(rapidMuter);
        expect(userTokens.isNotEmpty, isTrue);

        // Check that tokens were created for the target user
        expect(
          userTokens.any(
            (token) =>
                token['activeUid'] == rapidMuter &&
                token['passiveUid'] == targetUser &&
                token['tokenType'] == 'muteUser',
          ),
          isTrue,
        );
      });

      test('should handle cross-user mute scenarios', () async {
        // User A mutes User B, then User B mutes User A
        const userA = 'user_a';
        const userB = 'user_b';

        final postByB = PostEntity(
          postId: 'post_by_b',
          uid: userB,
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Post by User B',
          ),
          image: const ModeratedImage(),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Title by User B',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        final postByA = PostEntity(
          postId: 'post_by_a',
          uid: userA,
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(systemPrompt: 'test'),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Post by User A',
          ),
          image: const ModeratedImage(),
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Title by User A',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        final modelTokenAMutesB = MuteUserTokenModel(
          tokenId: 'a_mutes_b',
          activeUid: userA,
          passiveUid: userB,
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        );
        final tokenAMutesB = MuteUserTokenEntity.fromModel(modelTokenAMutesB);

        final modelTokenBMutesA = MuteUserTokenModel(
          tokenId: 'b_mutes_a',
          activeUid: userB,
          passiveUid: userA,
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        );
        final tokenBMutesA = MuteUserTokenEntity.fromModel(modelTokenBMutesA);

        // A mutes B
        final resultAMutesB = await muteUserUseCase.muteUser(
          postByB,
          userA,
          tokenAMutesB,
        );

        // B mutes A
        final resultBMutesA = await muteUserUseCase.muteUser(
          postByA,
          userB,
          tokenBMutesA,
        );

        expect(resultAMutesB, isA<Result<bool>>());
        expect(resultBMutesA, isA<Result<bool>>());

        resultAMutesB.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('A muting B failed: $error'),
        );

        resultBMutesA.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('B muting A failed: $error'),
        );

        // Verify both tokens were created
        final tokensA = await databaseRepository.getTokens(userA);
        final tokensB = await databaseRepository.getTokens(userB);

        expect(
          tokensA.any(
            (token) =>
                token['activeUid'] == userA &&
                token['passiveUid'] == userB &&
                token['tokenType'] == 'muteUser',
          ),
          isTrue,
        );
        expect(
          tokensB.any(
            (token) =>
                token['activeUid'] == userB &&
                token['passiveUid'] == userA &&
                token['tokenType'] == 'muteUser',
          ),
          isTrue,
        );
      });
    });
  });
}
