import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/extensions/custom_date_time_formatting.dart';
import 'package:great_talk/model/database_schema/detected_text/detected_text.dart';
import 'package:great_talk/model/local_schema/save_text_msg/save_text_msg.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';

part 'text_message.freezed.dart';
part 'text_message.g.dart';

@freezed
abstract class TextMessage with _$TextMessage {
  const TextMessage._();
  const factory TextMessage(
      {required dynamic createdAt,
      required String id,
      required String messageType,
      dynamic messageRef,
      dynamic postRef,
      required String posterUid,
      required String senderUid,
      required SDMap text}) = _TextMessage;
  factory TextMessage.fromJson(Map<String, dynamic> json) =>
      _$TextMessageFromJson(json);
  factory TextMessage.fromSaveTextMsg(SaveTextMsg stm) => TextMessage(
      createdAt: Timestamp.fromDate(stm.createdAt),
      id: stm.id,
      messageType: stm.messageType,
      senderUid: stm.senderUid,
      posterUid: stm.posterUid,
      text: DetectedText.fromJson(stm.text).toJson());

  Timestamp typedCreatedAt() => createdAt as Timestamp;
  DocRef typedMessageRef() => messageRef as DocRef;
  DetectedText typedText() => DetectedText.fromJson(text);
  Timestamp typedUpdatedAtAt() => createdAt as Timestamp;

  DateTime get createdAtDateTime => typedCreatedAt().toDate();
  String timeCreatedAt() => createdAtDateTime.timeString();
}
