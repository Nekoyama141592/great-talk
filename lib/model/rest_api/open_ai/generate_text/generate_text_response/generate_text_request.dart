import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_text_request.freezed.dart';
part 'generate_text_request.g.dart';

@freezed
abstract class GenerateTextRequest with _$GenerateTextRequest {
  const factory GenerateTextRequest({
    required String model,
    required List<Map<String, dynamic>> messages,
    List<Map<String, dynamic>>? tools,
    Map<String, dynamic>? tool_choice,
  }) = _GenerateTextRequest;
  factory GenerateTextRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateTextRequestFromJson(json);
}
