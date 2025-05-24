// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EditState _$EditStateFromJson(Map<String, dynamic> json) => _EditState(
  bio: json['bio'] as String,
  userName: json['userName'] as String,
  base64: json['base64'] as String,
  isPicked: json['isPicked'] as bool? ?? false,
);

Map<String, dynamic> _$EditStateToJson(_EditState instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'userName': instance.userName,
      'base64': instance.base64,
      'isPicked': instance.isPicked,
    };
