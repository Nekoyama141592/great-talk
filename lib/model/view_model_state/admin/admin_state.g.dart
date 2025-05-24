// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminState _$AdminStateFromJson(Map<String, dynamic> json) => _AdminState(
  userCount: (json['userCount'] as num).toInt(),
  postCount: (json['postCount'] as num).toInt(),
  messageCount: (json['messageCount'] as num).toInt(),
  searchCount: (json['searchCount'] as num).toInt(),
);

Map<String, dynamic> _$AdminStateToJson(_AdminState instance) =>
    <String, dynamic>{
      'userCount': instance.userCount,
      'postCount': instance.postCount,
      'messageCount': instance.messageCount,
      'searchCount': instance.searchCount,
    };
