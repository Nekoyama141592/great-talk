import 'package:great_talk/common/ints.dart';
import 'package:great_talk/core/firestore/col_ref_core.dart';
import 'package:great_talk/core/firestore/collection_group_core.dart';
import 'package:great_talk/model/bookmark_category/bookmark_category.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class QueryCore {
  // 基本
  static MapQuery users() => ColRefCore.users().limit(oneTimeReadCount);
  static MapQuery userPosts(String uid) =>
      ColRefCore.posts(uid).limit(oneTimeReadCount);
  static MapQuery posts() => CollectionGroupCore.posts.limit(oneTimeReadCount);
  // カスタム
  static MapQuery postsByWhereIn(List<String> postIds) =>
      posts().where('postId', whereIn: postIds);
  static MapQuery userPostsByNewest(String uid) =>
      userPosts(uid).orderBy("createdAt", descending: true);
  static MapQuery postsByMsgCount() =>
      posts().orderBy('msgCount', descending: true);
  static MapQuery postsByNewest() =>
      posts().orderBy('createdAt', descending: true);
  static MapQuery timelines(DocRef userRef) => userRef
      .collection('timelines')
      .orderBy('createdAt', descending: true)
      .limit(whereInLimit);
  static MapQuery timelinePosts(List<String> timelinePostIds) =>
      posts().where('postId', whereIn: timelinePostIds);
  static MapQuery usersByWhereIn(List<String> uids) =>
      users().where('uid', whereIn: uids);

  static MapQuery usersByFollowerCount() =>
      users().orderBy('followerCount', descending: true);
  static MapQuery bookmarks(BookmarkCategory category) =>
      ColRefCore.bookmarks(category).limit(whereInLimit);
}
