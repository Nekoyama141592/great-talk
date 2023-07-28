import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'firestore_user.freezed.dart';

@freezed
abstract class FirestoreUser implements _$FirestoreUser {
  const FirestoreUser._();
  factory FirestoreUser({
    required String accountName,
    required DetectedText bio,
    required int blockCount,
    required dynamic createdAt,
    required String ethAddress,
    required int followerCount,
    required int followingCount,
    required bool isAdmin,
    required bool isNFTicon,
    required bool isOfficial,
    required bool isSuspended,
    required List<Map<String, dynamic>> links, // TODO: クラスにしろ
    required int muteCount,
    required Map<String, dynamic> nftIconInfo, // TODO: クラスにしろ
    required int postCount,
    required dynamic ref,
    required int reportCount,
    required double score,
    required Map<String, dynamic> searchToken,
    required String uid,
    required dynamic updatedAt,
    required DetectedImage userImage,
    required DetectedText userName,
    required List<Map<String, dynamic>> walletAddresses, // TODO: クラスにしろ
  }) = _FirestoreUser;

  factory FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$FirestoreUserFromJson(json);
  DocRef typedRef() => ref as DocRef;
}
