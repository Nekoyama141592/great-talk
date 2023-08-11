import 'package:great_talk/common/strings.dart';
import 'package:great_talk/consts/debug_constants.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_data.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_doc.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_doc.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_snapshot.dart';
import 'package:great_talk/model/public_user/public_user.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class MockFirestoreClient implements FirestoreClient {
  @override
  Future<void> createMessage(DocRef messageRef, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> createPost(DocRef postRef, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> createPostLike(
      DocRef postRef, String tokenId, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> deletePostLike(DocRef postRef, String activeUid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> createUser(String uid, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> createPrivateUser(String uid, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> createUserUpdateLog(String uid, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> createFollower(
      String currentUid, String passiveUid, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> deleteFollower(String currentUid, String passiveUid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> createToken(
      String currentUid, String tokenId, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> deleteToken(String currentUid, String tokenId) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> createPostReport(DocRef postRef, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> createPostMute(
      DocRef postRef, String activeUid, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> deletePostMute(DocRef postRef, String activeUid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> deleteUser(String uid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> createUserMute(String uid, String activeUid, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> deleteUserMute(String passiveUid, String activeUid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  FutureDoc getPost(String uid, String postId) async {
    final data = mockPosts.firstWhere((element) =>
        element.typedPoster().uid == uid && element.postId == postId);
    return MockDoc(data.toJson(), data.postId);
  }

  @override
  FutureQSnapshot getPostsByWhereIn(List<String> postIds) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final posts =
        mockPosts.where((element) => postIds.contains(element.postId));
    final data = posts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getPostsByLikeCount() async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final posts = [...mockPosts];
    posts.sort((a, b) => b.likeCount.compareTo(a.likeCount));
    final data = posts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getMorePostsByLikeCount(Doc lastDoc) => getPostsByLikeCount();
  @override
  FutureQSnapshot getPostsByFollowing(List<String> followingUids) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
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
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
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
  FutureQSnapshot getTokens(String currentUid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final data = <QDoc>[];
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getTimelinePosts(List<String> timelinePostIds) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final posts = [...mockPosts];
    final data = posts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureDoc getPublicUser(String uid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final user = mockUsers.firstWhere((element) => element.uid == uid);
    final data = user.toJson();
    return MockDoc(data, mockCurrentUid);
  }

  @override
  FutureDoc getPrivateUser(String uid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final data = privatetUser.toJson();
    return MockDoc(data, mockCurrentUid);
  }

  @override
  FutureQSnapshot getUsersByWhereIn(List<String> uids) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final users = mockUsers.where((element) => uids.contains(element.uid));
    final data = users.map((e) => MockQDoc(e.toJson(), e.uid)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureDoc getCurrentUser(String uid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final data = currentUser.toJson();
    return MockDoc(data, mockCurrentUid);
  }

  @override
  FutureQSnapshot getUsersByFollowerCount() async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final users = [...mockUsers];
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
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final posts = [...mockPosts]
        .where((e) => PublicUser.fromJson(e.poster).uid == uid)
        .toList();
    final data = posts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot searchUsers(String searchTerm) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    List<PublicUser> users = [];
    if (searchTerm.isNotEmpty) {
      users = mockUsers.where((element) {
        final name = element.typedUserName().value.toLowerCase();
        return name.contains(searchTerm);
      }).toList();
    }
    final data = users.map((e) => MockQDoc(e.toJson(), e.uid)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot searchMoreUsers(String searchTerm, Doc lastDoc) =>
      searchUsers(searchTerm);
  @override
  FutureQSnapshot searchUserPosts(String uid, String searchTerm) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    List<Post> posts = [];
    if (searchTerm.isNotEmpty) {
      posts = mockPosts.where((element) {
        final name = element.typedTitle().value.toLowerCase();
        return name.contains(searchTerm);
      }).toList();
    }
    final data = posts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot searchMoreUserPosts(
          String uid, String searchTerm, Doc lastDoc) =>
      searchUserPosts(uid, searchTerm);
}
