import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/moderated_image/moderation_label/moderation_label.dart';

part 'moderated_image.freezed.dart';
part 'moderated_image.g.dart';

@freezed
abstract class ModeratedImage with _$ModeratedImage {
  const ModeratedImage._();
  const factory ModeratedImage({
    @Default("") String bucketName,
    @Default([]) List<Map<String, dynamic>> moderationLabels,
    @Default("") String moderationModelVersion,
    @Default("") String value, // S3のファイル名
  }) = _ModeratedImage;
  factory ModeratedImage.fromJson(Map<String, dynamic> json) =>
      _$ModeratedImageFromJson(json);
  List<ModerationLabel> typedMLs() =>
      moderationLabels.map((e) => ModerationLabel.fromJson(e)).toList();
}
