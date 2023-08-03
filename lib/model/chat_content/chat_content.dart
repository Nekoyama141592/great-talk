import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/common/persons.dart';
import 'package:great_talk/model/custom_complete_text/custom_complete_text.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'chat_content.freezed.dart';
part 'chat_content.g.dart';

@freezed
abstract class ChatContent implements _$ChatContent {
  ChatContent._();
  const factory ChatContent({
    required String contentId,
    SDMap? customCompleteText,
    required String imageUrl,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    required String posterUid,
    required String title,
  }) = _ChatContent;
  factory ChatContent.fromJson(SDMap json) => _$ChatContentFromJson(json);
  factory ChatContent.fromPost(Post post) {
    return ChatContent(
        customCompleteText: post.customCompleteText,
        imageUrl: post.typedIconImage().url,
        contentId: post.postId,
        posterUid: post.typedPoster().uid,
        title: post.typedTitle().value);
  }
  CustomCompleteText? typedCustomCompleteText() => customCompleteText != null
      ? CustomCompleteText.fromJson(customCompleteText!)
      : null;
  CustomCompleteText managedCustomCompleteText() {
    String systemPrompt = typedCustomCompleteText()?.systemPrompt ?? "";
    if (proIds.contains(contentId)) {
      systemPrompt =
          "あなたは一人のプロの$titleです。それになりきって以下の問いに答えて下さい。自分がAIアシスタントだとは答えないで下さい。";
    } else if (greatIds.contains(contentId)) {
      "$titleになりきって$titleの口調で以下の問いに答えてください。自分がAIアシスタントだとは答えないで下さい。";
    }
    return CustomCompleteText(systemPrompt: systemPrompt);
  }
}
