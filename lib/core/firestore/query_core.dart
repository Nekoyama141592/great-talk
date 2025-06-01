import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/core/firestore/col_ref_core.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class QueryCore {
  static final _instance = FirebaseFirestore.instance;
  // 基本
  static MapQuery users() => ColRefCore.users().limit(oneTimeReadCount);
  static MapQuery userPosts(String uid) =>
      ColRefCore.posts(uid).limit(oneTimeReadCount);
  static MapQuery posts() => postsCollectionGroup().limit(oneTimeReadCount);
  // カスタム
  static MapQuery postsByWhereIn(List<String> postIds) =>
      posts().where('postId', whereIn: postIds);
  static MapQuery userPostsByNewest(String uid) =>
      userPosts(uid).orderBy("createdAt", descending: true);
  static MapQuery postsByMsgCount() =>
      posts().orderBy('msgCount', descending: true);
  static MapQuery postsByNewest() =>
      posts().orderBy('createdAt', descending: true);
  static MapQuery timelines(DocRef userRef) => ColRefCore.timelines(
    userRef,
  ).orderBy('createdAt', descending: true).limit(whereInLimit);
  static MapQuery timelinePosts(List<String> timelinePostIds) =>
      posts().where('postId', whereIn: timelinePostIds);
  static MapQuery usersByWhereIn(List<String> uids) =>
      users().where('uid', whereIn: uids);

  static MapQuery usersByFollowerCount() =>
      users().orderBy('followerCount', descending: true);
  // CollectionGroup
  static MapQuery usersCollectionGroup() => _instance.collectionGroup('users');
  static MapQuery postsCollectionGroup() => _instance.collectionGroup('posts');
  // 全部消す.
  static MapQuery messagesCollectionGroup() => _instance.collectionGroup('messages');
}
