import 'package:freezed_annotation/freezed_annotation.dart';

part 'detected_image.freezed.dart';
part 'detected_image.g.dart';

@freezed
abstract class DetectedImage with _$DetectedImage {
  const factory DetectedImage({
    required String bucketName,
    required List<Map<String, dynamic>> moderationLabels,
    required String moderationModelVersion,
    required String value, // オリジナルコンテンツならURL、ユーザーの投稿ならS3のファイル名
  }) = _DetectedImage;
  factory DetectedImage.fromJson(Map<String, dynamic> json) =>
      _$DetectedImageFromJson(json);
}
