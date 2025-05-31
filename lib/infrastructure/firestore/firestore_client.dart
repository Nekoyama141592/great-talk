import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreClient {
  Future<int> count(MapQuery query) async {
    final snapshot = await query.count().get();
    return snapshot.count ?? 0;
  }

  Future<void> createDoc(DocRef ref, Map<String, dynamic> json) async =>
      await ref.set(json);
  Future<void> updateDoc(DocRef ref, Map<String, dynamic> json) async =>
      await ref.update(json);
  Future<void> deleteDoc(DocRef ref) async => await ref.delete();
  FutureDoc getDoc(DocRef ref) async => await ref.get();
  FutureQSnapshot getDocs(MapQuery query) async => await query.get();
}
