import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_text_request_message.g.dart';
part 'generate_text_request_message.freezed.dart';

@freezed
abstract class GenerateTextRequestMessage with _$GenerateTextRequestMessage {
  const factory GenerateTextRequestMessage({
    required String role,
    required String content,
  }) = _GenerateTextRequestMessage;
  factory GenerateTextRequestMessage.fromJson(Map<String, dynamic> json) =>
      _$GenerateTextRequestMessageFromJson(json);
  factory GenerateTextRequestMessage.system(String content) {
    return GenerateTextRequestMessage(role: 'system', content: content);
  }
}
