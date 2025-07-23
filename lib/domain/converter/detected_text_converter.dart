import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/detected_text/detected_text.dart';

class DetectedTextConverter
    implements JsonConverter<DetectedText, Map<String, dynamic>> {
  const DetectedTextConverter();

  @override
  DetectedText fromJson(Map<String, dynamic> json) =>
      DetectedText.fromJson(json);

  @override
  Map<String, dynamic> toJson(DetectedText object) => object.toJson();
}
