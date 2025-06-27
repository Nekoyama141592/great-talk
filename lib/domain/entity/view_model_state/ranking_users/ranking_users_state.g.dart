// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_users_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageUser _$ImageUserFromJson(Map<String, dynamic> json) => _ImageUser(
  imageUsers:
      (json['imageUsers'] as List<dynamic>)
          .map((e) => ImageUser.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ImageUserToJson(_ImageUser instance) =>
    <String, dynamic>{'imageUsers': instance.imageUsers};
