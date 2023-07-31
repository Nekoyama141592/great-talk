import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/strings.dart';

class MockDoc implements DocumentSnapshot<Map<String, dynamic>> {
  MockDoc(this._data, this._id);
  final String _id;
  final Map<String, dynamic> _data;
  @override
  get(Object field) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> data() => _data;
  @override
  // TODO: implement exists
  bool get exists => true;
  @override
  String get id => _id;
  @override
  // TODO: implement metadata
  SnapshotMetadata get metadata => throw UnimplementedError();
  @override
  // TODO: implement reference
  DocumentReference<Map<String, dynamic>> get reference =>
      throw UnimplementedError();
  @override
  dynamic operator [](Object field) => _data[field];
}
