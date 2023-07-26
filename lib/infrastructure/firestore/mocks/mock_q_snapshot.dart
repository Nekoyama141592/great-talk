import 'package:cloud_firestore/cloud_firestore.dart';

class MockQSnapshot extends QuerySnapshot<Map<String, dynamic>> {
  MockQSnapshot(this.mockDocs);
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> mockDocs;
  @override
  List<DocumentChange<Map<String, dynamic>>> get docChanges =>
      throw UnimplementedError();
  @override
  List<QueryDocumentSnapshot<Map<String, dynamic>>> get docs => mockDocs;
  @override
  SnapshotMetadata get metadata => throw UnimplementedError();
  @override
  int get size => throw UnimplementedError();
}
