import 'package:great_talk/core/firestore/doc_ref_core.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

class ColRefCore {
  static ColRef users() => DocRefCore.publicV1.collection('users');
  static ColRef posts(String uid) => DocRefCore.user(uid).collection('posts');
  static ColRef tokens(String currentUid) =>
      DocRefCore.privateUser(currentUid).collection("tokens");
  static ColRef timelines(DocRef userRef) => userRef.collection('timelines');
}
