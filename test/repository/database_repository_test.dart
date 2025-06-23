import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/model/database_schema/user_update_log/user_update_log.dart';
import 'package:great_talk/repository/database_repository.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/timeline/timeline.dart';
import 'package:great_talk/model/database_schema/follower/follower.dart';
import 'package:great_talk/model/database_schema/post_like/post_like.dart';
import 'package:great_talk/model/database_schema/post_mute/post_mute.dart';
import 'package:great_talk/model/database_schema/user_mute/user_mute.dart';
import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/repository/result/result.dart';

void main() {
  group('DatabaseRepository Tests', () {
    late FakeFirebaseFirestore fakeFirestore;
    late DatabaseRepository repository;
    late Timestamp mockTimestamp;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      repository = DatabaseRepository(instance: fakeFirestore);
      mockTimestamp = Timestamp.fromDate(DateTime(2024, 1, 1, 12, 0, 0));
    });

    group('User Operations', () {
      test('should create public user successfully', () async {
        const uid = 'test_uid';
        final userData = {
          'uid': uid,
          'accountName': 'test_user',
          'bio': {'value': 'Test bio'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'image': {'value': 'test.jpg'},
          'userName': {'value': 'Test User'},
          'followerCount': 0,
          'followingCount': 0,
          'postCount': 0,
        };

        final result = await repository.createPublicUser(uid, userData);

        expect(result, isNotNull);
        expect(result?.uid, uid);
        expect(result?.accountName, 'test_user');
      });

      test('should create private user successfully', () async {
        const uid = 'test_uid';
        final userData = {
          'uid': uid,
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'isAdmin': false,
        };

        final result = await repository.createPrivateUser(uid, userData);

        expect(result, isNotNull);
        expect(result?.uid, uid);
      });

      test('should get public user by uid', () async {
        const uid = 'test_uid';
        final userData = {
          'uid': uid,
          'accountName': 'test_user',
          'bio': {'value': 'Test bio'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'image': {'value': 'test.jpg'},
          'userName': {'value': 'Test User'},
        };

        await repository.createPublicUser(uid, userData);
        final result = await repository.getPublicUser(uid);

        expect(result, isNotNull);
        expect(result?.uid, uid);
        expect(result?.accountName, 'test_user');
      });

      test('should get private user by uid', () async {
        const uid = 'test_uid';
        final userData = {
          'uid': uid,
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'isAdmin': false,
        };

        await repository.createPrivateUser(uid, userData);
        final result = await repository.getPrivateUser(uid);

        expect(result, isNotNull);
        expect(result?.uid, uid);
      });

      test('should delete public user successfully', () async {
        const uid = 'test_uid';
        final userData = {
          'uid': uid,
          'accountName': 'test_user',
          'bio': {'value': 'Test bio'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'image': {'value': 'test.jpg'},
          'userName': {'value': 'Test User'},
        };

        await repository.createPublicUser(uid, userData);
        final deleteResult = await repository.deletePublicUser(uid);

        expect(deleteResult, isA<Success<bool>>());

        // After deletion, getting the user should return null
        // Note: The repository handles the null case and returns null
        final getResult = await repository.getPublicUser(uid);
        expect(getResult, isNull);
      });

      test('should get users by UIDs', () async {
        const uid1 = 'uid1';
        const uid2 = 'uid2';
        final userData1 = {
          'uid': uid1,
          'accountName': 'user1',
          'bio': {'text': 'Bio 1'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'image': {'value': 'test1.jpg'},
          'userName': {'text': 'User 1'},
        };
        final userData2 = {
          'uid': uid2,
          'accountName': 'user2',
          'bio': {'text': 'Bio 2'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'image': {'value': 'test2.jpg'},
          'userName': {'text': 'User 2'},
        };

        await repository.createPublicUser(uid1, userData1);
        await repository.createPublicUser(uid2, userData2);

        final users = await repository.getUsersByUids([uid1, uid2]);

        expect(users.length, 2);
        expect(users.map((u) => u.uid), containsAll([uid1, uid2]));
      });

      test('should return empty list for getUsersByUids with empty input', () async {
        final users = await repository.getUsersByUids([]);
        expect(users, isEmpty);
      });
    });

    group('Post Operations', () {
      test('should create post successfully', () async {
        const uid = 'test_uid';
        const postId = 'test_post_id';
        final postData = {
          'uid': uid,
          'postId': postId,
          'title': {'value': 'Test Title'},
          'description': {'value': 'Test Description'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'value': 'Test'},
          'image': {'value': 'test.jpg'},
          'searchToken': {'tokens': []},
          'likeCount': 0,
          'msgCount': 0,
        };

        final result = await repository.createPost(uid, postId, postData);

        expect(result, isA<Success<bool>>());
      });

      test('should get post by uid and postId', () async {
        const uid = 'test_uid';
        const postId = 'test_post_id';
        final postData = {
          'uid': uid,
          'postId': postId,
          'title': {'value': 'Test Title'},
          'description': {'value': 'Test Description'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'systemPrompt': 'Test'},
          'image': {'value': 'test.jpg'},
          'searchToken': {'tokens': []},
        };

        await repository.createPost(uid, postId, postData);
        final result = await repository.getPost(uid, postId);

        expect(result, isNotNull);
        expect(result?.uid, uid);
        expect(result?.postId, postId);
      });

      test('should delete post successfully', () async {
        const uid = 'test_uid';
        const postId = 'test_post_id';
        final postData = {
          'uid': uid,
          'postId': postId,
          'title': {'value': 'Test Title'},
          'description': {'value': 'Test Description'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'systemPrompt': 'Test'},
          'image': {'value': 'test.jpg'},
          'searchToken': {'tokens': []},
        };

        await repository.createPost(uid, postId, postData);
        final post = Post.fromJson(postData);
        final deleteResult = await repository.deletePost(post);

        expect(deleteResult, isA<Success<bool>>());

        // After deletion, getting the post should return null
        // Note: The repository handles the null case and returns null
        final getResult = await repository.getPost(uid, postId);
        expect(getResult, isNull);
      });

      test('should get user posts', () async {
        const uid = 'test_uid';
        const postId1 = 'post1';
        const postId2 = 'post2';

        final postData1 = {
          'uid': uid,
          'postId': postId1,
          'title': {'value': 'Test Title 1'},
          'description': {'value': 'Test Description 1'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'value': 'Test 1'},
          'image': {'value': 'test1.jpg'},
          'searchToken': {'tokens': []},
        };
        final postData2 = {
          'uid': uid,
          'postId': postId2,
          'title': {'value': 'Test Title 2'},
          'description': {'value': 'Test Description 2'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'value': 'Test 2'},
          'image': {'value': 'test2.jpg'},
          'searchToken': {'tokens': []},
        };

        await repository.createPost(uid, postId1, postData1);
        await repository.createPost(uid, postId2, postData2);

        final posts = await repository.getUserPosts(uid);

        expect(posts.length, 2);
        expect(posts.map((p) => p.postId), containsAll([postId1, postId2]));
      });

      test('should get timeline posts', () async {
        const uid = 'test_uid';
        const postId = 'test_post_id';
        final postData = {
          'uid': uid,
          'postId': postId,
          'title': {'value': 'Test Title'},
          'description': {'value': 'Test Description'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'value': 'Test'},
          'image': {'value': 'test.jpg'},
          'searchToken': {'tokens': []},
        };

        await repository.createPost(uid, postId, postData);
        final posts = await repository.getTimelinePosts([postId]);

        expect(posts.length, 1);
        expect(posts.first.postId, postId);
      });

      test('should return empty list for getTimelinePosts with empty input', () async {
        final posts = await repository.getTimelinePosts([]);
        expect(posts, isEmpty);
      });
    });

    group('Follow Operations', () {
      test('should create follow info successfully', () async {
        const currentUid = 'current_uid';
        const passiveUid = 'passive_uid';
        const tokenId = 'token_id';

        final followingToken = FollowingToken(
          tokenId: tokenId,
          passiveUid: passiveUid,
          createdAt: mockTimestamp,
          tokenType: 'following',
        );

        final follower = Follower(
          activeUid: currentUid,
          createdAt: mockTimestamp,
          passiveUid: passiveUid,
        );

        final result = await repository.createFollowInfo(
          currentUid,
          passiveUid,
          followingToken,
          follower,
        );

        expect(result, isA<Success<bool>>());
      });

      test('should delete follow info successfully', () async {
        const currentUid = 'current_uid';
        const passiveUid = 'passive_uid';
        const tokenId = 'token_id';

        final followingToken = FollowingToken(
          tokenId: tokenId,
          passiveUid: passiveUid,
          createdAt: mockTimestamp,
          tokenType: 'following',
        );

        final follower = Follower(
          activeUid: currentUid,
          createdAt: mockTimestamp,
          passiveUid: passiveUid,
        );

        await repository.createFollowInfo(
          currentUid,
          passiveUid,
          followingToken,
          follower,
        );

        final deleteResult = await repository.deleteFollowInfoList(
          currentUid,
          passiveUid,
          tokenId,
        );

        expect(deleteResult, isA<Success<bool>>());
      });
    });

    group('Like Operations', () {
      test('should create like post info successfully', () async {
        const currentUid = 'current_uid';
        const uid = 'post_uid';
        const postId = 'post_id';
        const tokenId = 'token_id';

        final post = Post(
          uid: uid,
          postId: postId,
          title: const {'value': 'Test Title'},
          description: const {'value': 'Test Description'},
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {'systemPrompt': 'Test'},
          image: const {'value': 'test.jpg'},
          searchToken: const {'tokens': []},
        );

        final token = LikePostToken(
          tokenId: tokenId,
          activeUid: currentUid,
          passiveUid: uid,
          postId: postId,
          createdAt: mockTimestamp,
          tokenType: 'likePost',
        );

        final postLike = PostLike(
          activeUid: currentUid,
          createdAt: mockTimestamp,
          passiveUid: uid,
          postId: postId,
        );

        final result = await repository.createLikePostInfo(
          currentUid,
          post,
          token,
          postLike,
        );

        expect(result, isA<Success<bool>>());
      });

      test('should delete like post info successfully', () async {
        const currentUid = 'current_uid';
        const uid = 'post_uid';
        const postId = 'post_id';
        const tokenId = 'token_id';

        final post = Post(
          uid: uid,
          postId: postId,
          title: const {'value': 'Test Title'},
          description: const {'value': 'Test Description'},
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {'value': 'Test'},
          image: const {'value': 'test.jpg'},
          searchToken: const {'tokens': []},
        );

        final token = LikePostToken(
          tokenId: tokenId,
          activeUid: currentUid,
          passiveUid: uid,
          postId: postId,
          createdAt: mockTimestamp,
          tokenType: 'likePost',
        );

        final postLike = PostLike(
          activeUid: currentUid,
          createdAt: mockTimestamp,
          passiveUid: uid,
          postId: postId,
        );

        await repository.createLikePostInfo(currentUid, post, token, postLike);

        final deleteResult = await repository.deleteLikePostInfo(
          currentUid,
          post,
          tokenId,
        );

        expect(deleteResult, isA<Success<bool>>());
      });
    });

    group('Mute Operations', () {
      test('should create mute user info successfully', () async {
        const currentUid = 'current_uid';
        const passiveUid = 'passive_uid';
        const tokenId = 'token_id';

        final token = MuteUserToken(
          tokenId: tokenId,
          activeUid: currentUid,
          passiveUid: passiveUid,
          createdAt: mockTimestamp,
          tokenType: 'muteUser',
        );

        final userMute = UserMute(
          activeUid: currentUid,
          createdAt: mockTimestamp,
          passiveUid: passiveUid,
        );

        final result = await repository.createMuteUserInfo(
          currentUid,
          passiveUid,
          token,
          userMute,
        );

        expect(result, isA<Success<bool>>());
      });

      test('should delete mute user info successfully', () async {
        const currentUid = 'current_uid';
        const passiveUid = 'passive_uid';
        const tokenId = 'token_id';

        final token = MuteUserToken(
          tokenId: tokenId,
          activeUid: currentUid,
          passiveUid: passiveUid,
          createdAt: mockTimestamp,
          tokenType: 'muteUser',
        );

        final userMute = UserMute(
          activeUid: currentUid,
          createdAt: mockTimestamp,
          passiveUid: passiveUid,
        );

        await repository.createMuteUserInfo(currentUid, passiveUid, token, userMute);

        final deleteResult = await repository.deleteMuteUserInfo(
          currentUid,
          passiveUid,
          tokenId,
        );

        expect(deleteResult, isA<Success<bool>>());
      });

      test('should create mute post info successfully', () async {
        const currentUid = 'current_uid';
        const tokenId = 'token_id';

        final post = Post(
          uid: 'post_uid',
          postId: 'post_id',
          title: const {'value': 'Test Title'},
          description: const {'value': 'Test Description'},
          createdAt: mockTimestamp,
          updatedAt: mockTimestamp,
          customCompleteText: const {'value': 'Test'},
          image: const {'value': 'test.jpg'},
          searchToken: const {'tokens': []},
        );

        final token = MutePostToken(
          tokenId: tokenId,
          activeUid: currentUid,
          postId: post.postId,
          createdAt: mockTimestamp,
          tokenType: 'mutePost',
        );

        final postMute = PostMute(
          activeUid: currentUid,
          createdAt: mockTimestamp,
          postId: post.postId,
        );

        final result = await repository.createMutePostInfo(
          currentUid,
          post,
          token,
          postMute,
        );

        expect(result, isA<Success<bool>>());
      });

      test('should get mute posts', () async {
        const uid = 'test_uid';
        const postId = 'test_post_id';
        final postData = {
          'uid': uid,
          'postId': postId,
          'title': {'value': 'Test Title'},
          'description': {'value': 'Test Description'},
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'customCompleteText': {'value': 'Test'},
          'image': {'value': 'test.jpg'},
          'searchToken': {'tokens': []},
        };

        await repository.createPost(uid, postId, postData);
        final posts = await repository.getMutePosts([postId]);

        expect(posts.length, 1);
        expect(posts.first.postId, postId);
      });

      test('should return empty list for getMutePosts with empty input', () async {
        final posts = await repository.getMutePosts([]);
        expect(posts, isEmpty);
      });
    });

    group('Token Operations', () {
      test('should get tokens for user', () async {
        const uid = 'test_uid';
        final privateUserData = {
          'uid': uid,
          'accessToken': 'test_token',
          'createdAt': mockTimestamp,
          'updatedAt': mockTimestamp,
          'isAdmin': false,
        };

        await repository.createPrivateUser(uid, privateUserData);

        final tokens = await repository.getTokens(uid);
        expect(tokens, isA<List<Map<String, dynamic>>>());
      });
    });

    group('Timeline Operations', () {
      test('should get timelines for user', () async {
        const currentUid = 'current_uid';

        final timelines = await repository.getTimelines(currentUid);
        expect(timelines, isA<List<Timeline>>());
      });
    });

    group('Count Operations', () {
      test('should count users', () async {
        final count = await repository.countUsers();
        expect(count, isA<int?>());
      });

      test('should count posts', () async {
        final count = await repository.countPosts();
        expect(count, isA<int?>());
      });

      test('should count messages', () async {
        final count = await repository.countMessages();
        expect(count, isA<int?>());
      });
    });

    group('User Update Log Operations', () {
      test('should create user update log', () async {
        const uid = 'test_uid';
        const userName = 'test user';
        const bio = 'test bio';
        const fileName = 'test.jpg';
        final userUpdateLog = UserUpdateLog.fromRegister(
          uid,
          userName,
          bio,
          fileName,
        );

        // Firestoreに保存
        final result = await repository.createUserUpdateLog(uid, userUpdateLog.toJson());
        expect(result, isA<Success<bool>>());
      });
    });

    group('Edge Cases and Error Handling', () {
      test('should handle non-existent user gracefully in getPublicUser', () async {
        const uid = 'non_existent_uid';
        // Repository should return null for non-existent documents
        final result = await repository.getPublicUser(uid);
        expect(result, isNull);
      });

      test('should handle non-existent user gracefully in getPrivateUser', () async {
        const uid = 'non_existent_uid';
        // Repository should return null for non-existent documents
        final result = await repository.getPrivateUser(uid);
        expect(result, isNull);
      });

      test('should handle non-existent post gracefully in getPost', () async {
        const uid = 'non_existent_uid';
        const postId = 'non_existent_post_id';
        // Repository should return null for non-existent documents
        final result = await repository.getPost(uid, postId);
        expect(result, isNull);
      });
    });
  });
}