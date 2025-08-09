// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileState _$ProfileStateFromJson(Map<String, dynamic> json) =>
    _ProfileState(
      user:
          json['user'] == null
              ? null
              : PublicUserEntity.fromJson(json['user'] as Map<String, dynamic>),
      userPosts:
          (json['userPosts'] as List<dynamic>)
              .map((e) => UserPost.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ProfileStateToJson(_ProfileState instance) =>
    <String, dynamic>{'user': instance.user, 'userPosts': instance.userPosts};
