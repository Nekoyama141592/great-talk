import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/constant/moderate_constant.dart';
import 'package:great_talk/infrastructure/model/database_schema/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/detected_text/detected_text.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

@freezed
abstract class PostEntity with _$PostEntity {
  const PostEntity._();
  const factory PostEntity({
    required int bookmarkCount,
    required dynamic createdAt,
    required Map<String, dynamic> customCompleteText,
    required Map<String, dynamic> description,
    required List<Map<String, dynamic>> exampleTexts,
    required String genre,
    required List<String> hashTags,
    required Map<String, dynamic> image,
    required int impressionCount,
    required int likeCount,
    required List<Map<String, dynamic>> links,
    required int msgCount,
    required int muteCount,
    required String postId,
    required int reportCount,
    required double score,
    required Map<String, dynamic> searchToken,
    required Map<String, dynamic> title,
    required String uid,
    required dynamic updatedAt,
    required int userCount,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);

  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DetectedText typedDescription() => DetectedText.fromJson(description);
  DetectedImage typedImage() => DetectedImage.fromJson(image);
  DetectedText typedTitle() => DetectedText.fromJson(title);
  Timestamp typedUpdatedAtAt() => updatedAt as Timestamp;

  bool isInappropriate() =>
      typedImage().moderationLabels.isNotEmpty ||
      typedDescription().negativeScore > ModerateConstant.negativeLimit;

  String inappropriateReason(String? currentUid) {
    String reason = "";
    // 不適切なら理由を追加.
    final titleNS = typedTitle().negativeScore;
    final descriptionNS = typedDescription().negativeScore;
    final isMe = uid == currentUid;
    if (titleNS > ModerateConstant.negativeLimit) {
      reason += "・タイトルがネガティブです。\n";
      if (isMe) {
        reason += "(ネガティブスコア: $titleNS)\n(タイトル: ${typedTitle().value})\n";
      }
    }
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
    if (descriptionNS > ModerateConstant.negativeLimit) {
      reason += "・説明文がネガティブです。\n";
      if (isMe) {
        reason +=
            "(ネガティブスコア: $descriptionNS)\n(説明文: ${typedDescription().value})\n";
      }
    }
    return reason;
  }

  CustomCompleteText typedCustomCompleteText() {
    return CustomCompleteText.fromJson(customCompleteText);
  }
}
