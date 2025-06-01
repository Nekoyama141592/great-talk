import 'package:flutter/foundation.dart';
import 'package:great_talk/providers/service/firestore/firestore_service_provider.dart';
import 'package:great_talk/service/firestore_service.dart';
import 'package:great_talk/model/database_schema/follower/follower.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/database_schema/post_like/post_like.dart';
import 'package:great_talk/model/database_schema/post_mute/post_mute.dart';
import 'package:great_talk/model/database_schema/private_user/private_user.dart';
import 'package:great_talk/model/database_schema/public_user/public_user.dart';
import 'package:great_talk/model/database_schema/tokens/following_token/following_token.dart';
import 'package:great_talk/model/database_schema/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/model/database_schema/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/model/database_schema/user_mute/user_mute.dart';
import 'package:great_talk/repository/result/result.dart';
import 'package:great_talk/typedef/firestore_typedef.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_repository.g.dart';

@riverpod
FirestoreRepository firestoreRepository(Ref ref) =>
    FirestoreRepository(service: ref.watch(firestoreServiceProvider));

class FirestoreRepository {
  FirestoreRepository({required this.service});
  final FirestoreService service;
  // count
  Future<int?> _count(MapQuery query) async {
    try {
      final snapshot = await query.count().get();
      return snapshot.count ?? 0;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<int?> countUsers() => _count(service.usersCollectionGroup());

  Future<int?> countPosts() => _count(service.postsCollectionGroup());

  Future<int?> countMessages() => _count(service.messagesCollectionGroup());

  // write
  FutureResult<bool> _createDoc(
    DocRef docRef,
    Map<String, dynamic> json,
  ) async {
    try {
      await docRef.set(json);
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(e);
    }
  }

  Future<PublicUser?> createPublicUser(
    String uid,
    Map<String, dynamic> json,
  ) async {
    final docRef = service.user(uid);
    try {
      await service.set(docRef, json);
      return PublicUser.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<PrivateUser?> createPrivateUser(
    String uid,
    Map<String, dynamic> json,
  ) async {
    final docRef = service.privateUser(uid);
    try {
      await service.set(docRef, json);
      return PrivateUser.fromJson(json);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  FutureResult<bool> createPost(
    String uid,
    String postId,
    Map<String, dynamic> json,
  ) async {
    final docRef = service.post(uid, postId);
    return _createDoc(docRef, json);
  }

  FutureResult<bool> createUserUpdateLog(
    String uid,
    Map<String, dynamic> json,
  ) async {
    final docRef = service.userUpdateLog(uid);
    return _createDoc(docRef, json);
  }

  FutureResult<bool> _deleteDoc(DocRef docRef) async {
    try {
      await docRef.delete();
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(e);
    }
  }

  FutureResult<bool> deletePublicUser(String uid) {
    final docRef = service.user(uid);
    return _deleteDoc(docRef);
  }

  FutureResult<bool> deletePost(Post post) {
    final docRef = service.post(post.uid, post.postId);
    return _deleteDoc(docRef);
  }

  FutureResult<bool> _createDocs(List<FirestoreRequest> requestList) async {
    try {
      final batch = service.batch();
      for (final request in requestList) {
        batch.set(request.docRef, request.data);
      }
      await batch.commit();
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(e);
    }
  }

  FutureResult<bool> createFollowInfo(
    String currentUid,
    String passiveUid,
    FollowingToken followingToken,
    Follower follower,
  ) async {
    final tokenRef = service.token(currentUid, followingToken.tokenId);
    final followerRef = service.follower(currentUid, passiveUid);
    final requestList = [
      FirestoreRequest(tokenRef, followingToken.toJson()),
      FirestoreRequest(followerRef, follower.toJson()),
    ];
    return _createDocs(requestList);
  }

  FutureResult<bool> createMuteUserInfo(
    String currentUid,
    String passiveUid,
    MuteUserToken token,
    UserMute userMute,
  ) async {
    final tokenRef = service.token(currentUid, token.tokenId);
    final userMuteRef = service.userMute(passiveUid, currentUid);
    final requests = [
      FirestoreRequest(tokenRef, token.toJson()),
      FirestoreRequest(userMuteRef, userMute.toJson()),
    ];
    return _createDocs(requests);
  }

  FutureResult<bool> createMutePostInfo(
    String currentUid,
    Post post,
    MutePostToken token,
    PostMute postMute,
  ) async {
    final tokenRef = service.token(currentUid, token.tokenId);
    final postMuteRef = service.postMute(
      service.post(post.uid, post.postId),
      currentUid,
    );
    final requestList = [
      FirestoreRequest(tokenRef, token.toJson()),
      FirestoreRequest(postMuteRef, postMute.toJson()),
    ];
    return _createDocs(requestList);
  }

  FutureResult<bool> createLikePostInfo(
    String currentUid,
    Post post,
    LikePostToken token,
    PostLike postLike,
  ) async {
    final tokenRef = service.token(currentUid, token.tokenId);
    final postRef = service.post(post.uid, post.postId);
    final postLikeRef = service.postLike(postRef, currentUid);
    final requestList = [
      FirestoreRequest(tokenRef, token.toJson()),
      FirestoreRequest(postLikeRef, postLike.toJson()),
    ];
    return _createDocs(requestList);
  }

  FutureResult<bool> _deleteDocs(List<DocRef> docRefList) async {
    try {
      final batch = service.batch();
      for (final docRef in docRefList) {
        batch.delete(docRef);
      }
      await batch.commit();
      return const Result.success(true);
    } catch (e) {
      debugPrint(e.toString());
      return Result.failure(e);
    }
  }

  FutureResult<bool> deleteFollowInfoList(
    String currentUid,
    String passiveUid,
    String tokenId,
  ) async {
    final followerRef = service.follower(currentUid, passiveUid);
    final tokenRef = service.token(currentUid, tokenId);
    final docRefList = [followerRef, tokenRef];
    return _deleteDocs(docRefList);
  }

  FutureResult<bool> deleteMuteUserInfo(
    String currentUid,
    String passiveUid,
    String tokenId,
  ) async {
    final tokenRef = service.token(currentUid, tokenId);
    final userMuteRef = service.userMute(passiveUid, currentUid);
    final docRefList = [tokenRef, userMuteRef];
    return _deleteDocs(docRefList);
  }

  FutureResult<bool> deleteMutePostInfo(
    String currentUid,
    Post post,
    String tokenId,
  ) async {
    final tokenRef = service.token(currentUid, tokenId);
    final postMuteRef = service.postMute(
      service.post(post.uid, post.postId),
      currentUid,
    );
    final docRefList = [tokenRef, postMuteRef];
    return _deleteDocs(docRefList);
  }

  FutureResult<bool> deleteLikePostInfo(
    String currentUid,
    Post post,
    String tokenId,
  ) async {
    final tokenRef = service.token(currentUid, tokenId);
    final postRef = service.post(post.uid, post.postId);
    final postLikeRef = service.postLike(postRef, currentUid);
    final docRefList = [tokenRef, postLikeRef];
    return _deleteDocs(docRefList);
  }

  Future<PublicUser?> getPublicUser(String uid) async {
    try {
      final docRef = service.user(uid);
      final doc = await docRef.get();
      return PublicUser.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<PrivateUser?> getPrivateUser(String uid) async {
    try {
      final docRef = service.privateUser(uid);
      final doc = await docRef.get();
      return PrivateUser.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Post?> getPost(String uid, String postId) async {
    try {
      final docRef = service.post(uid, postId);
      final doc = await docRef.get();
      return Post.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getTokens(String uid) async {
    try {
      final query = service.tokensColRef(uid);
      final qSnapshot = await query.get();
      final qDocs = qSnapshot.docs;
      return qDocs.map((doc) => doc.data()).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<QDoc>> getTimelinePosts(List<String> postIds) async {
    if (postIds.isEmpty) return [];
    try {
      final query = service.timelinePostsQuery(postIds);
      final qSnapshot = await query.get();
      return qSnapshot.docs;
    } catch (e) {
      return [];
    }
  }

  Future<List<PublicUser>> getUsersByUids(List<String> uids) async {
    if (uids.isEmpty) return [];
    try {
      final query = service.usersByWhereIn(uids);
      final qSnapshot = await query.get();
      return qSnapshot.docs
          .map((doc) => PublicUser.fromJson(doc.data()))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<Post>> getUserPosts(String uid) async {
    try {
      final query = service.userPostsByNewest(uid);
      final qshot = await query.get();
      return qshot.docs.map((e) => Post.fromJson(e.data())).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<Doc> _getPostDoc(String uid,String postId) async {
    final docRef = service.post(uid, postId);
    return docRef.get();
  }
  Future<List<Post>> getMoreUserPosts(Post lastPost) async {
    try {
      final doc = await _getPostDoc(lastPost.uid, lastPost.postId);
      final query = service.userPostsByNewest(lastPost.uid).startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs.map((e) => Post.fromJson(e.data())).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
  Future<Doc> _getUserDoc(String uid) async {
    final docRef = service.user(uid);
    return docRef.get();
  }
  Future<List<PublicUser>> getRankingUsers() async {
    try {
      final query = service.usersByFollowerCount();
      final qshot = await query.get();
      return qshot.docs.map((e) => PublicUser.fromJson(e.data())).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
  Future<List<PublicUser>> getMoreRankingUsers(PublicUser lastUser) async {
    try {
      final doc = await _getUserDoc(lastUser.uid);
      final query = service.usersByFollowerCount().startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs.map((e) => PublicUser.fromJson(e.data())).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
  Future<List<PublicUser>> getMuteUsers(List<String> requestUids) async {
    if (requestUids.isEmpty) return [];
    try {
      final query = service.usersByWhereIn(requestUids);
      final qshot = await query.get();
      return qshot.docs.map((e) => PublicUser.fromJson(e.data())).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
  Future<List<PublicUser>> getMoreMuteUsers(List<String> requestUids,PublicUser lastUser) async {
    if (requestUids.isEmpty) return [];
    try {
      final doc = await _getUserDoc(lastUser.uid);
      final query = service.usersByWhereIn(requestUids).startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs.map((e) => PublicUser.fromJson(e.data())).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}

class FirestoreRequest {
  FirestoreRequest(this.docRef, this.data);
  final DocRef docRef;
  final Map<String, dynamic> data;
}
