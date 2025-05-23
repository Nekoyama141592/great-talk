import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/ints.dart';
import 'package:great_talk/model/database_schema/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/model/database_schema/detected_image/detected_image.dart';
import 'package:great_talk/model/database_schema/detected_text/detected_text.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  const Post._();
  const factory Post({
    @Default(0) int bookmarkCount,
    required dynamic createdAt,
    required SDMap customCompleteText,
    required SDMap description,
    @Default([]) List<SDMap> exampleTexts,
    @Default("") String genre,
    @Default([]) List<String> hashTags,
    required SDMap image,
    @Default(0) int impressionCount,
    @Default(0) int likeCount,
    @Default([]) List<SDMap> links,
    @Default(0) int msgCount,
    @Default(0) int muteCount,
    required String postId,
    required dynamic ref,
    @Default(0) int reportCount,
    @Default(0.0) double score,
    required SDMap searchToken,
    required SDMap title,
    required String uid,
    required dynamic updatedAt,
    @Default(0) int userCount,
  }) = _Post;
  factory Post.fromJson(SDMap json) => _$PostFromJson(json);
  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DetectedText typedDescription() => DetectedText.fromJson(description);
  DetectedImage typedImage() => DetectedImage.fromJson(image);
  DocRef typedRef() => ref as DocRef;
  DetectedText typedTitle() => DetectedText.fromJson(title);
  Timestamp typedUpdatedAtAt() => updatedAt as Timestamp;
  bool isInappropriate() =>
      typedImage().moderationLabels.isNotEmpty ||
      typedDescription().negativeScore > negativeLimit;

  String inappropriateReason(String? currentUid) {
    String reason = "";
    // 不適切なら理由を追加.
    final titleNS = typedTitle().negativeScore;
    final descriptionNS = typedDescription().negativeScore;
    final isMe = uid == currentUid;
    if (titleNS > negativeLimit) {
      reason += "・タイトルがネガティブです。\n";
      if (isMe) {
        reason += "(ネガティブスコア: $titleNS)\n(タイトル: ${typedTitle().value})\n";
      }
    }
    if (typedImage().moderationLabels.isNotEmpty) {
      reason += "・写真が不適切です。\n";
      if (isMe) {
        String concatenatedNames =
            typedImage().typedMLs().map((ml) => ml.Name).join(', ');
        reason += "(理由: $concatenatedNames)\n";
      }
    }
    if (descriptionNS > negativeLimit) {
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
