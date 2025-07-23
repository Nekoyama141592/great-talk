import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/infrastructure/model/database_schema/post/custom_complete_text/custom_complete_text.dart';

class CustomCompleteTextConverter
    implements JsonConverter<CustomCompleteText, Map<String, dynamic>> {
  const CustomCompleteTextConverter();

  @override
  CustomCompleteText fromJson(Map<String, dynamic> json) =>
      CustomCompleteText.fromJson(json);

  @override
  Map<String, dynamic> toJson(CustomCompleteText object) => object.toJson();
}
