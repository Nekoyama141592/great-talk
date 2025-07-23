import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/common/moderated_image/moderated_image.dart';

class ModeratedImageConverter
    implements JsonConverter<ModeratedImage, Map<String, dynamic>> {
  const ModeratedImageConverter();

  @override
  ModeratedImage fromJson(Map<String, dynamic> json) =>
      ModeratedImage.fromJson(json);

  @override
  Map<String, dynamic> toJson(ModeratedImage object) => object.toJson();
}
