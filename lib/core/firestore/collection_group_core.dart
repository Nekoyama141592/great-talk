import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionGroupCore {
  static final _instance = FirebaseFirestore.instance;
  static final users = _instance.collectionGroup('users');
  static final posts = _instance.collectionGroup('posts');
  // 全部消す.
  static final messages = _instance.collectionGroup('messages');
}
