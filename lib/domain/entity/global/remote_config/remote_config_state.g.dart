// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteConfigState _$RemoteConfigStateFromJson(Map<String, dynamic> json) =>
    _RemoteConfigState(
      maintenanceMsg: json['maintenanceMsg'] as String? ?? '',
      forcedUpdateVersion: (json['forcedUpdateVersion'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RemoteConfigStateToJson(_RemoteConfigState instance) =>
    <String, dynamic>{
      'maintenanceMsg': instance.maintenanceMsg,
      'forcedUpdateVersion': instance.forcedUpdateVersion,
    };
