import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_image_response.freezed.dart';
part 'generate_image_response.g.dart';

@freezed
abstract class GenerateImageResponse with _$GenerateImageResponse {
  const GenerateImageResponse._();
  const factory GenerateImageResponse({required String base64}) =
      _GenerateImageResponse;
  factory GenerateImageResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateImageResponseFromJson(json);
}
