// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_mute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostMuteModel _$PostMuteModelFromJson(Map<String, dynamic> json) =>
    _PostMuteModel(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$PostMuteModelToJson(_PostMuteModel instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'postId': instance.postId,
    };
