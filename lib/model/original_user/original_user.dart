import 'package:freezed_annotation/freezed_annotation.dart';

part 'original_user.freezed.dart';

@freezed
class OriginalUser with _$OriginalUser {
  factory OriginalUser({
    required String accountName,
    required String bio,
    required String bioLanguageCode,
    required double bioNegativeScore,
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
    required String userImageURL,
    required double userImageNegativeScore,
    required String userName,
    required String userNameLanguageCode,
    required double userNameNegativeScore,
    required List<Map<String, dynamic>> walletAddresses, // TODO: クラスにしろ
  }) = _OriginalUser;

  factory OriginalUser.fromJson(Map<String, dynamic> json) =>
      _$OriginalUserFromJson(json);
}
