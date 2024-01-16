import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/model/bookmark_category/bookmark_category.dart';
import 'package:great_talk/model/private_user/private_user.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
class ColRefCore {
  static ColRef users() => DocRefCore.publicV1.collection('users');
  static ColRef posts(String uid) =>
      DocRefCore.user(uid).collection('posts');
  static ColRef tokens(String currentUid) =>
      DocRefCore.privateUser(currentUid).collection("tokens");
  static ColRef bookmarks(BookmarkCategory category) =>
      category.ref.collection('bookmarks');
  static ColRef messages(
          String posterUid, String postId, String currentUid) =>
      DocRefCore.post(posterUid,postId)
          .collection('senders')
          .doc(currentUid)
          .collection('messages');
  static ColRef bookmarkCategories(PrivateUser privateUser) =>
      privateUser.typedRef().collection("bookmarkCategories");
}