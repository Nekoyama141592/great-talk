import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_text_response.freezed.dart';
part 'generate_text_response.g.dart';

@freezed
abstract class GenerateTextResponse with _$GenerateTextResponse {
  const factory GenerateTextResponse({
    required String model,
    required String content
  }) = _GenerateTextResponse;
  factory GenerateTextResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateTextResponseFromJson(json);
}
