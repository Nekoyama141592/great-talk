import 'package:freezed_annotation/freezed_annotation.dart';

part 'moderation_label.freezed.dart';
part 'moderation_label.g.dart';

@freezed
abstract class ModerationLabel implements _$ModerationLabel {
  const factory ModerationLabel({
    required num Confidence,
    required String Name,
    required String ParentName,
  }) = _ModerationLabel;
  factory ModerationLabel.fromJson(Map<String, dynamic> json) =>
      _$ModerationLabelFromJson(json);
}
