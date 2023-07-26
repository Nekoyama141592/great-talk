import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreClient {
  FutureQSnapshot getUsers() async {
    final users = await FirebaseFirestore.instance.collection('users').get();
    return users;
  }
}
