import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/text_message/text_message.dart';

part 'save_text_msg.freezed.dart';
part 'save_text_msg.g.dart';

@freezed
abstract class SaveTextMsg with _$SaveTextMsg {
  const SaveTextMsg._();
  const factory SaveTextMsg({
    required DateTime createdAt,
    required String id,
    required String messageType,
    required String senderUid,
    required Map<String, dynamic> text,
  }) = _SaveTextMsg;
  factory SaveTextMsg.fromJson(Map<String, dynamic> json) =>
      _$SaveTextMsgFromJson(json);
  factory SaveTextMsg.fromTextMessage(TextMessage textMessage) => SaveTextMsg(
    createdAt: textMessage.typedCreatedAt().toDate(),
    id: textMessage.id,
    messageType: textMessage.messageType,
    senderUid: textMessage.senderUid,
    text: textMessage.typedText().toJson(),
  );
}
