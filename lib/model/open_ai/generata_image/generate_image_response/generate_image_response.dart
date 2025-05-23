import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/open_ai/generata_image/generate_image_data/generate_image_data.dart';

part 'generate_image_response.freezed.dart';
part 'generate_image_response.g.dart';

@freezed
abstract class GenerateImageResponse with _$GenerateImageResponse {
  const factory GenerateImageResponse({
    List<GenerateImageData?>? data,
  }) = _GenerateImageResponse;
  factory GenerateImageResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateImageResponseFromJson(json);
}
