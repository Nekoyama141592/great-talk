import 'package:freezed_annotation/freezed_annotation.dart';

part 'detected_text.freezed.dart';
part 'detected_text.g.dart';

@freezed
abstract class DetectedText with _$DetectedText {
  const factory DetectedText(
      {required String languageCode,
      required double negativeScore,
      required double positiveScore,
      required String sentiment,
      required String value}) = _DetectedText;
  factory DetectedText.fromJson(Map<String, dynamic> json) =>
      _$DetectedTextFromJson(json);
}