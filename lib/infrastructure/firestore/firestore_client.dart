import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreClient {

  FutureQSnapshot getUsers() async => await FirebaseFirestore.instance.collection('users').get();

  FutureQSnapshot getUsersByFollowerCount() async => await FirebaseFirestore.instance
        .collection('users')
        .orderBy('followerCount', descending: true)
        .get();

  FutureQSnapshot getPosts() async => await FirebaseFirestore.instance.collectionGroup('posts').get();

  FutureQSnapshot getPostsgetUsersByLikeCount() async => await FirebaseFirestore.instance
        .collectionGroup('posts')
        .orderBy('likeCount', descending: true)
        .get();
}
