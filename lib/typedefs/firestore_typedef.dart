import 'package:cloud_firestore/cloud_firestore.dart';

typedef QSnapshot = QuerySnapshot<Map<String, dynamic>>;
typedef QDoc = QueryDocumentSnapshot<Map<String, dynamic>>;
typedef Doc = DocumentSnapshot<Map<String, dynamic>>;

typedef FutureQSnapshot = Future<QSnapshot>;
typedef FutureDoc = Future<Doc>;
