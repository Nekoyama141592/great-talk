import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/value/message_type.dart';
import 'package:great_talk/core/util/id_util.dart';
import 'package:great_talk/domain/converter/detected_text_converter.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/detected_text/detected_text.dart';
import 'package:great_talk/domain/entity/database/post/post_entity.dart';

part 'text_message.freezed.dart';
part 'text_message.g.dart';

@freezed
abstract class TextMessage with _$TextMessage {
  const TextMessage._();
  const factory TextMessage({
    required DateTime createdAt,
    required String id,
    required String messageType,
    required String senderUid,
    @DetectedTextConverter() required DetectedText text,
  }) = _TextMessage;
  factory TextMessage.fromJson(Map<String, dynamic> json) =>
      _$TextMessageFromJson(json);
  factory TextMessage.assistant(String content, PostEntity post) {
    return TextMessage(
      id: IdUtil.randomString(),
      createdAt: DateTime.now(),
      messageType: MessageType.text.name,
      text: DetectedText(value: content),
      senderUid: post.postId,
    );
  }
  factory TextMessage.user(String content, String currentUid) {
    return TextMessage(
      id: IdUtil.randomString(),
      createdAt: DateTime.now(),
      messageType: MessageType.text.name,
      text: DetectedText(value: content),
      senderUid: currentUid,
    );
  }

  DetectedText typedText() => text;
  String role(String postId) {
    return senderUid == postId ? 'assistant' : 'user';
  }
}
