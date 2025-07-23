import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/core/constant/moderate_constant.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/moderated_image/moderated_image.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/detected_text/detected_text.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/post_model.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

@freezed
abstract class PostEntity with _$PostEntity {
  const PostEntity._();
  const factory PostEntity({
    required DateTime createdAt,
    required CustomCompleteText customCompleteText,
    required DetectedText description,
    required ModeratedImage image,
    required int likeCount,
    required int msgCount,
    required String postId,
    required DetectedText title,
    required String uid,
    required DateTime updatedAt,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);

  factory PostEntity.fromModel(PostModel model) {
    return PostEntity(
      createdAt:
          model.createdAt is Timestamp
              ? (model.createdAt as Timestamp).toDate()
              : model.createdAt ?? DateTime.now(),
      customCompleteText: model.customCompleteText,
      description: model.description,
      image: model.image,
      likeCount: model.likeCount,
      msgCount: model.msgCount,
      postId: model.postId,
      title: model.title,
      uid: model.uid,
      updatedAt:
          model.updatedAt is Timestamp
              ? (model.updatedAt as Timestamp).toDate()
              : model.updatedAt ?? DateTime.now(),
    );
  }

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
