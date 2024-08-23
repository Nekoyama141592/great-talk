import 'package:great_talk/core/firestore/collection_group_core.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreClient {
  // count
  Future<int> countUsers() async {
    final snapshot = await CollectionGroupCore.users.count().get();
    return snapshot.count ?? 0;
  }

  Future<int> countPosts() async {
    final snapshot = await CollectionGroupCore.posts.count().get();
    return snapshot.count ?? 0;
  }

  Future<int> countMessages() async {
    final snapshot = await CollectionGroupCore.messages.count().get();
    return snapshot.count ?? 0;
  }

  Future<int> countSearchLogs() async {
    final snapshot = await CollectionGroupCore.searchLogs.count().get();
    return snapshot.count ?? 0;
  }

  Future<void> createDoc(DocRef ref, SDMap json) async => await ref.set(json);
  Future<void> updateDoc(DocRef ref, SDMap json) async =>
      await ref.update(json);
  Future<void> deleteDoc(DocRef ref) async => await ref.delete();
  FutureDoc getDoc(DocRef ref) async => await ref.get();
  FutureQSnapshot getDocs(MapQuery query) async => await query.get();
}
