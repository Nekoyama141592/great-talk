import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/enums.dart';
import 'package:great_talk/core/id_core.dart';
import 'package:great_talk/extension/custom_date_time_formatting.dart';
import 'package:great_talk/model/database_schema/detected_text/detected_text.dart';
import 'package:great_talk/model/database_schema/post/post.dart';
import 'package:great_talk/model/local_schema/save_text_msg/save_text_msg.dart';

part 'text_message.freezed.dart';
part 'text_message.g.dart';

@freezed
abstract class TextMessage with _$TextMessage {
  const TextMessage._();
  const factory TextMessage({
    required dynamic createdAt,
    required String id,
    required String messageType,
    required String senderUid,
    required Map<String, dynamic> text,
  }) = _TextMessage;
  factory TextMessage.fromJson(Map<String, dynamic> json) =>
      _$TextMessageFromJson(json);
  factory TextMessage.assistant(String content, Post post) {
    return TextMessage(
      id: IdCore.randomString(),
      createdAt: Timestamp.now(),
      messageType: MessageType.text.name,
      text: DetectedText(value: content).toJson(),
      senderUid: post.postId,
    );
  }
  factory TextMessage.user(String content, String currentUid) {
    return TextMessage(
      id: IdCore.randomString(),
      createdAt: Timestamp.now(),
      messageType: MessageType.text.name,
      text: DetectedText(value: content).toJson(),
      senderUid: currentUid,
    );
  }
  factory TextMessage.fromSaveTextMsg(SaveTextMsg stm) => TextMessage(
    createdAt: Timestamp.fromDate(stm.createdAt),
    id: stm.id,
    messageType: stm.messageType,
    senderUid: stm.senderUid,
    text: DetectedText.fromJson(stm.text).toJson(),
  );

  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DetectedText typedText() => DetectedText.fromJson(text);
  Timestamp typedUpdatedAtAt() => createdAt as Timestamp;

  DateTime get createdAtDateTime => typedCreatedAt().toDate();
  String timeCreatedAt() => createdAtDateTime.timeString();

  String role(String postId) {
    return senderUid == postId ? 'assistant' : 'user';
  }
}
