import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_image_request.freezed.dart';
part 'generate_image_request.g.dart';

@freezed
abstract class GenerateImageRequest implements _$GenerateImageRequest {
  const GenerateImageRequest._();
  const factory GenerateImageRequest(
      {required String prompt, required String size}) = _GenerateImageRequest;
  factory GenerateImageRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateImageRequestFromJson(json);
}
