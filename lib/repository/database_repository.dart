import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/domain/entity/timeline/timeline.dart';
import 'package:great_talk/domain/entity/follower/follower.dart';
import 'package:great_talk/domain/entity/post/post.dart';
import 'package:great_talk/domain/entity/post_like/post_like.dart';
import 'package:great_talk/domain/entity/post_mute/post_mute.dart';
import 'package:great_talk/domain/entity/private_user/private_user.dart';
import 'package:great_talk/domain/entity/public_user/public_user.dart';
import 'package:great_talk/domain/entity/tokens/following_token/following_token.dart';
import 'package:great_talk/domain/entity/tokens/like_post_token/like_post_token.dart';
import 'package:great_talk/domain/entity/tokens/mute_post_token/mute_post_token.dart';
import 'package:great_talk/domain/entity/tokens/mute_user_token/mute_user_token.dart';
import 'package:great_talk/domain/entity/user_mute/user_mute.dart';
import 'package:great_talk/repository/result/result.dart';

typedef QSnapshot = QuerySnapshot<Map<String, dynamic>>;
typedef QDoc = QueryDocumentSnapshot<Map<String, dynamic>>;
typedef Doc = DocumentSnapshot<Map<String, dynamic>>;

typedef FutureQSnapshot = Future<QSnapshot>;
typedef FutureDoc = Future<Doc>;

typedef DocRef = DocumentReference<Map<String, dynamic>>;
typedef ColRef = CollectionReference<Map<String, dynamic>>;

typedef MapQuery = Query<Map<String, dynamic>>;

class DatabaseRepository {
  DatabaseRepository({required this.instance});
  final FirebaseFirestore instance;
  WriteBatch _getBatch() => instance.batch();

  // DocRef
  DocRef get publicV1 => instance.collection('public').doc('v1');
  DocRef get privateV1 => instance.collection('private').doc('v1');
  DocRef userDocRef(String uid) => usersColRef().doc(uid);
  DocRef followerDocRef(String currentUid, String passiveUid) =>
      userDocRef(passiveUid).collection('followers').doc(currentUid);
  DocRef privateUserDocRef(String currentUid) =>
      privateV1.collection('privateUsers').doc(currentUid);
  DocRef postLikeDocRef(DocRef postRef, String activeUid) =>
      postRef.collection('postLikes').doc(activeUid);
  DocRef postReportDocRef(DocRef postRef, String currentUid) =>
      postRef.collection('postReports').doc(currentUid);
  DocRef postDocRef(String uid, String postId) => postsColRef(uid).doc(postId);
  DocRef userUpdateLogDocRef(String uid) =>
      userDocRef(uid).collection('userUpdateLogs').doc();
  DocRef postMuteDocRef(DocRef postRef, String currentUid) =>
      postRef.collection('postMutes').doc(currentUid);
  DocRef userMuteDocRef(String uid, String currentUid) =>
      userDocRef(uid).collection('userMutes').doc(currentUid);
  DocRef tokenDocRef(String currentUid, String tokenId) =>
      tokensColRef(currentUid).doc(tokenId);
  DocRef timelinesDocRef(String currentUid, String postId) =>
      timelinesColRef(userDocRef(currentUid)).doc(postId);
  // ColRef
  ColRef usersColRef() => publicV1.collection('users');
  ColRef postsColRef(String uid) => userDocRef(uid).collection('posts');
  ColRef tokensColRef(String currentUid) =>
      privateUserDocRef(currentUid).collection("tokens");
  ColRef timelinesColRef(DocRef userRef) => userRef.collection('timelines');
  // Query
  MapQuery usersQuery() => usersColRef().limit(oneTimeReadCount);
  MapQuery userPostsQuery(String uid) =>
      postsColRef(uid).limit(oneTimeReadCount);
  MapQuery postsQuery() => postsCollectionGroup().limit(oneTimeReadCount);
  MapQuery postsByWhereIn(List<String> postIds) =>
      postsQuery().where('postId', whereIn: postIds);
  MapQuery userPostsByNewest(String uid) =>
      userPostsQuery(uid).orderBy("createdAt", descending: true);
  MapQuery postsByMsgCount() =>
      postsQuery().orderBy('msgCount', descending: true);
  MapQuery postsByNewest() =>
      postsQuery().orderBy('createdAt', descending: true);
  MapQuery timelinesQuery(String uid) => timelinesColRef(
    userDocRef(uid),
  ).orderBy('createdAt', descending: true).limit(whereInLimit);
  MapQuery timelinePostsQuery(List<String> timelinePostIds) =>
      postsQuery().where('postId', whereIn: timelinePostIds);
  MapQuery usersByWhereIn(List<String> uids) =>
      usersQuery().where('uid', whereIn: uids);

  MapQuery usersByFollowerCount() =>
      usersQuery().orderBy('followerCount', descending: true);
  // CollectionGroup
  MapQuery usersCollectionGroup() => instance.collectionGroup('users');
  MapQuery postsCollectionGroup() => instance.collectionGroup('posts');
  // 全部消す.
  MapQuery messagesCollectionGroup() => instance.collectionGroup('messages');
  MapQuery searchLogsCollectionGroup() =>
      instance.collectionGroup('searchLogs');
  // count
  Future<int?> _count(MapQuery query) async {
    try {
      final snapshot = await query.count().get();
      return snapshot.count ?? 0;
    } catch (e) {
      debugPrint('_count: ${e.toString()}');
      return null;
    }
  }

  Future<int?> countUsers() => _count(usersCollectionGroup());

  Future<int?> countPosts() => _count(postsCollectionGroup());

  Future<int?> countMessages() => _count(messagesCollectionGroup());

  // write
  FutureResult<bool> _createDoc(
    DocRef docRef,
    Map<String, dynamic> json,
  ) async {
    try {
      await docRef.set(json);
      return const Result.success(true);
    } catch (e) {
      debugPrint('_createDoc: ${e.toString()}');
      return Result.failure('作成が失敗しました');
    }
  }

  Future<PublicUser?> createPublicUser(
    String uid,
    Map<String, dynamic> json,
  ) async {
    final docRef = userDocRef(uid);
    try {
      await docRef.set(json);
      // Retrieve the document to ensure type safety
      final doc = await docRef.get();
      final data = doc.data();
      if (data == null) return null;
      return PublicUser.fromJson(Map<String, dynamic>.from(data));
    } catch (e) {
      debugPrint('createPublicUser: ${e.toString()}');
      return null;
    }
  }

  Future<PrivateUser?> createPrivateUser(
    String uid,
    Map<String, dynamic> json,
  ) async {
    final docRef = privateUserDocRef(uid);
    try {
      await docRef.set(json);
      // Retrieve the document to ensure type safety
      final doc = await docRef.get();
      final data = doc.data();
      if (data == null) return null;
      return PrivateUser.fromJson(Map<String, dynamic>.from(data));
    } catch (e) {
      debugPrint('createPrivateUser: ${e.toString()}');
      return null;
    }
  }

  FutureResult<bool> createPost(
    String uid,
    String postId,
    Map<String, dynamic> json,
  ) async {
    final docRef = postDocRef(uid, postId);
    return _createDoc(docRef, json);
  }

  FutureResult<bool> createUserUpdateLog(
    String uid,
    Map<String, dynamic> json,
  ) async {
    final docRef = userUpdateLogDocRef(uid);
    return _createDoc(docRef, json);
  }

  FutureResult<bool> _deleteDoc(DocRef docRef) async {
    try {
      await docRef.delete();
      return const Result.success(true);
    } catch (e) {
      debugPrint('_deleteDoc: ${e.toString()}');
      return Result.failure('削除が失敗しました');
    }
  }

  FutureResult<bool> deletePublicUser(String uid) {
    final docRef = userDocRef(uid);
    return _deleteDoc(docRef);
  }

  FutureResult<bool> deletePost(Post post) {
    final docRef = postDocRef(post.uid, post.postId);
    return _deleteDoc(docRef);
  }

  FutureResult<bool> _createDocs(List<FirestoreRequest> requestList) async {
    try {
      final batch = _getBatch();
      for (final request in requestList) {
        batch.set(request.docRef, request.data);
      }
      await batch.commit();
      return const Result.success(true);
    } catch (e) {
      debugPrint('_createDocs: ${e.toString()}');
      return Result.failure('作成が失敗しました');
    }
  }

  FutureResult<bool> createFollowInfo(
    String currentUid,
    String passiveUid,
    FollowingToken followingToken,
    Follower follower,
  ) async {
    final tokenRef = tokenDocRef(currentUid, followingToken.tokenId);
    final followerRef = followerDocRef(currentUid, passiveUid);
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
    final tokenRef = tokenDocRef(currentUid, token.tokenId);
    final userMuteRef = userMuteDocRef(passiveUid, currentUid);
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
    final tokenRef = tokenDocRef(currentUid, token.tokenId);
    final postMuteRef = postMuteDocRef(
      postDocRef(post.uid, post.postId),
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
    final tokenRef = tokenDocRef(currentUid, token.tokenId);
    final postRef = postDocRef(post.uid, post.postId);
    final postLikeRef = postLikeDocRef(postRef, currentUid);
    final requestList = [
      FirestoreRequest(tokenRef, token.toJson()),
      FirestoreRequest(postLikeRef, postLike.toJson()),
    ];
    return _createDocs(requestList);
  }

  FutureResult<bool> _deleteDocs(List<DocRef> docRefList) async {
    try {
      final batch = _getBatch();
      for (final docRef in docRefList) {
        batch.delete(docRef);
      }
      await batch.commit();
      return const Result.success(true);
    } catch (e) {
      debugPrint('_deleteDocs: ${e.toString()}');
      return Result.failure('削除が失敗しました');
    }
  }

  FutureResult<bool> deleteFollowInfoList(
    String currentUid,
    String passiveUid,
    String tokenId,
  ) async {
    final followerRef = followerDocRef(currentUid, passiveUid);
    final tokenRef = tokenDocRef(currentUid, tokenId);
    final docRefList = [followerRef, tokenRef];
    return _deleteDocs(docRefList);
  }

  FutureResult<bool> deleteMuteUserInfo(
    String currentUid,
    String passiveUid,
    String tokenId,
  ) async {
    final tokenRef = tokenDocRef(currentUid, tokenId);
    final userMuteRef = userMuteDocRef(passiveUid, currentUid);
    final docRefList = [tokenRef, userMuteRef];
    return _deleteDocs(docRefList);
  }

  FutureResult<bool> deleteMutePostInfo(
    String currentUid,
    Post post,
    String tokenId,
  ) async {
    final tokenRef = tokenDocRef(currentUid, tokenId);
    final postMuteRef = postMuteDocRef(
      postDocRef(post.uid, post.postId),
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
    final tokenRef = tokenDocRef(currentUid, tokenId);
    final postRef = postDocRef(post.uid, post.postId);
    final postLikeRef = postLikeDocRef(postRef, currentUid);
    final docRefList = [tokenRef, postLikeRef];
    return _deleteDocs(docRefList);
  }

  Future<PublicUser?> getPublicUser(String uid) async {
    try {
      final docRef = userDocRef(uid);
      final doc = await docRef.get();
      final data = doc.data();
      if (data == null) return null;
      return PublicUser.fromJson(Map<String, dynamic>.from(data));
    } catch (e) {
      debugPrint('getPublicUser: ${e.toString()}');
      return null;
    }
  }

  Future<PrivateUser?> getPrivateUser(String uid) async {
    try {
      final docRef = privateUserDocRef(uid);
      final doc = await docRef.get();
      final data = doc.data();
      if (data == null) return null;
      return PrivateUser.fromJson(Map<String, dynamic>.from(data));
    } catch (e) {
      debugPrint('getPrivateUser: ${e.toString()}');
      return null;
    }
  }

  Future<Post?> getPost(String uid, String postId) async {
    try {
      final docRef = postDocRef(uid, postId);
      final doc = await docRef.get();
      final data = doc.data();
      if (data == null) return null;
      return Post.fromJson(Map<String, dynamic>.from(data));
    } catch (e) {
      debugPrint('getPost: ${e.toString()}');
      return null;
    }
  }

  Future<QSnapshot> _getDocs(MapQuery query) {
    return query.get();
  }

  Future<List<Map<String, dynamic>>> getTokens(String uid) async {
    try {
      final query = tokensColRef(uid);
      final qSnapshot = await query.get();
      final qDocs = qSnapshot.docs;
      return qDocs.map((doc) => doc.data()).toList();
    } catch (e) {
      debugPrint('getTokens: ${e.toString()}');
      return [];
    }
  }

  Future<List<Post>> getTimelinePosts(List<String> postIds) async {
    if (postIds.isEmpty) return [];
    try {
      final query = timelinePostsQuery(postIds);
      final qSnapshot = await _getDocs(query);
      return qSnapshot.docs
          .map((e) => Post.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getTimelinePosts: ${e.toString()}'); // Added debugPrint here
      return [];
    }
  }

  Future<List<PublicUser>> getUsersByUids(List<String> uids) async {
    if (uids.isEmpty) return [];
    try {
      final query = usersByWhereIn(uids);
      final qSnapshot = await _getDocs(query);
      return qSnapshot.docs
          .map((doc) => PublicUser.fromJson(doc.data()))
          .toList();
    } catch (e) {
      debugPrint('getUsersByUids: ${e.toString()}');
      return [];
    }
  }

  Future<List<Post>> getUserPosts(String uid) async {
    try {
      final query = userPostsByNewest(uid);
      final qshot = await _getDocs(query);
      return qshot.docs
          .map((e) => Post.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getUserPosts: ${e.toString()}');
      return [];
    }
  }

  Future<Doc> _getPostDoc(Post post) async {
    final docRef = postDocRef(post.uid, post.postId);
    return docRef.get();
  }

  Future<List<Post>> getMoreUserPosts(Post lastPost) async {
    try {
      final doc = await _getPostDoc(lastPost);
      final query = userPostsByNewest(lastPost.uid).startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs
          .map((e) => Post.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getMoreUserPosts: ${e.toString()}');
      return [];
    }
  }

  Future<Doc> _getUserDoc(String uid) async {
    final docRef = userDocRef(uid);
    return docRef.get();
  }

  Future<List<PublicUser>> getRankingUsers() async {
    try {
      final query = usersByFollowerCount();
      final qshot = await query.get();
      return qshot.docs
          .map((e) => PublicUser.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getRankingUsers: ${e.toString()}');
      return [];
    }
  }

  Future<List<PublicUser>> getMoreRankingUsers(PublicUser lastUser) async {
    try {
      final doc = await _getUserDoc(lastUser.uid);
      final query = usersByFollowerCount().startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs
          .map((e) => PublicUser.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getMoreRankingUsers: ${e.toString()}');
      return [];
    }
  }

  Future<List<PublicUser>> getMuteUsers(List<String> requestUids) async {
    if (requestUids.isEmpty) return [];
    try {
      final query = usersByWhereIn(requestUids);
      final qshot = await query.get();
      return qshot.docs
          .map((e) => PublicUser.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getMuteUsers: ${e.toString()}');
      return [];
    }
  }

  Future<List<PublicUser>> getMoreMuteUsers(
    List<String> requestUids,
    PublicUser lastUser,
  ) async {
    if (requestUids.isEmpty) return [];
    try {
      final doc = await _getUserDoc(lastUser.uid);
      final query = usersByWhereIn(requestUids).startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs
          .map((e) => PublicUser.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getMoreMuteUsers: ${e.toString()}');
      return [];
    }
  }

  Future<List<Timeline>> getTimelines(String currentUid) async {
    try {
      final qshot = await timelinesQuery(currentUid).get();
      final timelines =
          qshot.docs
              .map(
                (e) => Timeline.fromJson(Map<String, dynamic>.from(e.data())),
              )
              .toList();
      final sorted = [...timelines]
        ..sort((a, b) => (b.createdAt).compareTo(a.createdAt));
      return sorted;
    } catch (e) {
      debugPrint('getTimelines: ${e.toString()}');
      return [];
    }
  }

  MapQuery _postsQuery(bool isRankingPosts) {
    return isRankingPosts ? postsByMsgCount() : postsByNewest();
  }

  Future<List<Post>> getPosts(bool isRankingPosts) async {
    try {
      final qshot = await _postsQuery(isRankingPosts).get();
      return qshot.docs
          .map((e) => Post.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getPosts: ${e.toString()}');
      return [];
    }
  }

  Future<List<Post>> getMorePosts(bool isRankingPosts, Post lastPost) async {
    try {
      final doc = await _getPostDoc(lastPost);
      final qshot =
          await _postsQuery(isRankingPosts).startAfterDocument(doc).get();
      return qshot.docs
          .map((e) => Post.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getMorePosts: ${e.toString()}');
      return [];
    }
  }

  Future<List<Timeline>> getMoreTimelines(
    String currentUid,
    Timeline lastTimeline,
  ) async {
    try {
      final doc = await timelinesDocRef(currentUid, lastTimeline.postId).get();
      final query = timelinesQuery(currentUid);
      final qshot = await query.startAfterDocument(doc).get();
      return qshot.docs
          .map((e) => Timeline.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getMoreTimelines: ${e.toString()}');
      return [];
    }
  }

  Future<List<Post>> getMutePosts(List<String> postIds) async {
    if (postIds.isEmpty) return [];
    try {
      final query = postsByWhereIn(postIds);
      final qshot = await query.get();
      return qshot.docs
          .map((e) => Post.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getMutePosts: ${e.toString()}');
      return [];
    }
  }

  Future<List<Post>> getMoreMutePosts(
    List<String> postIds,
    Post lastPost,
  ) async {
    if (postIds.isEmpty) return [];
    try {
      final doc = await _getPostDoc(lastPost);
      final query = postsByWhereIn(postIds).startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs
          .map((e) => Post.fromJson(Map<String, dynamic>.from(e.data())))
          .toList();
    } catch (e) {
      debugPrint('getMoreMutePosts: ${e.toString()}');
      return [];
    }
  }
}

class FirestoreRequest {
  FirestoreRequest(this.docRef, this.data);
  final DocRef docRef;
  final Map<String, dynamic> data;
}
