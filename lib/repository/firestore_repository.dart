import 'package:flutter/foundation.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreRepository {
  FirestoreClient get client => FirestoreClient();
  // count
  Future<int?> countUsers() async {
    try {
      final count = await client.countUsers();
      return count;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> countPosts() async {
    try {
      final count = await client.countPosts();
      return count;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> countMessages() async {
    try {
      final count = await client.countMessages();
      return count;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> countSearchLogs() async {
    try {
      final count = await client.countSearchLogs();
      return count;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // write
  FutureResult<bool> createDoc(DocRef ref, SDMap json) async {
    try {
      await client.createDoc(ref, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(e);
    }
  }

  FutureResult<bool> updateDoc(DocRef ref, SDMap json) async {
    try {
      await client.updateDoc(ref, json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(e);
    }
  }

  FutureResult<bool> deleteDoc(DocRef ref) async {
    try {
      await client.deleteDoc(ref);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(e);
    }
  }

  FutureResult<Doc> getDoc(DocRef ref) async {
    final client = FirestoreClient();
    try {
      final Doc doc = await client.getDoc(ref);
      return Result.success(doc);
    } catch (e) {
      return Result.failure(e);
    }
  }

  FutureResult<List<QDoc>> getDocs(MapQuery query) async {
    final client = FirestoreClient();
    try {
      final qSnapshot = await client.getDocs(query);
      final qDocs = qSnapshot.docs;
      return Result.success(qDocs);
    } catch (e) {
      return Result.failure(e);
    }
  }
}
