import 'package:freezed_annotation/freezed_annotation.dart';

part 'detected_image.freezed.dart';
part 'detected_image.g.dart';

@freezed
abstract class DetectedImage with _$DetectedImage {
  const factory DetectedImage({
    required List<Map<String, dynamic>> moderationLabels,
    required String moderationModelVersion,
    required String url,
  }) = _DetectedImage;
  factory DetectedImage.fromJson(Map<String, dynamic> json) =>
      _$DetectedImageFromJson(json);
}
