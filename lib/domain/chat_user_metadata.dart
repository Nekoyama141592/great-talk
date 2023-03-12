import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_user_metadata.freezed.dart';
part 'chat_user_metadata.g.dart';

@freezed
abstract class ChatUserMetadata with _$ChatUserMetadata {
 const factory ChatUserMetadata({
   required String lastAnswer,
   required int lastSeen
  }) = _ChatUserMetadata;
 factory ChatUserMetadata.fromJson(Map<String, dynamic> json) => _$ChatUserMetadataFromJson(json);
}