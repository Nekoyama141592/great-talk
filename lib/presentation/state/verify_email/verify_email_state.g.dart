// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyEmailState _$VerifyEmailStateFromJson(Map<String, dynamic> json) =>
    _VerifyEmailState(
      email: json['email'] as String,
      canResend: json['canResend'] as bool? ?? false,
      resendSecondsLeft: (json['resendSecondsLeft'] as num?)?.toInt() ?? 60,
    );

Map<String, dynamic> _$VerifyEmailStateToJson(_VerifyEmailState instance) =>
    <String, dynamic>{
      'email': instance.email,
      'canResend': instance.canResend,
      'resendSecondsLeft': instance.resendSecondsLeft,
    };
