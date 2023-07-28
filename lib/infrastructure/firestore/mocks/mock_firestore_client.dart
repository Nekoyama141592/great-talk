import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_data.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_doc.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_snapshot.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class MockFirestoreClient implements FirestoreClient {
  @override
  FutureQSnapshot getPostsByLikeCount() async {
    final posts = [...mockPosts];
    posts.sort((a, b) => b.likeCount.compareTo(a.likeCount));
    final data = posts.map((e) => MockQDoc(e.toJson())).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getMorePostsByLikeCount(Doc lastDoc) => getPostsByLikeCount();

  @override
  FutureQSnapshot getTimelines(DocRef userRef) async {
    final timelines = mockTimelines();
    final data = timelines.map((e) => MockQDoc(e.toJson())).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getNewTimelines(DocRef userRef, Doc firstDoc) =>
      getTimelines(userRef);
  @override
  FutureQSnapshot getMoreTimelines(DocRef userRef, Doc lastDoc) =>
      getTimelines(userRef);

  @override
  FutureQSnapshot getTimelinePosts(List<String> timelinePostIds) async {
    final posts = [...mockPosts];
    final data = posts.map((e) => MockQDoc(e.toJson())).toList();
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
  FutureQSnapshot getMoreUsersByFollowerCount(Doc lastDoc) =>
      getUsersByFollowerCount();
}
