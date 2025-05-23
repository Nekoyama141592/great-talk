// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteConfigState _$RemoteConfigStateFromJson(Map<String, dynamic> json) =>
    _RemoteConfigState(
      maintenanceMode: json['maintenanceMode'] as bool? ?? false,
      maintenanceMsg: json['maintenanceMsg'] as String? ?? '',
      forcedUpdateVersion: (json['forcedUpdateVersion'] as num?)?.toInt() ?? 0,
      forcedUpdateMsg: json['forcedUpdateMsg'] as String? ?? '',
      basicModel: json['basicModel'] as String? ?? '',
      premiumModel: json['premiumModel'] as String? ?? '',
    );

Map<String, dynamic> _$RemoteConfigStateToJson(_RemoteConfigState instance) =>
    <String, dynamic>{
      'maintenanceMode': instance.maintenanceMode,
      'maintenanceMsg': instance.maintenanceMsg,
      'forcedUpdateVersion': instance.forcedUpdateVersion,
      'forcedUpdateMsg': instance.forcedUpdateMsg,
      'basicModel': instance.basicModel,
      'premiumModel': instance.premiumModel,
    };
