import 'package:freezed_annotation/freezed_annotation.dart';

part 'detected_text.freezed.dart';
part 'detected_text.g.dart';

/*
Firestoreで使用する際の名前は
"image"で統一する。
 */
@freezed
abstract class DetectedText with _$DetectedText {
  const factory DetectedText({
    @Default("") String languageCode,
    @Default(0) int negativeScore,
    @Default(0) int positiveScore,
    @Default("") String sentiment,
    @Default("") String value,
  }) = _DetectedText;
  factory DetectedText.fromJson(Map<String, dynamic> json) =>
      _$DetectedTextFromJson(json);
}
