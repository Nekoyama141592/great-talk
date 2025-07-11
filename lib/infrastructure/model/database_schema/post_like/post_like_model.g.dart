// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostLike _$PostLikeFromJson(Map<String, dynamic> json) => _PostLike(
  activeUid: json['activeUid'] as String,
  createdAt: json['createdAt'],
  passiveUid: json['passiveUid'] as String,
  postId: json['postId'] as String,
);

Map<String, dynamic> _$PostLikeToJson(_PostLike instance) => <String, dynamic>{
  'activeUid': instance.activeUid,
  'createdAt': instance.createdAt,
  'passiveUid': instance.passiveUid,
  'postId': instance.postId,
};
