import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/detected_text/detected_text.dart';
import 'package:great_talk/model/text_message/text_message.dart';

part 'save_text_msg.freezed.dart';
part 'save_text_msg.g.dart';

@freezed
abstract class SaveTextMsg implements _$SaveTextMsg {
  const SaveTextMsg._();
  const factory SaveTextMsg(
      {required DateTime createdAt,
      required String id,
      required String messageType,
      required dynamic messageRef,
      required String uid,
      required DateTime updatedAt,
      required DetectedText text}) = _SaveTextMsg;
  factory SaveTextMsg.fromJson(Map<String, dynamic> json) =>
      _$SaveTextMsgFromJson(json);
  factory SaveTextMsg.fromTextMessage(TextMessage textMessage) => SaveTextMsg(
      createdAt: textMessage.typedCreatedAt().toDate(),
      id: textMessage.id,
      messageType: textMessage.messageType,
      messageRef: textMessage.messageRef,
      uid: textMessage.uid,
      updatedAt: textMessage.typedUpdatedAtAt().toDate(),
      text: textMessage.text);
}
