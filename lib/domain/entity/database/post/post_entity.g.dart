// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostEntity _$PostEntityFromJson(Map<String, dynamic> json) => _PostEntity(
  createdAt: json['createdAt'],
  customCompleteText: json['customCompleteText'] as Map<String, dynamic>,
  description: json['description'] as Map<String, dynamic>,
  image: json['image'] as Map<String, dynamic>,
  likeCount: (json['likeCount'] as num).toInt(),
  msgCount: (json['msgCount'] as num).toInt(),
  postId: json['postId'] as String,
  title: json['title'] as Map<String, dynamic>,
  uid: json['uid'] as String,
  updatedAt: json['updatedAt'],
);

Map<String, dynamic> _$PostEntityToJson(_PostEntity instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'customCompleteText': instance.customCompleteText,
      'description': instance.description,
      'image': instance.image,
      'likeCount': instance.likeCount,
      'msgCount': instance.msgCount,
      'postId': instance.postId,
      'title': instance.title,
      'uid': instance.uid,
      'updatedAt': instance.updatedAt,
    };
