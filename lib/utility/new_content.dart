import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/firestore_user/firestore_user.dart';

class NewContent {
  static FirestoreUser newUser(String uid) {
    final now = Timestamp.now();
    return FirestoreUser(
      accountName: "",
      createdAt: now,
      bio: {},
      blockCount: 0,
      ethAddress: '',
      followerCount: 0,
      followingCount: 0,
      isAdmin: false,
      isNFTicon: false,
      isOfficial: false,
      isSuspended: false,
      muteCount: 0,
      postCount: 0,
      links: [],
      nftIconInfo: {},
      ref: FirestoreQueries.userQuery(uid),
      reportCount: 0,
      score: 0,
      searchToken: {},
      uid: uid,
      updatedAt: now,
      userImage: {},
      userName: {},
      walletAddresses: [],
    );
  }
}
