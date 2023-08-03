import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/typedefs/firestore_typedef.dart';
part 'custom_complete_text.freezed.dart';
part 'custom_complete_text.g.dart';

@freezed
abstract class CustomCompleteText with _$CustomCompleteText {
  const factory CustomCompleteText({
    required String systemPrompt,
    double? temperature,
    double? topP,
    int? n,
    bool? stream,
    List<String>? stop,
    int? maxToken,
    double? presencePenalty,
    double? frequencyPenalty,
    List<SDMap>? functions,
    String? functionCall,
  }) = _CustomCompleteText;
  factory CustomCompleteText.fromJson(SDMap json) =>
      _$CustomCompleteTextFromJson(json);
}
