import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/core/firestore/col_ref_core.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class DocRefCore {
  static final _instance = FirebaseFirestore.instance;
  static final DocRef publicV1 = _instance.collection('public').doc('v1');
  static final DocRef privateV1 = _instance.collection('private').doc('v1');

  static DocRef user(String uid) => ColRefCore.users().doc(uid);
  static DocRef follower(String currentUid, String passiveUid) =>
      user(passiveUid).collection('followers').doc(currentUid);
  static DocRef privateUser(String currentUid) =>
      privateV1.collection('privateUsers').doc(currentUid);
  static DocRef postLike(DocRef postRef, String activeUid) =>
      postRef.collection('postLikes').doc(activeUid);
  static DocRef postReport(DocRef postRef, String currentUid) =>
      postRef.collection('postReports').doc(currentUid);
  static DocRef post(String uid, String postId) =>
      ColRefCore.posts(uid).doc(postId);
  static DocRef userUpdateLog(String uid) =>
      user(uid).collection('userUpdateLogs').doc();
  static DocRef postMute(DocRef postRef, String currentUid) =>
      postRef.collection('postMutes').doc(currentUid);
  static DocRef userMute(String uid, String currentUid) =>
      user(uid).collection('userMutes').doc(currentUid);
  static DocRef token(String currentUid, String tokenId) =>
      ColRefCore.tokens(currentUid).doc(tokenId);
}
