import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreClient {
  FutureQSnapshot getUsers() async {
    final users = await FirebaseFirestore.instance.collection('users').get();
    return users;
  }

  FutureQSnapshot getUsersByFollowerCount() async {
    final users = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('followerCount', descending: true)
        .get();
    return users;
  }

  FutureQSnapshot getPosts() async {
    final res = await FirebaseFirestore.instance.collectionGroup('posts').get();
    return res;
  }

  FutureQSnapshot getPostsgetUsersByLikeCount() async {
    final res = await FirebaseFirestore.instance
        .collectionGroup('posts')
        .orderBy('likeCount', descending: true)
        .get();
    return res;
  }
}
