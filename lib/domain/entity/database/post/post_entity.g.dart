// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostEntity _$PostEntityFromJson(Map<String, dynamic> json) => _PostEntity(
  createdAt: const TimestampConverter().fromJson(
    json['createdAt'] as Timestamp,
  ),
  customCompleteText: CustomCompleteText.fromJson(
    json['customCompleteText'] as Map<String, dynamic>,
  ),
  description: DetectedText.fromJson(
    json['description'] as Map<String, dynamic>,
  ),
  image: ModeratedImage.fromJson(json['image'] as Map<String, dynamic>),
  likeCount: (json['likeCount'] as num).toInt(),
  msgCount: (json['msgCount'] as num).toInt(),
  postId: json['postId'] as String,
  title: DetectedText.fromJson(json['title'] as Map<String, dynamic>),
  uid: json['uid'] as String,
  updatedAt: const TimestampConverter().fromJson(
    json['updatedAt'] as Timestamp,
  ),
);

Map<String, dynamic> _$PostEntityToJson(_PostEntity instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'customCompleteText': instance.customCompleteText,
      'description': instance.description,
      'image': instance.image,
      'likeCount': instance.likeCount,
      'msgCount': instance.msgCount,
      'postId': instance.postId,
      'title': instance.title,
      'uid': instance.uid,
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
