import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_data.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_doc.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_snapshot.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class MockFirestoreClient implements FirestoreClient {
  @override
  FutureQSnapshot getUsers() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> mockUsers =
        mockOriginalUsers.map((e) => MockQDoc(e.toJson())).toList();
    return MockQSnapshot(mockUsers);
  }
}
