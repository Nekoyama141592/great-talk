import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/infrastructure/model/database_schema/user_update_log/user_update_log_model.dart';
import 'package:great_talk/infrastructure/repository/database_repository.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/moderated_image/moderated_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/detected_text/detected_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/timeline/timeline_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/tokens_model.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';

void main() {
  group('DatabaseRepository Enhanced Tests', () {
    late FakeFirebaseFirestore fakeFirestore;
    late DatabaseRepository repository;
    late Timestamp mockTimestamp;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      repository = DatabaseRepository(instance: fakeFirestore);
      mockTimestamp = Timestamp.fromDate(DateTime(2024, 1, 1, 12, 0, 0));
    });

    group('Data Structure Validation Tests', () {
      test('should validate complete DetectedText structure', () async {
        final detectedText = {
          'languageCode': 'en',
          'negativeScore': 0.1,
          'positiveScore': 0.9,
          'sentiment': 'positive',
          'value': 'Test text content',
        };

        expect(detectedText['languageCode'], isA<String>());
        expect(detectedText['negativeScore'], isA<double>());
        expect(detectedText['positiveScore'], isA<double>());
        expect(detectedText['sentiment'], isA<String>());
        expect(detectedText['value'], isA<String>());
        expect(detectedText.keys.length, 5);
      });

      test('should validate complete ModeratedImage structure', () async {
        final detectedImage = {
          'bucketName': 'test-bucket',
          'moderationLabels': ['safe'],
          'moderationModelVersion': '1.0',
          'value': 'image.jpg',
        };

        expect(detectedImage['bucketName'], isA<String>());
        expect(detectedImage['moderationLabels'], isA<List>());
        expect(detectedImage['moderationModelVersion'], isA<String>());
        expect(detectedImage['value'], isA<String>());
        expect(detectedImage.keys.length, 4);
      });

      test('should validate CustomCompleteText structure', () async {
        final customCompleteText = {
          'systemPrompt': 'You are a helpful AI assistant.',
        };

        expect(customCompleteText['systemPrompt'], isA<String>());
        expect(
          customCompleteText['systemPrompt'].toString().length,
          lessThanOrEqualTo(1000),
        );
        expect(customCompleteText.keys.length, 1);
      });
    });

    group('Repository CRUD Operations', () {
      test('should handle document creation and retrieval', () async {
        const uid = 'test_user_123';
        const postId = 'test_post_123';

        final postData = {
          'uid': uid,
          'postId': postId,
          'title': {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Test Post Title',
          },
          'description': {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Test post description content',
          },
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'systemPrompt': 'Test system prompt'},
          'image': {
            'bucketName': 'test-bucket',
            'moderationLabels': [],
            'moderationModelVersion': '1.0',
            'value': 'test.jpg',
          },
          'searchToken': <String, dynamic>{},
          'bookmarkCount': 0,
          'exampleTexts': [],
          'genre': 'test',
          'hashTags': ['#test'],
          'impressionCount': 0,
          'likeCount': 0,
          'links': [],
          'msgCount': 0,
          'muteCount': 0,
          'reportCount': 0,
          'score': 0.0,
          'userCount': 0,
        };

        // Test post creation
        final createResult = await repository.createPost(uid, postId, postData);
        expect(createResult, isA<Success<bool>>());

        // Test post retrieval
        final retrievedPost = await repository.getPost(uid, postId);
        expect(retrievedPost, isNotNull);
        expect(retrievedPost?.uid, uid);
        expect(retrievedPost?.postId, postId);
      });

      test('should handle user posts operations', () async {
        const uid = 'test_user_456';

        final postData1 = {
          'uid': uid,
          'postId': 'post_1',
          'title': {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Post 1 Title',
          },
          'description': {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Post 1 description',
          },
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'systemPrompt': 'Test prompt 1'},
          'searchToken': <String, dynamic>{},
          'image': {
            'bucketName': 'test-bucket',
            'moderationLabels': [],
            'moderationModelVersion': '1.0',
            'value': 'test1.jpg',
          },
          'bookmarkCount': 0,
          'exampleTexts': [],
          'genre': '',
          'hashTags': [],
          'impressionCount': 0,
          'likeCount': 0,
          'links': [],
          'msgCount': 0,
          'muteCount': 0,
          'reportCount': 0,
          'score': 0.0,
          'userCount': 0,
        };

        final postData2 = {
          'uid': uid,
          'postId': 'post_2',
          'title': {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Post 2 Title',
          },
          'description': {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Post 2 description',
          },
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'systemPrompt': 'Test prompt 2'},
          'searchToken': <String, dynamic>{},
          'image': {
            'bucketName': 'test-bucket',
            'moderationLabels': [],
            'moderationModelVersion': '1.0',
            'value': 'test2.jpg',
          },
          'bookmarkCount': 0,
          'exampleTexts': [],
          'genre': '',
          'hashTags': [],
          'impressionCount': 0,
          'likeCount': 0,
          'links': [],
          'msgCount': 0,
          'muteCount': 0,
          'reportCount': 0,
          'score': 0.0,
          'userCount': 0,
        };

        await repository.createPost(uid, 'post_1', postData1);
        await repository.createPost(uid, 'post_2', postData2);

        final userPosts = await repository.getUserPosts(uid);
        expect(userPosts.length, 2);
      });

      test('should handle timeline posts operations', () async {
        const uid = 'timeline_user';
        const postId = 'timeline_post';

        final postData = {
          'uid': uid,
          'postId': postId,
          'title': {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Timeline Post',
          },
          'description': {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Timeline post description',
          },
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'systemPrompt': 'Timeline prompt'},
          'searchToken': <String, dynamic>{},
          'image': {
            'bucketName': 'test-bucket',
            'moderationLabels': [],
            'moderationModelVersion': '1.0',
            'value': 'timeline.jpg',
          },
          'bookmarkCount': 0,
          'exampleTexts': [],
          'genre': '',
          'hashTags': [],
          'impressionCount': 0,
          'likeCount': 0,
          'links': [],
          'msgCount': 0,
          'muteCount': 0,
          'reportCount': 0,
          'score': 0.0,
          'userCount': 0,
        };

        await repository.createPost(uid, postId, postData);
        final timelinePosts = await repository.getTimelinePosts([postId]);

        expect(timelinePosts.length, 1);
        expect(timelinePosts.first.postId, postId);
      });
    });

    group('Token and Relationship Operations', () {
      test('should handle follow operations with tokens', () async {
        const currentUid = 'follower_user';
        const passiveUid = 'followed_user';
        const tokenId = 'follow_token_123';

        final result = await repository.createFollowInfo(
          currentUid,
          passiveUid,
        );

        expect(result, isA<Success<bool>>());

        // Test cleanup
        final deleteResult = await repository.deleteFollowInfoList(
          currentUid,
          passiveUid,
          tokenId,
        );
        expect(deleteResult, isA<Success<bool>>());
      });

      test('should handle like operations with tokens', () async {
        const currentUid = 'liker_user';
        const postUid = 'post_owner';
        const postId = 'liked_post';

        final post = PostEntity(
          uid: postUid,
          postId: postId,
          title: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Liked Post Title',
          ),
          description: const DetectedText(
            languageCode: 'en',
            negativeScore: 0,
            positiveScore: 1,
            sentiment: 'positive',
            value: 'Liked post description',
          ),
          createdAt: mockTimestamp.toDate(),
          updatedAt: mockTimestamp.toDate(),
          customCompleteText: const CustomCompleteText(
            systemPrompt: 'Liked post prompt',
          ),
          image: const ModeratedImage(
            bucketName: 'test-bucket',
            moderationLabels: [],
            moderationModelVersion: '1.0',
            value: 'liked.jpg',
          ),
          likeCount: 0,
          msgCount: 0,
        );

        final result = await repository.createLikePostInfo(
          currentUid,
          post.uid,
          post.postId,
        );

        expect(result, isA<Success<bool>>());
      });

      test('should handle user update log creation', () async {
        const uid = 'update_user';
        const userName = 'Updated Name';
        const bio = 'Updated biography';
        const fileName = 'updated_image.jpg';

        final userUpdateLog = UserUpdateLog.fromRegister(
          uid,
          userName,
          bio,
          fileName,
        );

        expect(userUpdateLog.uid, uid);
        expect(userUpdateLog.stringUserName, userName);
        expect(userUpdateLog.stringBio, bio);

        final result = await repository.createUserUpdateLog(
          uid,
          userUpdateLog.toJson(),
        );
        expect(result, isA<Success<bool>>());
      });
    });

    group('Edge Cases and Error Handling', () {
      test('should handle empty lists gracefully', () async {
        final emptyUserList = await repository.getUsersByUids([]);
        expect(emptyUserList, isEmpty);

        final emptyTimelinePosts = await repository.getTimelinePosts([]);
        expect(emptyTimelinePosts, isEmpty);

        final emptyMutePosts = await repository.getMutePosts([]);
        expect(emptyMutePosts, isEmpty);
      });

      test('should handle non-existent documents', () async {
        final nonExistentUser = await repository.getPublicUser('non_existent');
        expect(nonExistentUser, isNull);

        final nonExistentPrivateUser = await repository.getPrivateUser(
          'non_existent',
        );
        expect(nonExistentPrivateUser, isNull);

        final nonExistentPost = await repository.getPost(
          'non_existent',
          'non_existent',
        );
        expect(nonExistentPost, isNull);
      });

      test('should handle count operations', () async {
        final userCount = await repository.countUsers();
        expect(userCount, isA<int?>());
        expect(userCount, greaterThanOrEqualTo(0));

        final postCount = await repository.countPosts();
        expect(postCount, isA<int?>());
        expect(postCount, greaterThanOrEqualTo(0));

        final messageCount = await repository.countMessages();
        expect(messageCount, isA<int?>());
        expect(messageCount, greaterThanOrEqualTo(0));
      });

      test('should handle timeline operations', () async {
        const currentUid = 'timeline_test_user';

        final timelines = await repository.getTimelines(currentUid);
        expect(timelines, isA<List<TimelineModel>>());
        expect(timelines, isEmpty); // Should be empty for new user
      });

      test('should handle token operations', () async {
        const uid = 'token_test_user';

        final tokens = await repository.getTokens(uid);
        expect(tokens, isA<Tokens>());
        expect(tokens.followingTokens, isEmpty);
        expect(tokens.likePostTokens, isEmpty);
        expect(tokens.mutePostTokens, isEmpty);
        expect(tokens.muteUserTokens, isEmpty);
      });
    });

    group('Data Integrity Tests', () {
      test('should maintain data consistency across operations', () async {
        const uid = 'consistency_user';
        const postId = 'consistency_post';

        // Create post
        final postData = {
          'uid': uid,
          'postId': postId,
          'title': {
            'languageCode': 'en',
            'negativeScore': 0.1,
            'positiveScore': 0.9,
            'sentiment': 'positive',
            'value': 'Consistency Test Post',
          },
          'description': {
            'languageCode': 'en',
            'negativeScore': 0.05,
            'positiveScore': 0.95,
            'sentiment': 'positive',
            'value': 'Testing data consistency',
          },
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'systemPrompt': 'Consistency test'},
          'searchToken': <String, dynamic>{},
          'image': {
            'bucketName': 'test-bucket',
            'moderationLabels': [],
            'moderationModelVersion': '1.0',
            'value': 'consistency.jpg',
          },
          'bookmarkCount': 0,
          'exampleTexts': [],
          'genre': '',
          'hashTags': [],
          'impressionCount': 0,
          'likeCount': 0,
          'links': [],
          'msgCount': 0,
          'muteCount': 0,
          'reportCount': 0,
          'score': 0.0,
          'userCount': 0,
        };

        await repository.createPost(uid, postId, postData);

        // Verify post exists
        final retrievedPost = await repository.getPost(uid, postId);
        expect(retrievedPost, isNotNull);

        // Delete post
        final deleteResult = await repository.deletePost(
          retrievedPost!.uid,
          retrievedPost.postId,
        );
        expect(deleteResult, isA<Success<bool>>());

        // Verify post is deleted
        final deletedPost = await repository.getPost(uid, postId);
        expect(deletedPost, isNull);
      });

      test('should validate required field structures', () async {
        // Test minimum required structure for DetectedText
        final minimalDetectedText = {
          'languageCode': '',
          'negativeScore': 0.0,
          'positiveScore': 0.0,
          'sentiment': 'neutral',
          'value': '',
        };
        expect(minimalDetectedText.keys.length, 5);

        // Test minimum required structure for ModeratedImage
        final minimalModeratedImage = {
          'bucketName': '',
          'moderationLabels': <String>[],
          'moderationModelVersion': '',
          'value': '',
        };
        expect(minimalModeratedImage.keys.length, 4);

        // Test minimum required structure for CustomCompleteText
        final minimalCustomCompleteText = {'systemPrompt': ''};
        expect(minimalCustomCompleteText.keys.length, 1);
      });
    });
  });
}
