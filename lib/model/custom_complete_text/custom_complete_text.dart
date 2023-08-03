import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
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
  FunctionCall? typedFunctionCall() =>
      functionCall != null ? FunctionCall.values.byName(functionCall!) : null;
  List<FunctionData>? typedFunctions() => functions
      ?.map((e) => FunctionData(
          name: e['name'],
          description: e['description'],
          parameters: e['parameters']))
      .toList();
}
