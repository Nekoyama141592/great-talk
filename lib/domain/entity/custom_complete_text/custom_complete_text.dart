import 'package:freezed_annotation/freezed_annotation.dart';
part 'custom_complete_text.freezed.dart';
part 'custom_complete_text.g.dart';

@freezed
abstract class CustomCompleteText with _$CustomCompleteText {
  const CustomCompleteText._();
  const factory CustomCompleteText({required String systemPrompt}) =
      _CustomCompleteText;
  factory CustomCompleteText.fromJson(Map<String, dynamic> json) =>
      _$CustomCompleteTextFromJson(json);
}
