import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:great_talk/core/firestore/collection_group_core.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_repository.g.dart';

@riverpod
FirestoreRepository firestoreRepository(Ref ref) => FirestoreRepository();

class FirestoreRepository {
  FirestoreClient get client => FirestoreClient();
  // count
  Future<int?> countUsers() async {
    try {
      final query = CollectionGroupCore.users;
      final count = await client.count(query);
      return count;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> countPosts() async {
    try {
      final query = CollectionGroupCore.posts;
      final count = await client.count(query);
      return count;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> countMessages() async {
    try {
      final query = CollectionGroupCore.messages;
      final count = await client.count(query);
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

  FutureResult<bool> createDocs(List<FirestoreRequest> requestList) async {
    try {
      final batch = FirebaseFirestore.instance.batch();
      for (final request in requestList) {
        batch.set(request.docRef, request.data);
      }
      await batch.commit();
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(e);
    }
  }

  FutureResult<bool> deleteDocs(List<DocRef> docRefList) async {
    try {
      final batch = FirebaseFirestore.instance.batch();
      for (final docRef in docRefList) {
        batch.delete(docRef);
      }
      await batch.commit();
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

  Future<List<QDoc>?> getDocsOrNull(MapQuery query) async {
    final client = FirestoreClient();
    try {
      final qSnapshot = await client.getDocs(query);
      final qDocs = qSnapshot.docs;
      return qDocs;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<QDoc>> getDocsWithList(MapQuery query) async {
    final client = FirestoreClient();
    try {
      final qSnapshot = await client.getDocs(query);
      final qDocs = qSnapshot.docs;
      return qDocs;
    } catch (e) {
      return [];
    }
  }
}

class FirestoreRequest {
  FirestoreRequest(this.docRef, this.data);
  final DocRef docRef;
  final Map<String, dynamic> data;
}
