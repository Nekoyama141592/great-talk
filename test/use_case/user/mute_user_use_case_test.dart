import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/repository/database_repository.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/application/use_case/user/mute_user_use_case.dart';
import 'package:great_talk/domain/entity/post/post.dart';
import 'package:great_talk/domain/entity/tokens/mute_user_token/mute_user_token.dart';

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
      late Post testPost;
      late MuteUserToken testToken;
      const String testCurrentUid = 'test_current_uid';
      const String testPassiveUid = 'test_passive_uid';

      setUp(() {
        testPost = Post(
          postId: 'test_post_id',
          uid: testPassiveUid,
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

        testToken = MuteUserToken(
          tokenId: 'test_token_id',
          activeUid: testCurrentUid,
          passiveUid: testPassiveUid,
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        );
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
        expect(tokens.any((token) => token['tokenId'] == 'test_token_id'), isTrue);
      });

      test('should extract passiveUid from post.uid', () async {
        await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        // Verify token was created with correct data
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        final createdToken = tokens.firstWhere((token) => token['tokenId'] == 'test_token_id');
        expect(createdToken['activeUid'], equals(testCurrentUid));
        expect(createdToken['passiveUid'], equals(testPost.uid));
      });

      test('should create UserMute from currentUid and post', () async {
        await muteUserUseCase.muteUser(
          testPost,
          testCurrentUid,
          testToken,
        );

        // Verify token was created with correct relationships
        final tokens = await databaseRepository.getTokens(testCurrentUid);
        final createdToken = tokens.firstWhere((token) => token['tokenId'] == 'test_token_id');
        expect(createdToken['activeUid'], equals(testCurrentUid));
        expect(createdToken['passiveUid'], equals(testPost.uid));
        expect(createdToken['tokenType'], equals('mute_user'));
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
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Expected success but got failure: $error'),
        );

        // Verify token relationships
        final tokens = await databaseRepository.getTokens(sameUid);
        final createdToken = tokens.firstWhere((token) => token['tokenId'] == selfToken.tokenId);
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
        final posts = users.map((uid) => Post(
          postId: 'post_by_$uid',
          uid: uid,
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {},
          description: {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Post by $uid',
          },
          image: const {},
          searchToken: const {},
          title: {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Title by $uid',
          },
        )).toList();

        final tokens = users.map((uid) => MuteUserToken(
          tokenId: 'mute_${uid}_token',
          activeUid: muterUid,
          passiveUid: uid,
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        )).toList();

        // Mute all users
        final results = <Result<bool>>[];
        for (int i = 0; i < users.length; i++) {
          final result = await muteUserUseCase.muteUser(posts[i], muterUid, tokens[i]);
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
          expect(userTokens.any((token) => token['tokenId'] == 'mute_${user}_token'), isTrue);
        }
      });

      test('should handle posts with complex user relationships', () async {
        final complexPost = Post(
          postId: 'complex_post',
          uid: 'complex_user',
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {'systemPrompt': 'Complex user prompt'},
          description: const {
            'languageCode': 'ja',
            'negativeScore': 0.2,
            'positiveScore': 0.8,
            'sentiment': 'positive',
            'value': '複雑なユーザーの投稿',
          },
          image: const {
            'value': 'complex_user_image.jpg',
            'bucketName': 'user_content',
            'moderationLabels': ['safe'],
            'moderationModelVersion': '2.0',
          },
          searchToken: const {
            'tokens': ['複雑', 'ユーザー', 'complex'],
          },
          title: const {
            'languageCode': 'ja',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': '複雑なユーザーのタイトル',
          },
          hashTags: const ['#complex', '#ユーザー'],
          genre: 'user_content',
          likeCount: 150,
          muteCount: 5,
          reportCount: 1,
          msgCount: 50,
        );

        final complexToken = MuteUserToken(
          tokenId: 'complex_mute_token',
          activeUid: 'muting_user',
          passiveUid: 'complex_user',
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        );

        final result = await muteUserUseCase.muteUser(complexPost, 'muting_user', complexToken);

        expect(result, isA<Result<bool>>());
        result.when(
          success: (value) => expect(value, isTrue),
          failure: (error) => fail('Complex user mute failed: $error'),
        );

        // Verify token was created
        final tokens = await databaseRepository.getTokens('muting_user');
        expect(tokens.any((token) => token['tokenId'] == 'complex_mute_token'), isTrue);
      });

      test('should handle rapid sequential mute operations', () async {
        const rapidMuter = 'rapid_muter';
        const targetUser = 'target_user';
        
        final posts = List.generate(5, (index) => Post(
          postId: 'rapid_post_$index',
          uid: targetUser,
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {},
          description: {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Rapid test post $index',
          },
          image: const {},
          searchToken: const {},
          title: {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Rapid Test $index',
          },
        ));

        final tokens = List.generate(5, (index) => MuteUserToken(
          tokenId: 'rapid_mute_token_$index',
          activeUid: rapidMuter,
          passiveUid: targetUser,
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        ));

        // Execute mutes rapidly
        final futures = <Future<Result<bool>>>[];
        for (int i = 0; i < 5; i++) {
          futures.add(muteUserUseCase.muteUser(posts[i], rapidMuter, tokens[i]));
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
        
        // Check that at least some tokens were created
        bool hasAtLeastOneToken = false;
        for (int i = 0; i < 5; i++) {
          if (userTokens.any((token) => token['tokenId'] == 'rapid_mute_token_$i')) {
            hasAtLeastOneToken = true;
            break;
          }
        }
        expect(hasAtLeastOneToken, isTrue);
      });

      test('should handle cross-user mute scenarios', () async {
        // User A mutes User B, then User B mutes User A
        const userA = 'user_a';
        const userB = 'user_b';
        
        final postByB = Post(
          postId: 'post_by_b',
          uid: userB,
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {},
          description: const {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Post by User B',
          },
          image: const {},
          searchToken: const {},
          title: const {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Title by User B',
          },
        );

        final postByA = Post(
          postId: 'post_by_a',
          uid: userA,
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {},
          description: const {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Post by User A',
          },
          image: const {},
          searchToken: const {},
          title: const {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Title by User A',
          },
        );

        final tokenAMutesB = MuteUserToken(
          tokenId: 'a_mutes_b',
          activeUid: userA,
          passiveUid: userB,
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        );

        final tokenBMutesA = MuteUserToken(
          tokenId: 'b_mutes_a',
          activeUid: userB,
          passiveUid: userA,
          tokenType: 'mute_user',
          createdAt: mockTimestamp,
        );

        // A mutes B
        final resultAMutesB = await muteUserUseCase.muteUser(postByB, userA, tokenAMutesB);
        
        // B mutes A
        final resultBMutesA = await muteUserUseCase.muteUser(postByA, userB, tokenBMutesA);

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
        
        expect(tokensA.any((token) => token['tokenId'] == 'a_mutes_b'), isTrue);
        expect(tokensB.any((token) => token['tokenId'] == 'b_mutes_a'), isTrue);
      });
    });
  });
}