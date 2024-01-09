import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/model/moderation_label/moderation_label.dart';

part 'detected_image.freezed.dart';
part 'detected_image.g.dart';

@freezed
abstract class DetectedImage implements _$DetectedImage {
  const DetectedImage._();
  const factory DetectedImage({
    required String bucketName,
    @Default([]) List<Map<String, dynamic>> moderationLabels,
    @Default("") String moderationModelVersion,
    required String value, // オリジナルコンテンツならURL、ユーザーの投稿ならS3のファイル名
  }) = _DetectedImage;
  factory DetectedImage.fromJson(Map<String, dynamic> json) =>
      _$DetectedImageFromJson(json);
  List<ModerationLabel> typedMLs() =>
      moderationLabels.map((e) => ModerationLabel.fromJson(e)).toList();
}
