// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostModel _$PostModelFromJson(Map<String, dynamic> json) => _PostModel(
  createdAt: json['createdAt'],
  customCompleteText: const CustomCompleteTextConverter().fromJson(
    json['customCompleteText'] as Map<String, dynamic>,
  ),
  description: const DetectedTextConverter().fromJson(
    json['description'] as Map<String, dynamic>,
  ),
  image: const ModeratedImageConverter().fromJson(
    json['image'] as Map<String, dynamic>,
  ),
  likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
  msgCount: (json['msgCount'] as num?)?.toInt() ?? 0,
  postId: json['postId'] as String,
  title: const DetectedTextConverter().fromJson(
    json['title'] as Map<String, dynamic>,
  ),
  uid: json['uid'] as String,
  updatedAt: json['updatedAt'],
);

Map<String, dynamic> _$PostModelToJson(_PostModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'customCompleteText': const CustomCompleteTextConverter().toJson(
        instance.customCompleteText,
      ),
      'description': const DetectedTextConverter().toJson(instance.description),
      'image': const ModeratedImageConverter().toJson(instance.image),
      'likeCount': instance.likeCount,
      'msgCount': instance.msgCount,
      'postId': instance.postId,
      'title': const DetectedTextConverter().toJson(instance.title),
      'uid': instance.uid,
      'updatedAt': instance.updatedAt,
    };
