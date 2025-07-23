import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_setting_state.freezed.dart';
part 'local_setting_state.g.dart';

@freezed
abstract class LocalSettingState with _$LocalSettingState {
  const LocalSettingState._();
  const factory LocalSettingState({
    @Default(true) bool needFirstMessage,
  }) = _LocalSettingState;
  factory LocalSettingState.fromJson(Map<String, dynamic> json) =>
      _$LocalSettingStateFromJson(json);
}
