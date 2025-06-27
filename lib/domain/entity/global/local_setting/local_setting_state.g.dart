// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_setting_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocalSettingState _$LocalSettingStateFromJson(Map<String, dynamic> json) =>
    _LocalSettingState(
      isDarkTheme: json['isDarkTheme'] as bool? ?? true,
      needFirstMessage: json['needFirstMessage'] as bool? ?? true,
    );

Map<String, dynamic> _$LocalSettingStateToJson(_LocalSettingState instance) =>
    <String, dynamic>{
      'isDarkTheme': instance.isDarkTheme,
      'needFirstMessage': instance.needFirstMessage,
    };
