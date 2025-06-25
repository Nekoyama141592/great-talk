// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_users_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MuteUsersState _$MuteUsersStateFromJson(Map<String, dynamic> json) =>
    _MuteUsersState(
      imageUsers:
          (json['imageUsers'] as List<dynamic>)
              .map((e) => ImageUser.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$MuteUsersStateToJson(_MuteUsersState instance) =>
    <String, dynamic>{'imageUsers': instance.imageUsers};
