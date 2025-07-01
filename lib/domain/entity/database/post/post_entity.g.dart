// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostEntity _$PostEntityFromJson(Map<String, dynamic> json) => _PostEntity(
  bookmarkCount: (json['bookmarkCount'] as num).toInt(),
  createdAt: json['createdAt'],
  customCompleteText: json['customCompleteText'] as Map<String, dynamic>,
  description: json['description'] as Map<String, dynamic>,
  exampleTexts:
      (json['exampleTexts'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
  genre: json['genre'] as String,
  hashTags:
      (json['hashTags'] as List<dynamic>).map((e) => e as String).toList(),
  image: json['image'] as Map<String, dynamic>,
  impressionCount: (json['impressionCount'] as num).toInt(),
  likeCount: (json['likeCount'] as num).toInt(),
  links:
      (json['links'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
  msgCount: (json['msgCount'] as num).toInt(),
  muteCount: (json['muteCount'] as num).toInt(),
  postId: json['postId'] as String,
  reportCount: (json['reportCount'] as num).toInt(),
  score: (json['score'] as num).toDouble(),
  searchToken: json['searchToken'] as Map<String, dynamic>,
  title: json['title'] as Map<String, dynamic>,
  uid: json['uid'] as String,
  updatedAt: json['updatedAt'],
  userCount: (json['userCount'] as num).toInt(),
);

Map<String, dynamic> _$PostEntityToJson(_PostEntity instance) =>
    <String, dynamic>{
      'bookmarkCount': instance.bookmarkCount,
      'createdAt': instance.createdAt,
      'customCompleteText': instance.customCompleteText,
      'description': instance.description,
      'exampleTexts': instance.exampleTexts,
      'genre': instance.genre,
      'hashTags': instance.hashTags,
      'image': instance.image,
      'impressionCount': instance.impressionCount,
      'likeCount': instance.likeCount,
      'links': instance.links,
      'msgCount': instance.msgCount,
      'muteCount': instance.muteCount,
      'postId': instance.postId,
      'reportCount': instance.reportCount,
      'score': instance.score,
      'searchToken': instance.searchToken,
      'title': instance.title,
      'uid': instance.uid,
      'updatedAt': instance.updatedAt,
      'userCount': instance.userCount,
    };
