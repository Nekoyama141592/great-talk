import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/constant/moderate_constant.dart';
import 'package:great_talk/domain/converter/timestamp_converter.dart';
import 'package:great_talk/presentation/constant/msg_constants.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_text/detected_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/public_user/public_user_model.dart';

part 'public_user_entity.freezed.dart';
part 'public_user_entity.g.dart';

@freezed
abstract class PublicUserEntity with _$PublicUserEntity {
  const PublicUserEntity._();
  factory PublicUserEntity({
    required DetectedText bio,
    @TimestampConverter() DateTime? createdAt,
    required int followerCount,
    required int followingCount,
    required bool isOfficial,
    required int postCount,
    required String uid,
    @TimestampConverter() DateTime? updatedAt,
    required DetectedImage image,
    required DetectedText userName,
  }) = _PublicUserEntity;

  factory PublicUserEntity.fromJson(Map<String, dynamic> json) =>
      _$PublicUserEntityFromJson(json);

  factory PublicUserEntity.fromModel(PublicUserModel model) {
    return PublicUserEntity(
      bio: DetectedText.fromJson(model.bio),
      createdAt:
          model.createdAt is Timestamp
              ? (model.createdAt as Timestamp).toDate()
              : model.createdAt,
      followerCount: model.followerCount,
      followingCount: model.followingCount,
      isOfficial: model.isOfficial,
      postCount: model.postCount,
      uid: model.uid,
      updatedAt:
          model.updatedAt is Timestamp
              ? (model.updatedAt as Timestamp).toDate()
              : model.updatedAt,
      image: DetectedImage.fromJson(model.image),
      userName: DetectedText.fromJson(model.userName),
    );
  }

  String get bioValue => bio.value;
  String get nameValue =>
      userName.value.isEmpty ? MsgConstants.noName : userName.value;
  bool get hasNoBio => bioValue.isEmpty;
  bool isInappropriate() =>
      image.moderationLabels.isNotEmpty ||
      bio.negativeScore > ModerateConstant.negativeLimit ||
      userName.negativeScore > ModerateConstant.negativeLimit;
  String inappropriateReason(String? currentUid) {
    String reason = "";
    final bioNS = bio.negativeScore;
    final userNameNS = userName.negativeScore;
    final isMe = uid == currentUid;
    // 不適切なら理由を追加.
    if (image.moderationLabels.isNotEmpty) {
      reason += "・写真が不適切です。\n";
      if (isMe) {
        String concatenatedNames = image
            .typedMLs()
            .map((ml) => ml.Name)
            .join(', ');
        reason += "(理由: $concatenatedNames)\n";
      }
    }
    if (bioNS > ModerateConstant.negativeLimit) {
      reason += "・紹介文がネガティブです。\n";
      if (isMe) reason += "(ネガティブスコア: $bioNS)\n(紹介文: ${bio.value})\n";
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
