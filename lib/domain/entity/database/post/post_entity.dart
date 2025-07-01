import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/constant/moderate_constant.dart';
import 'package:great_talk/domain/converter/timestamp_converter.dart';
import 'package:great_talk/infrastructure/model/database_schema/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_text/detected_text.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

@freezed
abstract class PostEntity with _$PostEntity {
  const PostEntity._();
  const factory PostEntity({
    @TimestampConverter() DateTime? createdAt,
    required CustomCompleteText customCompleteText,
    required DetectedText description,
    required DetectedImage image,
    required int likeCount,
    required int msgCount,
    required String postId,
    required DetectedText title,
    required String uid,
    @TimestampConverter() DateTime? updatedAt,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);

  bool isInappropriate() =>
      image.moderationLabels.isNotEmpty ||
      description.negativeScore > ModerateConstant.negativeLimit;

  String inappropriateReason(String? currentUid) {
    String reason = "";
    // 不適切なら理由を追加.
    final titleNS = title.negativeScore;
    final descriptionNS = description.negativeScore;
    final isMe = uid == currentUid;
    if (titleNS > ModerateConstant.negativeLimit) {
      reason += "・タイトルがネガティブです。\n";
      if (isMe) {
        reason += "(ネガティブスコア: $titleNS)\n(タイトル: ${title.value})\n";
      }
    }
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
    if (descriptionNS > ModerateConstant.negativeLimit) {
      reason += "・説明文がネガティブです。\n";
      if (isMe) {
        reason += "(ネガティブスコア: $descriptionNS)\n(説明文: ${description.value})\n";
      }
    }
    return reason;
  }
}
