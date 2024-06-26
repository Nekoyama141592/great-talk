import 'package:cloud_firestore/cloud_firestore.dart';

class MockQDoc implements QueryDocumentSnapshot<Map<String, dynamic>> {
  MockQDoc(this._data, this._id);
  final Map<String, dynamic> _data;
  final String _id;
  @override
  get(Object field) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> data() => _data;
  @override
  // TODO: implement exists
  bool get exists => throw UnimplementedError();
  @override
  String get id => _id;
  @override
  // TODO: implement metadata
  SnapshotMetadata get metadata => throw UnimplementedError();
  @override
  // TODO: implement reference
  DocumentReference<Map<String, dynamic>> get reference =>
      throw UnimplementedError();

  /// {@macro firestore.documentsnapshot.get}
  @override
  dynamic operator [](Object field) => _data[field];
}
