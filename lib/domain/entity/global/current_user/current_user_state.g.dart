// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentUserState _$CurrentUserStateFromJson(Map<String, dynamic> json) =>
    _CurrentUserState(
      publicUser:
          json['publicUser'] == null
              ? null
              : PublicUserEntity.fromJson(
                json['publicUser'] as Map<String, dynamic>,
              ),
      privateUser:
          json['privateUser'] == null
              ? null
              : PrivateUserModel.fromJson(
                json['privateUser'] as Map<String, dynamic>,
              ),
      base64: json['base64'] as String?,
    );

Map<String, dynamic> _$CurrentUserStateToJson(_CurrentUserState instance) =>
    <String, dynamic>{
      'publicUser': instance.publicUser,
      'privateUser': instance.privateUser,
      'base64': instance.base64,
    };
