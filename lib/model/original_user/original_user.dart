import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';

part 'original_user.freezed.dart';

@freezed
class OriginalUser with _$OriginalUser {
  factory OriginalUser({
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
    required int reportCount,
    required double score,
    required Map<String, dynamic> searchToken,
    required String uid,
    required dynamic updatedAt,
    required DetectedImage userImage,
    required DetectedText userName,
    required List<Map<String, dynamic>> walletAddresses, // TODO: クラスにしろ
  }) = _OriginalUser;

  factory OriginalUser.fromJson(Map<String, dynamic> json) =>
      _$OriginalUserFromJson(json);
}
