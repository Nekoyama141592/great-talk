import 'package:flutter/foundation.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/consts/debug_constants.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_firestore_client.dart';
import 'package:great_talk/repository/result.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreRepository {
  final client = isUseMockData ? MockFirestoreClient() : FirestoreClient();

  FutureResult<bool> createPost(DocRef postRef, SDMap json) async {
    try {
      await client.createPost(postRef, json);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> createPostLike(
      DocRef postRef, String tokenId, SDMap json) async {
    try {
      await client.createPostLike(postRef, tokenId, json);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> createUser(String uid, SDMap json) async {
    try {
      await client.createUser(uid, json);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> createUserUpdateLog(String uid, SDMap json) async {
    try {
      await client.createUserUpdateLog(uid, json);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> createFollower(
      String currentUid, String passiveUid, SDMap json) async {
    try {
      await client.createFollower(currentUid, passiveUid, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deleteFollower(
      String currentUid, String passiveUid) async {
    try {
      await client.deleteFollower(currentUid, passiveUid);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createToken(
      String currentUid, String tokenId, SDMap json) async {
    try {
      await client.createToken(currentUid, tokenId, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deleteToken(String currentUid, String tokenId) async {
    try {
      await client.deleteToken(currentUid, tokenId);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createPostReport(DocRef postRef, SDMap json) async {
    try {
      await client.createPostReport(postRef, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createPostMute(DocRef postRef, SDMap json) async {
    try {
      await client.createPostMute(postRef, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createUserMute(String uid, SDMap json) async {
    try {
      await client.createUserMute(uid, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<Doc> getPost(String uid, String postId) async {
    try {
      final res = await client.getPost(uid, postId);
      return Result.success(res);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getPostsByLikeCount() async {
    try {
      final res = await client.getPostsByLikeCount();
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getMorePostsByLikeCount(Doc lastDoc) async {
    try {
      final res = await client.getMorePostsByLikeCount(lastDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getPostsByFollowing(
      List<String> followingUids) async {
    try {
      final res = await client.getPostsByFollowing(followingUids);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getNewPostsByFollowing(
      List<String> followingUids, Doc firstDoc) async {
    try {
      final res = await client.getNewPostsByFollowing(followingUids, firstDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getMorePostsByFollowing(
      List<String> followingUids, Doc lastDoc) async {
    try {
      final res = await client.getMorePostsByFollowing(followingUids, lastDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getTimelinePosts(
      List<String> timelinePostIds) async {
    try {
      final res = await client.getTimelinePosts(timelinePostIds);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getTimelines(DocRef userRef) async {
    try {
      final res = await client.getTimelines(userRef);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getNewTimelines(DocRef userRef, Doc firstDoc) async {
    try {
      final res = await client.getNewTimelines(userRef, firstDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getMoreTimelines(DocRef userRef, Doc lastDoc) async {
    try {
      final res = await client.getMoreTimelines(userRef, lastDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<Doc> getUser(String uid) async {
    try {
      final res = await client.getUser(uid);
      return Result.success(res);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<Doc> getCurrentUser(String uid) async {
    try {
      final res = await client.getCurrentUser(uid);
      return Result.success(res);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getUsersByWhereIn(List<String> uids) async {
    try {
      final res = await client.getUsersByWhereIn(uids);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getMoreUsersByWhereIn(
      List<String> uids, Doc lastDoc) async {
    try {
      final res = await client.getMoreUsersByWhereIn(uids, lastDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getNewUsersByWhereIn(
      List<String> uids, Doc firstDoc) async {
    try {
      final res = await client.getNewUsersByWhereIn(uids, firstDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getUsersByFollowerCount() async {
    try {
      final res = await client.getUsersByFollowerCount();
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getMoreUsersByFollowerCount(Doc lastDoc) async {
    try {
      final res = await client.getMoreUsersByFollowerCount(lastDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getUserPostsByNewest(String uid) async {
    try {
      final res = await client.getUserPostsByNewest(uid);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getMoreUserPostsByNewest(
      String uid, Doc lastDoc) async {
    try {
      final res = await client.getMoreUserPostsByNewest(uid, lastDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getNewUserPostsByNewest(
      String uid, Doc firstDoc) async {
    try {
      final res = await client.getNewUserPostsByNewest(uid, firstDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> searchUsers(String searchTerm) async {
    try {
      if (searchTerm.length < nGramIndex) {
        return const Result.success([]);
      } else {
        final res = await client.searchUsers(searchTerm);
        final docs = res.docs;
        return Result.success(docs);
      }
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> searchMoreUsers(
      String searchTerm, Doc lastDoc) async {
    try {
      if (searchTerm.length < nGramIndex) {
        return const Result.success([]);
      } else {
        final res = await client.searchMoreUsers(searchTerm, lastDoc);
        final docs = res.docs;
        return Result.success(docs);
      }
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> searchUserPosts(
      String uid, String searchTerm) async {
    try {
      if (searchTerm.length < nGramIndex) {
        return const Result.success([]);
      } else {
        final res = await client.searchUserPosts(uid, searchTerm);
        final docs = res.docs;
        return Result.success(docs);
      }
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> searchMoreUserPosts(
      String uid, String searchTerm, Doc lastDoc) async {
    try {
      if (searchTerm.length < nGramIndex) {
        return const Result.success([]);
      } else {
        final res = await client.searchMoreUserPosts(uid, searchTerm, lastDoc);
        final docs = res.docs;
        return Result.success(docs);
      }
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }
}
