// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostLikeModel _$PostLikeModelFromJson(Map<String, dynamic> json) =>
    _PostLikeModel(
      activeUid: json['activeUid'] as String,
      createdAt: json['createdAt'],
      passiveUid: json['passiveUid'] as String,
      postId: json['postId'] as String,
    );

Map<String, dynamic> _$PostLikeModelToJson(_PostLikeModel instance) =>
    <String, dynamic>{
      'activeUid': instance.activeUid,
      'createdAt': instance.createdAt,
      'passiveUid': instance.passiveUid,
      'postId': instance.postId,
    };
