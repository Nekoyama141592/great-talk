import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/common/strings.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_doc.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_snapshot.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class MockFirestoreClient implements FirestoreClient {
  @override
  FutureQSnapshot getUsers() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> mockUsers = [
      MockQDoc({
        "userName": "Alice",
        "uid": randomString(),
      }),
      MockQDoc({
        "userName": "Bob",
        "uid": randomString(),
      }),
      MockQDoc({
        "userName": "Carol",
        "uid": randomString(),
      }),
    ];
    return MockQSnapshot(mockUsers);
  }
}
