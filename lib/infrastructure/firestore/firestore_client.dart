import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class FirestoreClient {
  Future<void> createUser(String uid) async =>
      await FirestoreQueries.userQuery(uid).get();
  FutureQSnapshot getPostsByFollowing(List<String> followingUids) async =>
      await FirestoreQueries.postsQueryByFollowing(followingUids).get();
  FutureQSnapshot getNewPostsByFollowing(
          List<String> followingUids, Doc firstDoc) async =>
      await FirestoreQueries.newPostsQueryByFollowing(followingUids, firstDoc)
          .get();
  FutureQSnapshot getMorePostsByFollowing(
          List<String> followingUids, Doc lastDoc) async =>
      await FirestoreQueries.morePostsQueryByFollowing(followingUids, lastDoc)
          .get();

  FutureQSnapshot getPostsByLikeCount() async =>
      await FirestoreQueries.postsQueryByLikeCount.get();
  FutureQSnapshot getMorePostsByLikeCount(Doc lastDoc) async =>
      await FirestoreQueries.morePostsQueryByLikeCount(lastDoc).get();

  FutureQSnapshot getTimelinePosts(List<String> timelinePostIds) async =>
      await FirestoreQueries.timelinePostsQuery(timelinePostIds).get();

  FutureQSnapshot getTimelines(DocRef userRef) async =>
      await FirestoreQueries.timelinesQuery(userRef).get();
  FutureQSnapshot getNewTimelines(DocRef userRef, Doc firstDoc) async =>
      await FirestoreQueries.newTimelinesQuery(userRef, firstDoc).get();
  FutureQSnapshot getMoreTimelines(DocRef userRef, Doc lastDoc) async =>
      await FirestoreQueries.moreTimelinesQuery(userRef, lastDoc).get();

  FutureQSnapshot getUsersByFollowerCount() async =>
      await FirestoreQueries.usersQueryByLikeCount.get();
  FutureQSnapshot getMoreUsersByFollowerCount(Doc lastDoc) async =>
      await FirestoreQueries.moreUsersQueryByLikeCount(lastDoc).get();

  FutureQSnapshot getUserPostsByNewest(String uid) async =>
      await FirestoreQueries.userPostsQueryByNewest(uid).get();
  FutureQSnapshot getMoreUserPostsByNewest(String uid, Doc lastDoc) async =>
      await FirestoreQueries.moreUserPostsQueryByNewest(uid, lastDoc).get();
  FutureQSnapshot getNewUserPostsByNewest(String uid, Doc firstDoc) async =>
      await FirestoreQueries.newUserPostsQueryByNewest(uid, firstDoc).get();
}
