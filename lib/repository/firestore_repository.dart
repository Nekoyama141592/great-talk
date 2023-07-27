import 'package:flutter/foundation.dart';
import 'package:great_talk/consts/debug_constants.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_firestore_client.dart';
import 'package:great_talk/repository/result.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreRepository {
  final client = isUseMockData ? MockFirestoreClient() : FirestoreClient();

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

  FutureResult<List<QDoc>> getMorePostsByLikeCount(Doc moreDoc) async {
    try {
      final res = await client.getMorePostsByLikeCount(moreDoc);
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

  FutureResult<List<QDoc>> getNewTimelinePosts(
      List<String> timelinePostIds, Doc newDoc) async {
    try {
      final res = await client.getNewTimelinePosts(timelinePostIds, newDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getMoreTimelinePosts(
      List<String> timelinePostIds, Doc moreDoc) async {
    try {
      final res = await client.getMoreTimelinePosts(timelinePostIds, moreDoc);
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

  FutureResult<List<QDoc>> getNewTimelines(DocRef userRef, Doc newDoc) async {
    try {
      final res = await client.getNewTimelines(userRef, newDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getMoreTimelines(DocRef userRef, Doc moreDoc) async {
    try {
      final res = await client.getMoreTimelines(userRef, moreDoc);
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

  FutureResult<List<QDoc>> getMoreUsersByFollowerCount(Doc moreDoc) async {
    try {
      final res = await client.getMoreUsersByFollowerCount(moreDoc);
      final docs = res.docs;
      return Result.success(docs);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }
}
