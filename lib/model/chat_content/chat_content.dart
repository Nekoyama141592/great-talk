import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/common/ints.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/infrastructure/firestore/firestore_queries.dart';
import 'package:great_talk/model/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/model/detected_image/detected_image.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
import 'package:great_talk/utility/new_content.dart';

part 'chat_content.freezed.dart';
part 'chat_content.g.dart';

@freezed
abstract class ChatContent implements _$ChatContent {
  const ChatContent._();
  const factory ChatContent({
    required String contentId,
    SDMap? customCompleteText,
    SDMap? description,
    SDMap? image,
    required String imageValue,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    required String posterUid,
    dynamic ref,
    required String title,
  }) = _ChatContent;
  factory ChatContent.fromJson(SDMap json) => _$ChatContentFromJson(json);
  factory ChatContent.fromPost(Post post) {
    return ChatContent(
        customCompleteText: post.customCompleteText,
        description: post.description,
        image: post.image,
        imageValue: post.typedImage().value,
        contentId: post.postId,
        posterUid: post.typedPoster().uid,
        ref: post.ref,
        title: post.typedTitle().value);
  }
  CustomCompleteText? typedCustomCompleteText() => customCompleteText != null
      ? CustomCompleteText.fromJson(customCompleteText!)
      : null;
  DetectedText typedDescription() {
    if (returnIsOriginalContents(posterUid)) {
      return NewContent.newDetectedText('$titleのAIです。');
    } else {
      return DetectedText.fromJson(description!);
    }
  }

  DetectedImage typedImage() {
    if (returnIsOriginalContents(posterUid)) {
      return NewContent.newDetectedImage('', imageValue);
    } else {
      return DetectedImage.fromJson(image!);
    }
  }

  CustomCompleteText managedCustomCompleteText() {
    final completeText = typedCustomCompleteText();
    String systemPrompt = completeText?.systemPrompt ?? "";
    if (proIds.contains(contentId)) {
      systemPrompt =
          "あなたは一人のプロの$titleです。それになりきって以下の問いに答えて下さい。自分がAIアシスタントだとは答えないで下さい。";
    } else if (greatIds.contains(contentId)) {
      systemPrompt =
          "$titleになりきって$titleの口調で以下の問いに答えてください。自分がAIアシスタントだとは答えないで下さい。";
    }
    return CustomCompleteText(
        systemPrompt: systemPrompt,
        temperature: completeText?.temperature,
        topP: completeText?.topP,
        presencePenalty: completeText?.presencePenalty ?? 0.0,
        frequencyPenalty: completeText?.frequencyPenalty ?? 0.0);
  }

  DocRef typedRef() {
    if (returnIsOriginalContents(posterUid)) {
      return FirestoreQueries.originalContentDocRef(contentId);
    } else {
      return ref as DocRef;
    }
  }

  bool isInappropriate() =>
      typedImage().moderationLabels.isNotEmpty ||
      typedDescription().negativeScore > negativeLimit;
  String inappropriateReason() {
    String reason = "";
    if (typedImage().moderationLabels.isNotEmpty) {
      reason += "・写真が不適切です。\n";
    }
    if (typedDescription().negativeScore > negativeLimit) {
      reason += "・説明文がネガティブです。\n";
    }
    return reason;
  }
}
