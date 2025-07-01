import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/constant/moderate_constant.dart';
import 'package:great_talk/presentation/constant/msg_constants.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_text/detected_text.dart';

part 'public_user_entity.freezed.dart';
part 'public_user_entity.g.dart';

@freezed
abstract class PublicUserEntity with _$PublicUserEntity {
  const PublicUserEntity._();
  factory PublicUserEntity({
    required String accountName,
    required Map<String, dynamic> bio,
    required int blockCount,
    required dynamic createdAt,
    required String ethAddress,
    required int followerCount,
    required int followingCount,
    required bool isNFTicon,
    required bool isOfficial,
    required bool isSuspended,
    required List<Map<String, dynamic>> links,
    required int muteCount,
    required int postCount,
    required int reportCount,
    required double score,
    required Map<String, dynamic> searchToken,
    required String uid,
    required dynamic updatedAt,
    required Map<String, dynamic> image,
    required Map<String, dynamic> userName,
    required List<Map<String, dynamic>> walletAddresses,
  }) = _PublicUserEntity;

  factory PublicUserEntity.fromJson(Map<String, dynamic> json) =>
      _$PublicUserEntityFromJson(json);

  DetectedText typedBio() => DetectedText.fromJson(bio);
  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DetectedImage typedImage() => DetectedImage.fromJson(image);
  Timestamp typedUpdatedAtAt() => updatedAt as Timestamp;
  DetectedText typedUserName() => DetectedText.fromJson(userName);

  String get bioValue => typedBio().value;
  String get nameValue =>
      typedUserName().value.isEmpty
          ? MsgConstants.noName
          : typedUserName().value;
  bool get hasNoBio => bioValue.isEmpty;
  bool isInappropriate() =>
      typedImage().moderationLabels.isNotEmpty ||
      typedBio().negativeScore > ModerateConstant.negativeLimit ||
      typedUserName().negativeScore > ModerateConstant.negativeLimit;
  String inappropriateReason(String? currentUid) {
    String reason = "";
    final bioNS = typedBio().negativeScore;
    final userNameNS = typedUserName().negativeScore;
    final isMe = uid == currentUid;
    // 不適切なら理由を追加.
    if (typedImage().moderationLabels.isNotEmpty) {
      reason += "・写真が不適切です。\n";
      if (isMe) {
        String concatenatedNames = typedImage()
            .typedMLs()
            .map((ml) => ml.Name)
            .join(', ');
        reason += "(理由: $concatenatedNames)\n";
      }
    }
    if (bioNS > ModerateConstant.negativeLimit) {
      reason += "・紹介文がネガティブです。\n";
      if (isMe) reason += "(ネガティブスコア: $bioNS)\n(紹介文: ${typedBio().value})\n";
    }
    if (userNameNS > ModerateConstant.negativeLimit) {
      reason += "・ユーザー名がネガティブです。\n";
      if (isMe) {
        reason += "(ネガティブスコア: $userNameNS)\n(ユーザー名: $nameValue)\n";
      }
    }
    return reason;
  }
}
