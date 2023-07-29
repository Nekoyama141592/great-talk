import 'package:great_talk/common/strings.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_data.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_doc.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_snapshot.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class MockFirestoreClient implements FirestoreClient {
  @override
  Future<void> createUser(String uid, SDMap json) async {
    return;
  }

  @override
  Future<void> createFollower(
      String currentUid, String passiveUid, SDMap json) async {
    return;
  }

  @override
  Future<void> deleteFollower(String currentUid, String passiveUid) async {
    return;
  }

  @override
  Future<void> createToken(
      String currentUid, String tokenId, SDMap json) async {
    return;
  }

  @override
  Future<void> deleteToken(String currentUid, String tokenId) async {
    return;
  }

  @override
  FutureQSnapshot getPostsByLikeCount() async {
    final posts = [...mockPosts];
    posts.sort((a, b) => b.likeCount.compareTo(a.likeCount));
    final data = posts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getMorePostsByLikeCount(Doc lastDoc) => getPostsByLikeCount();
  @override
  FutureQSnapshot getPostsByFollowing(List<String> followingUids) async {
    final posts = [...mockPosts];
    posts.sort((a, b) => b.typedCreatedAt().compareTo(a.typedCreatedAt()));
    final data = posts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getNewPostsByFollowing(
          List<String> followingUids, Doc firstDoc) =>
      getPostsByFollowing(followingUids);
  @override
  FutureQSnapshot getMorePostsByFollowing(
          List<String> followingUids, Doc lastDoc) =>
      getPostsByFollowing(followingUids);

  @override
  FutureQSnapshot getTimelines(DocRef userRef) async {
    final timelines = mockTimelines();
    final data =
        timelines.map((e) => MockQDoc(e.toJson(), randomString())).toList();
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
    final data = posts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getUsersByFollowerCount() async {
    final users = [...mockOriginalUsers];
    users.sort((a, b) => b.followerCount.compareTo(a.followingCount));
    final data = users.map((e) => MockQDoc(e.toJson(), e.uid)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getMoreUsersByFollowerCount(Doc lastDoc) =>
      getUsersByFollowerCount();

  @override
  FutureQSnapshot getMoreUserPostsByNewest(String uid, Doc lastDoc) =>
      getUserPostsByNewest(uid);
  @override
  FutureQSnapshot getNewUserPostsByNewest(String uid, Doc firstDoc) =>
      getUserPostsByNewest(uid);
  @override
  FutureQSnapshot getUserPostsByNewest(String uid) async {
    final posts = [...mockPosts]
        .where((e) => FirestoreUser.fromJson(e.poster).uid == uid)
        .toList();
    final data = posts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }
}
