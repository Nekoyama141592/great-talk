import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_data.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_doc.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_snapshot.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class MockFirestoreClient implements FirestoreClient {
  @override
  FutureQSnapshot getUsers() async {
    final data = mockOriginalUsers.map((e) => MockQDoc(e.toJson())).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getUsersByFollowerCount() async {
    final users = [...mockOriginalUsers];
    users.sort((a, b) => b.followerCount.compareTo(a.followingCount));
    final data = users.map((e) => MockQDoc(e.toJson())).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getPosts() async {
    final data = mockPosts.map((e) => MockQDoc(e.toJson())).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getPostsgetUsersByLikeCount() async {
    final posts = [...mockPosts];
    posts.sort((a, b) => b.likeCount.compareTo(a.likeCount));
    final data = posts.map((e) => MockQDoc(e.toJson())).toList();
    return MockQSnapshot(data);
  }
}
