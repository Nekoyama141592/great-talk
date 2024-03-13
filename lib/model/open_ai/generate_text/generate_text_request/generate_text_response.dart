import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_text_response.freezed.dart';
part 'generate_text_response.g.dart';

@freezed
abstract class GenerateTextResponse implements _$GenerateTextResponse {
  const factory GenerateTextResponse(
      {required List<Map<String, dynamic>> choices}) = _GenerateTextResponse;
  factory GenerateTextResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateTextResponseFromJson(json);
}
