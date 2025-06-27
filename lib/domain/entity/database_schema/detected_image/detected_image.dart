import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/domain/entity/database_schema/moderation_label/moderation_label.dart';

part 'detected_image.freezed.dart';
part 'detected_image.g.dart';

@freezed
abstract class DetectedImage with _$DetectedImage {
  const DetectedImage._();
  const factory DetectedImage({
    @Default("") String bucketName,
    @Default([]) List<Map<String, dynamic>> moderationLabels,
    @Default("") String moderationModelVersion,
    @Default("") String value, // S3のファイル名
  }) = _DetectedImage;
  factory DetectedImage.fromJson(Map<String, dynamic> json) =>
      _$DetectedImageFromJson(json);
  List<ModerationLabel> typedMLs() =>
      moderationLabels.map((e) => ModerationLabel.fromJson(e)).toList();
}
