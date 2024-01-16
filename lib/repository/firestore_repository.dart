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
  FutureResult<Doc> getDoc(DocRef ref) async {
    final client = FirestoreClient();
    try {
      final Doc doc = await client.getDoc(ref);
      return Result.success(doc);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<List<QDoc>> getDocs(MapQuery query) async {
    final client = FirestoreClient();
    try {
      final qSnapshot = await client.getDocs(query);
      final qDocs = qSnapshot.docs;
      return Result.success(qDocs);
    } catch (e) {
      return const Result.failure();
    }
  }
}
