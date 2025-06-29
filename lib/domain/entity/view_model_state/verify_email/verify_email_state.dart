import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_email_state.freezed.dart';
part 'verify_email_state.g.dart';

@freezed
abstract class VerifyEmailState with _$VerifyEmailState {
  const VerifyEmailState._();
  const factory VerifyEmailState({
    required String email,
    @Default(false) bool canResend,
    @Default(60) int resendSecondsLeft,
  }) = _VerifyEmailState;

  factory VerifyEmailState.fromJson(Map<String, dynamic> json) =>
      _$VerifyEmailStateFromJson(json);
}
