import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
part 'custom_complete_text.freezed.dart';
part 'custom_complete_text.g.dart';

@freezed
abstract class CustomCompleteText implements _$CustomCompleteText {
  const CustomCompleteText._();
  const factory CustomCompleteText({
    required String systemPrompt,
    double? temperature,
    double? topP,
    double? presencePenalty,
    double? frequencyPenalty,
  }) = _CustomCompleteText;
  factory CustomCompleteText.fromJson(SDMap json) =>
      _$CustomCompleteTextFromJson(json);
}
