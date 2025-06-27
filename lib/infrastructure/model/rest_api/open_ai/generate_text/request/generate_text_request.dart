import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/rest_api/open_ai/generate_text/request/message/generate_text_request_message.dart';

part 'generate_text_request.freezed.dart';
part 'generate_text_request.g.dart';

@freezed
abstract class GenerateTextRequest with _$GenerateTextRequest {
  const factory GenerateTextRequest({
    required String model,
    required List<Map<String, dynamic>> messages,
  }) = _GenerateTextRequest;
  factory GenerateTextRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateTextRequestFromJson(json);
  factory GenerateTextRequest.fromMessages(
    String model,
    List<GenerateTextRequestMessage> messages,
  ) {
    final values = messages.map((e) => e.toJson()).toList();
    return GenerateTextRequest(model: model, messages: values);
  }
}
