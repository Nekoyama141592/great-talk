import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:great_talk/consts/form_consts.dart';

part 'create_post_state.freezed.dart';
part 'create_post_state.g.dart';

@freezed
abstract class CreatePostState with _$CreatePostState {
  const factory CreatePostState({
    // タイトル
    @Default('') String title,
    // システムプロンプト
    @Default(FormConsts.defaultSystemPrompt) String systemPrompt,
    // 説明
    @Default('') String description,
    // Temperature
    @Default(FormConsts.defaultTemperature) double temperature,
    // Top P
    @Default(FormConsts.defaultTopP) double topP,
    // Presence Penalty
    @Default(FormConsts.defaultPresencePenalty) double presencePenalty,
    // Frequency Penalty
    @Default(FormConsts.defaultFrequencyPenalty) double frequencyPenalty,
    String? pickedImage,
  }) = _CreatePostState;

  factory CreatePostState.fromJson(Map<String, dynamic> json) =>
      _$CreatePostStateFromJson(json);
}