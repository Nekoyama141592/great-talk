import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_image_data.freezed.dart';
part 'generate_image_data.g.dart';

@freezed
abstract class GenerateImageData with _$GenerateImageData {
  const factory GenerateImageData({required String url}) = _GenerateImageData;
  factory GenerateImageData.fromJson(Map<String, dynamic> json) =>
      _$GenerateImageDataFromJson(json);
}
