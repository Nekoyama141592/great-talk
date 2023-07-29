import 'package:cloud_firestore/cloud_firestore.dart';

typedef SDMap = Map<String, dynamic>;
typedef QSnapshot = QuerySnapshot<SDMap>;
typedef QDoc = QueryDocumentSnapshot<SDMap>;
typedef Doc = DocumentSnapshot<SDMap>;

typedef FutureQSnapshot = Future<QSnapshot>;
typedef FutureDoc = Future<Doc>;

typedef DocRef = DocumentReference<SDMap>;
typedef ColRef = CollectionReference<SDMap>;

typedef MapQuery = Query<SDMap>;
