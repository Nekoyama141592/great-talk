import 'package:great_talk/consts/debug_constants.dart';
import 'package:great_talk/infrastructure/firestore/firestore_client.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_data.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_doc.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_doc.dart';
import 'package:great_talk/infrastructure/firestore/mocks/mock_q_snapshot.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class MockFirestoreClient implements FirestoreClient {
  // count
  @override
  Future<int> countMessages() async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return 100;
  }

  @override
  Future<int> countPosts() async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return mockPosts.length;
  }

  @override
  Future<int> countSearchLogs() async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return 100;
  }

  @override
  Future<int> countUsers() async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return mockUsers.length;
  }

  // write
  @override
  Future<void> createDoc(DocRef ref, SDMap json) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

  @override
  Future<void> deleteDoc(DocRef ref) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    return;
  }

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
  Future<void> deletePost(DocRef postRef) async {
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
  Future<void> createSearchLog(String uid, SDMap json) async {
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
  Future<void> createPostReport(
      DocRef postRef, String currentUid, SDMap json) async {
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

  // read
  @override
  FutureDoc getBookmark(DocRef ref) {
    // TODO: implement getBookmark
    throw UnimplementedError();
  }

  @override
  FutureDoc getPost(String uid, String postId) async {
    final data = mockPosts.firstWhere((element) =>
        element.typedPoster().uid == uid && element.postId == postId);
    return MockDoc(data.toJson(), data.postId);
  }

  @override
  FutureQSnapshot getPosts(MapQuery query) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final data = mockPosts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getTimelinePosts(List<String> timelinePostIds) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final data = mockPosts.map((e) => MockQDoc(e.toJson(), e.postId)).toList();
    return MockQSnapshot(data);
  }

  @override
  FutureQSnapshot getTokens(String currentUid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final data = <QDoc>[];
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
  FutureDoc getCurrentUser(String uid) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final data = currentUser.toJson();
    return MockDoc(data, mockCurrentUid);
  }

  @override
  FutureQSnapshot getUsers(MapQuery query) async {
    await Future.delayed(const Duration(microseconds: awaitMilliSeconds));
    final data = mockUsers.map((e) => MockQDoc(e.toJson(), e.uid)).toList();
    return MockQSnapshot(data);
  }
}
