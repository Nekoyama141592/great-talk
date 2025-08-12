import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:great_talk/core/constant/firestore_constant.dart';
import 'package:great_talk/domain/entity/database/private_user/private_user_entity.dart';
import 'package:great_talk/domain/value/token_type.dart';
import 'package:great_talk/infrastructure/model/database_schema/timeline/timeline_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/follower/follower_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/post_like/post_like_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/post_mute/post_mute_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/private_user/private_user_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/public_user/public_user_model.dart';
import 'package:great_talk/domain/entity/database/public_user/public_user_entity.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/following_token/following_token_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/like_post_token/like_post_token_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_post_token/mute_post_token_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/mute_user_token/mute_user_token_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/tokens/tokens_model.dart';
import 'package:great_talk/infrastructure/model/database_schema/user_mute/user_mute_model.dart';
import 'package:great_talk/infrastructure/model/result/result.dart';
import 'package:great_talk/domain/repository_interface/i_database_repository.dart';

typedef QSnapshot = QuerySnapshot<Map<String, dynamic>>;
typedef QDoc = QueryDocumentSnapshot<Map<String, dynamic>>;
typedef Doc = DocumentSnapshot<Map<String, dynamic>>;

typedef FutureQSnapshot = Future<QSnapshot>;
typedef FutureDoc = Future<Doc>;

typedef DocRef = DocumentReference<Map<String, dynamic>>;
typedef ColRef = CollectionReference<Map<String, dynamic>>;

typedef MapQuery = Query<Map<String, dynamic>>;

class DatabaseRepository implements IDatabaseRepository {
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
  MapQuery usersQuery() =>
      usersColRef().limit(FirestoreConstant.oneTimeReadCount);
  MapQuery userPostsQuery(String uid) =>
      postsColRef(uid).limit(FirestoreConstant.oneTimeReadCount);
  MapQuery postsQuery() =>
      postsCollectionGroup().limit(FirestoreConstant.oneTimeReadCount);
  MapQuery postsByWhereIn(List<String> postIds) =>
      postsQuery().where('postId', whereIn: postIds);
  MapQuery userPostsByNewest(String uid) =>
      userPostsQuery(uid).orderBy("createdAt", descending: true);
  MapQuery postsByMsgCount() =>
      postsQuery().orderBy('msgCount', descending: true);
  MapQuery postsByNewest() =>
      postsQuery().orderBy('createdAt', descending: true);
  MapQuery timelinesQuery(String uid) => timelinesColRef(userDocRef(uid))
      .orderBy('createdAt', descending: true)
      .limit(FirestoreConstant.whereInLimit);
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

  @override
  Future<int?> countUsers() => _count(usersCollectionGroup());

  @override
  Future<int?> countPosts() => _count(postsCollectionGroup());

  @override
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
      return const Result.failure('作成が失敗しました');
    }
  }

  @override
  Future<PublicUserEntity?> createPublicUser(String uid) async {
    try {
      final docRef = userDocRef(uid);
      final oldDoc = await docRef.get();
      if (oldDoc.exists) return null;
      final newUser = PublicUserModel.fromRegister(uid);
      final json = newUser.toJson();
      await docRef.set(json);
      final doc = await docRef.get();
      final data = doc.data();
      if (data == null) return null;
      final publicUser = PublicUserModel.fromJson(
        Map<String, dynamic>.from(data),
      );
      return PublicUserEntity.fromModel(publicUser);
    } catch (e) {
      debugPrint('createPublicUser: ${e.toString()}');
      return null;
    }
  }

  @override
  Future<PrivateUserEntity?> createPrivateUser(String uid) async {
    try {
      final docRef = privateUserDocRef(uid);
      final oldDoc = await docRef.get();
      if (oldDoc.exists) return null;
      final newPrivateUser = PrivateUserModel.fromUid(uid);
      final json = newPrivateUser.toJson();
      await docRef.set(json);
      return const PrivateUserEntity();
    } catch (e) {
      debugPrint('createPrivateUser: ${e.toString()}');
      return null;
    }
  }


  @override
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
      return const Result.failure('削除が失敗しました');
    }
  }

  @override
  FutureResult<bool> deletePublicUser(String uid) {
    final docRef = userDocRef(uid);
    return _deleteDoc(docRef);
  }

  @override
  FutureResult<bool> deletePost(String uid, String postId) {
    final docRef = postDocRef(uid, postId);
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
      return const Result.failure('作成が失敗しました');
    }
  }

  @override
  FutureResult<bool> createFollowInfo(
    String currentUid,
    String passiveUid,
  ) async {
    final followingToken = FollowingTokenModel.fromUid(passiveUid);
    final follower = FollowerModel.fromUid(currentUid, passiveUid);
    final tokenRef = tokenDocRef(currentUid, followingToken.tokenId);
    final followerRef = followerDocRef(currentUid, passiveUid);
    final requestList = [
      FirestoreRequest(tokenRef, followingToken.toJson()),
      FirestoreRequest(followerRef, follower.toJson()),
    ];
    return _createDocs(requestList);
  }

  @override
  FutureResult<bool> createMuteUserInfo(
    String currentUid,
    String passiveUid,
  ) async {
    final token = MuteUserTokenModel.fromPost(currentUid, passiveUid);
    final userMute = UserMute.fromPost(currentUid, passiveUid);
    final tokenRef = tokenDocRef(currentUid, token.tokenId);
    final userMuteRef = userMuteDocRef(passiveUid, currentUid);
    final requests = [
      FirestoreRequest(tokenRef, token.toJson()),
      FirestoreRequest(userMuteRef, userMute.toJson()),
    ];
    return _createDocs(requests);
  }

  @override
  FutureResult<bool> createMutePostInfo(
    String currentUid,
    String postUid,
    String postId,
  ) async {
    final token = MutePostTokenModel.fromPost(postId, currentUid);
    final postMute = PostMuteModel.fromPost(postId, currentUid);
    final tokenRef = tokenDocRef(currentUid, token.tokenId);
    final postMuteRef = postMuteDocRef(postDocRef(postUid, postId), currentUid);
    final requestList = [
      FirestoreRequest(tokenRef, token.toJson()),
      FirestoreRequest(postMuteRef, postMute.toJson()),
    ];
    return _createDocs(requestList);
  }

  @override
  FutureResult<bool> createLikePostInfo(
    String currentUid,
    String postUid,
    String postId,
  ) async {
    final token = LikePostTokenModel.fromPost(postId, postUid, currentUid);
    final postLike = PostLikeModel.fromPost(postId, postUid, currentUid);
    final tokenRef = tokenDocRef(currentUid, token.tokenId);
    final postRef = postDocRef(postUid, postId);
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
      return const Result.failure('削除が失敗しました');
    }
  }

  @override
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

  @override
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

  @override
  FutureResult<bool> deleteMutePostInfo(
    String currentUid,
    String postUid,
    String postId,
    String tokenId,
  ) async {
    final tokenRef = tokenDocRef(currentUid, tokenId);
    final postMuteRef = postMuteDocRef(postDocRef(postUid, postId), currentUid);
    final docRefList = [tokenRef, postMuteRef];
    return _deleteDocs(docRefList);
  }

  @override
  FutureResult<bool> deleteLikePostInfo(
    String currentUid,
    String postUid,
    String postId,
    String tokenId,
  ) async {
    final tokenRef = tokenDocRef(currentUid, tokenId);
    final postRef = postDocRef(postUid, postId);
    final postLikeRef = postLikeDocRef(postRef, currentUid);
    final docRefList = [tokenRef, postLikeRef];
    return _deleteDocs(docRefList);
  }

  @override
  Future<PublicUserEntity?> getPublicUser(String uid) async {
    try {
      final docRef = userDocRef(uid);
      final doc = await docRef.get();
      final data = doc.data();
      if (data == null) return null;
      final publicUser = PublicUserModel.fromJson(
        Map<String, dynamic>.from(data),
      );
      return PublicUserEntity.fromModel(publicUser);
    } catch (e) {
      debugPrint('getPublicUser: ${e.toString()}');
      return null;
    }
  }

  @override
  Future<PrivateUserEntity?> getPrivateUser(String uid) async {
    try {
      final docRef = privateUserDocRef(uid);
      final doc = await docRef.get();
      final data = doc.data();
      if (data == null) return null;
      final privateUser = PrivateUserModel.fromJson(
        Map<String, dynamic>.from(data),
      );
      return PrivateUserEntity.fromModel(privateUser);
    } catch (e) {
      debugPrint('getPrivateUser: ${e.toString()}');
      return null;
    }
  }

  @override
  Future<PostEntity?> getPost(String uid, String postId) async {
    try {
      final docRef = postDocRef(uid, postId);
      final doc = await docRef.get();
      final data = doc.data();
      if (data == null) return null;
      final post = PostModel.fromJson(Map<String, dynamic>.from(data));
      return PostEntity.fromModel(post);
    } catch (e) {
      debugPrint('getPost: ${e.toString()}');
      return null;
    }
  }

  Future<QSnapshot> _getDocs(MapQuery query) {
    return query.get();
  }

  @override
  Future<Tokens> getTokens(String uid) async {
    try {
      final query = tokensColRef(uid);
      final qSnapshot = await query.get();
      final qDocs = qSnapshot.docs;
      final allTokensData = qDocs.map((doc) => doc.data()).toList();
      return Tokens(
        followingTokens:
            allTokensData
                .where((map) => map['tokenType'] == TokenType.following.name)
                .map((map) => FollowingTokenModel.fromJson(map))
                .toList(),
        likePostTokens:
            allTokensData
                .where((map) => map['tokenType'] == TokenType.likePost.name)
                .map((map) => LikePostTokenModel.fromJson(map))
                .toList(),
        muteUserTokens:
            allTokensData
                .where((map) => map['tokenType'] == TokenType.muteUser.name)
                .map((map) => MuteUserTokenModel.fromJson(map))
                .toList(),
        mutePostTokens:
            allTokensData
                .where((map) => map['tokenType'] == TokenType.mutePost.name)
                .map((map) => MutePostTokenModel.fromJson(map))
                .toList(),
      );
    } catch (e) {
      debugPrint('getTokens: ${e.toString()}');
      return const Tokens();
    }
  }

  @override
  Future<List<PostEntity>> getTimelinePosts(List<String> postIds) async {
    if (postIds.isEmpty) return [];
    try {
      final query = timelinePostsQuery(postIds);
      final qSnapshot = await _getDocs(query);
      return qSnapshot.docs.map((e) {
        final post = PostModel.fromJson(Map<String, dynamic>.from(e.data()));
        return PostEntity.fromModel(post);
      }).toList();
    } catch (e) {
      debugPrint('getTimelinePosts: ${e.toString()}'); // Added debugPrint here
      return [];
    }
  }

  @override
  Future<List<PublicUserEntity>> getUsersByUids(List<String> uids) async {
    if (uids.isEmpty) return [];
    try {
      final query = usersByWhereIn(uids);
      final qSnapshot = await _getDocs(query);
      return qSnapshot.docs.map((doc) {
        final publicUser = PublicUserModel.fromJson(doc.data());
        return PublicUserEntity.fromModel(publicUser);
      }).toList();
    } catch (e) {
      debugPrint('getUsersByUids: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<PostEntity>> getUserPosts(String uid) async {
    try {
      final query = userPostsByNewest(uid);
      final qshot = await _getDocs(query);
      return qshot.docs.map((e) {
        final post = PostModel.fromJson(Map<String, dynamic>.from(e.data()));
        return PostEntity.fromModel(post);
      }).toList();
    } catch (e) {
      debugPrint('getUserPosts: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<PostEntity>> getMoreUserPosts(
    String uid,
    String lastPostId,
  ) async {
    try {
      final doc = await postDocRef(uid, lastPostId).get();
      final query = userPostsByNewest(uid).startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs.map((e) {
        final post = PostModel.fromJson(Map<String, dynamic>.from(e.data()));
        return PostEntity.fromModel(post);
      }).toList();
    } catch (e) {
      debugPrint('getMoreUserPosts: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<PublicUserEntity>> getRankingUsers() async {
    try {
      final query = usersByFollowerCount();
      final qshot = await query.get();
      return qshot.docs.map((e) {
        final publicUser = PublicUserModel.fromJson(
          Map<String, dynamic>.from(e.data()),
        );
        return PublicUserEntity.fromModel(publicUser);
      }).toList();
    } catch (e) {
      debugPrint('getRankingUsers: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<PublicUserEntity>> getMoreRankingUsers(String lastUserUid) async {
    try {
      final doc = await userDocRef(lastUserUid).get();
      final query = usersByFollowerCount().startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs.map((e) {
        final publicUser = PublicUserModel.fromJson(
          Map<String, dynamic>.from(e.data()),
        );
        return PublicUserEntity.fromModel(publicUser);
      }).toList();
    } catch (e) {
      debugPrint('getMoreRankingUsers: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<PublicUserEntity>> getMuteUsers(List<String> requestUids) async {
    if (requestUids.isEmpty) return [];
    try {
      final query = usersByWhereIn(requestUids);
      final qshot = await query.get();
      return qshot.docs.map((e) {
        final publicUser = PublicUserModel.fromJson(
          Map<String, dynamic>.from(e.data()),
        );
        return PublicUserEntity.fromModel(publicUser);
      }).toList();
    } catch (e) {
      debugPrint('getMuteUsers: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<PublicUserEntity>> getMoreMuteUsers(
    List<String> requestUids,
    String lastUserUid,
  ) async {
    if (requestUids.isEmpty) return [];
    try {
      final doc = await userDocRef(lastUserUid).get();
      final query = usersByWhereIn(requestUids).startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs.map((e) {
        final publicUser = PublicUserModel.fromJson(
          Map<String, dynamic>.from(e.data()),
        );
        return PublicUserEntity.fromModel(publicUser);
      }).toList();
    } catch (e) {
      debugPrint('getMoreMuteUsers: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<TimelineModel>> getTimelines(String currentUid) async {
    try {
      final qshot = await timelinesQuery(currentUid).get();
      final timelines =
          qshot.docs
              .map(
                (e) =>
                    TimelineModel.fromJson(Map<String, dynamic>.from(e.data())),
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

  @override
  Future<List<PostEntity>> getPosts(bool isRankingPosts) async {
    try {
      final qshot = await _postsQuery(isRankingPosts).get();
      return qshot.docs.map((e) {
        final post = PostModel.fromJson(Map<String, dynamic>.from(e.data()));
        return PostEntity.fromModel(post);
      }).toList();
    } catch (e) {
      debugPrint('getPosts: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<PostEntity>> getMorePosts(
    bool isRankingPosts,
    String lastPostUid,
    String lastPostId,
  ) async {
    try {
      final doc = await postDocRef(lastPostUid, lastPostId).get();
      final qshot =
          await _postsQuery(isRankingPosts).startAfterDocument(doc).get();
      return qshot.docs.map((e) {
        final post = PostModel.fromJson(Map<String, dynamic>.from(e.data()));
        return PostEntity.fromModel(post);
      }).toList();
    } catch (e) {
      debugPrint('getMorePosts: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<TimelineModel>> getMoreTimelines(
    String currentUid,
    String lastTimelinePostId,
  ) async {
    try {
      final doc = await timelinesDocRef(currentUid, lastTimelinePostId).get();
      final query = timelinesQuery(currentUid);
      final qshot = await query.startAfterDocument(doc).get();
      return qshot.docs
          .map(
            (e) => TimelineModel.fromJson(Map<String, dynamic>.from(e.data())),
          )
          .toList();
    } catch (e) {
      debugPrint('getMoreTimelines: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<PostEntity>> getMutePosts(List<String> postIds) async {
    if (postIds.isEmpty) return [];
    try {
      final query = postsByWhereIn(postIds);
      final qshot = await query.get();
      return qshot.docs.map((e) {
        final post = PostModel.fromJson(Map<String, dynamic>.from(e.data()));
        return PostEntity.fromModel(post);
      }).toList();
    } catch (e) {
      debugPrint('getMutePosts: ${e.toString()}');
      return [];
    }
  }

  @override
  Future<List<PostEntity>> getMoreMutePosts(
    List<String> postIds,
    String lastPostUid,
    String lastPostId,
  ) async {
    if (postIds.isEmpty) return [];
    try {
      final doc = await postDocRef(lastPostUid, lastPostId).get();
      final query = postsByWhereIn(postIds).startAfterDocument(doc);
      final qshot = await query.get();
      return qshot.docs.map((e) {
        final post = PostModel.fromJson(Map<String, dynamic>.from(e.data()));
        return PostEntity.fromModel(post);
      }).toList();
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
