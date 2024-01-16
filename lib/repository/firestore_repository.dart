import 'package:flutter/foundation.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/repository/result.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreRepository {
  final client = FirestoreClient();
  // count
  FutureResult<int> countUsers() async {
    try {
      final count = await client.countUsers();
      return Result.success(count);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<int> countPosts() async {
    try {
      final count = await client.countPosts();
      return Result.success(count);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<int> countMessages() async {
    try {
      final count = await client.countMessages();
      return Result.success(count);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<int> countSearchLogs() async {
    try {
      final count = await client.countSearchLogs();
      return Result.success(count);
    } catch (e) {
      return const Result.failure();
    }
  }

  // write
  FutureResult<bool> createDoc(DocRef ref, SDMap json) async {
    try {
      await client.createDoc(ref, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> updateDoc(DocRef ref, SDMap json) async {
    try {
      await client.updateDoc(ref, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deleteDoc(DocRef ref) async {
    try {
      await client.deleteDoc(ref);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createMessage(DocRef messageRef, SDMap json) async {
    try {
      await client.createMessage(messageRef, json);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> createPost(DocRef postRef, SDMap json) async {
    try {
      await client.createPost(postRef, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deletePost(DocRef postRef) async {
    try {
      await client.deletePost(postRef);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createPostLike(
      DocRef postRef, String activeUid, SDMap json) async {
    try {
      await client.createPostLike(postRef, activeUid, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deletePostLike(DocRef postRef, String activeUid) async {
    try {
      await client.deletePostLike(postRef, activeUid);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createUser(String uid, SDMap json) async {
    try {
      await client.createUser(uid, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createPrivateUser(String uid, SDMap json) async {
    try {
      await client.createPrivateUser(uid, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createSearchLog(String uid, SDMap json) async {
    try {
      await client.createSearchLog(uid, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createUserUpdateLog(String uid, SDMap json) async {
    try {
      await client.createUserUpdateLog(uid, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
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

  FutureResult<bool> createPostReport(
      DocRef postRef, String currentUid, SDMap json) async {
    try {
      await client.createPostReport(postRef, currentUid, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createPostMute(
      DocRef postRef, String activeUid, SDMap json) async {
    try {
      await client.createPostMute(postRef, activeUid, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deletePostMute(DocRef postRef, String activeUid) async {
    try {
      await client.deletePostMute(postRef, activeUid);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deleteUser(String uid) async {
    try {
      await client.deleteUser(uid);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createUserMute(
      String uid, String activeUid, SDMap json) async {
    try {
      await client.createUserMute(uid, activeUid, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deleteUserMute(String uid, String activeUid) async {
    try {
      await client.deleteUserMute(uid, activeUid);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  // read

  FutureResult<Doc> getBookmark(DocRef ref) async {
    try {
      final res = await client.getBookmark(ref);
      return Result.success(res);
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

  FutureResult<List<QDoc>> getTimelinePosts(
      List<String> timelinePostIds) async {
    try {
      if (timelinePostIds.isEmpty) {
        return const Result.success([]);
      }
      final res = await client.getTimelinePosts(timelinePostIds);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getPosts(MapQuery query) async {
    try {
      final res = await client.getPosts(query);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getTokens(String currentUid) async {
    try {
      final res = await client.getTokens(currentUid);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<Doc> getPublicUser(String uid) async {
    try {
      final res = await client.getPublicUser(uid);
      return res.exists ? Result.success(res) : const Result.failure();
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<Doc> getPrivateUser(String uid) async {
    try {
      final res = await client.getPrivateUser(uid);
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
}
