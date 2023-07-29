import 'package:flutter/foundation.dart';
import 'package:great_talk/consts/debug_constants.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_firestore_client.dart';
import 'package:great_talk/repository/result.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreRepository {
  final client = isUseMockData ? MockFirestoreClient() : FirestoreClient();

  FutureResult<bool> createUser(String uid) async {
    try {
      await client.createUser(uid);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> createFollower(
      String currentUid, String passiveUid, SDMap json) async {
    try {
      await FirestoreQueries.followerQuery(currentUid, passiveUid).set(json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deleteFollower(
      String currentUid, String passiveUid) async {
    try {
      await FirestoreQueries.followerQuery(currentUid, passiveUid).delete();
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> createToken(
      String currentUid, String tokenId, SDMap json) async {
    try {
      await FirestoreQueries.tokenQuery(currentUid, tokenId).set(json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<bool> deleteToken(String currentUid, String tokenId) async {
    try {
      await FirestoreQueries.tokenQuery(currentUid, tokenId).delete();
      return const Result.success(true);
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
}
