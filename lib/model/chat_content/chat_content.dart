import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/post/post.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'chat_content.freezed.dart';
part 'chat_content.g.dart';

@freezed
abstract class ChatContent with _$ChatContent {
  const factory ChatContent({
    required String contentId,
    required String imageUrl,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    required String posterUid,
    required String title,
  }) = _ChatContent;
  factory ChatContent.fromJson(SDMap json) => _$ChatContentFromJson(json);
  factory ChatContent.fromPost(Post post) {
    return ChatContent(
        imageUrl: post.typedIconImage().url,
        contentId: post.postId,
        posterUid: post.typedPoster().uid,
        title: post.typedTitle().value);
  }
}
