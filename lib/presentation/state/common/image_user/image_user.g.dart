// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImageUser _$ImageUserFromJson(Map<String, dynamic> json) => _ImageUser(
  user:
      json['user'] == null
          ? null
          : PublicUserEntity.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ImageUserToJson(_ImageUser instance) =>
    <String, dynamic>{'user': instance.user};
