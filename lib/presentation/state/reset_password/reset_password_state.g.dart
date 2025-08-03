// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResetPasswordState _$ResetPasswordStateFromJson(Map<String, dynamic> json) =>
    _ResetPasswordState(
      isLoading: json['isLoading'] as bool? ?? false,
      resendLeftTime: (json['resendLeftTime'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ResetPasswordStateToJson(_ResetPasswordState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'resendLeftTime': instance.resendLeftTime,
    };
