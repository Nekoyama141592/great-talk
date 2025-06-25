import 'package:freezed_annotation/freezed_annotation.dart';

part 'generate_image_state.freezed.dart';
part 'generate_image_state.g.dart';

@freezed
abstract class GenerateImageState with _$GenerateImageState {
  const GenerateImageState._();
  const factory GenerateImageState({
    @Default('') String prompt,
    @Default('') String size,
    String? base64,
  }) = _GenerateImageState;
  factory GenerateImageState.fromJson(Map<String, dynamic> json) =>
      _$GenerateImageStateFromJson(json);
}
