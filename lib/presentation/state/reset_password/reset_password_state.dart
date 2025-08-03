import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';
part 'reset_password_state.g.dart';

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const ResetPasswordState._();
  const factory ResetPasswordState({
    @Default(false) bool isLoading,
    @Default(0) int resendLeftTime,
  }) = _ResetPasswordState;

  factory ResetPasswordState.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordStateFromJson(json);
}
