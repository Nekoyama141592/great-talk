import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/open_ai_constants.dart';

part 'generate_image_request.freezed.dart';
part 'generate_image_request.g.dart';

@freezed
abstract class GenerateImageRequest with _$GenerateImageRequest {
  const factory GenerateImageRequest({
    @Default(OpenAIConstants.imageModel) String model,
    required String prompt,
    @Default(1) int n,
    required String size,
    required String user,
  }) = _GenerateImageRequest;
  factory GenerateImageRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateImageRequestFromJson(json);
}
