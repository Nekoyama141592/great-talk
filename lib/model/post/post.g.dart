// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      bookmarkCount: json['bookmarkCount'] as int,
      createdAt: json['createdAt'],
      customCompleteText: json['customCompleteText'] as Map<String, dynamic>,
      description: json['description'] as Map<String, dynamic>,
      exampleTexts: (json['exampleTexts'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      genre: json['genre'] as String,
      hashTags:
          (json['hashTags'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as Map<String, dynamic>,
      impressionCount: json['impressionCount'] as int,
      likeCount: json['likeCount'] as int,
      links: (json['links'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      msgCount: json['msgCount'] as int,
      muteCount: json['muteCount'] as int,
      poster: json['poster'] as Map<String, dynamic>,
      postId: json['postId'] as String,
      ref: json['ref'],
      reportCount: json['reportCount'] as int,
      score: (json['score'] as num).toDouble(),
      searchToken: json['searchToken'] as Map<String, dynamic>,
      title: json['title'] as Map<String, dynamic>,
      updatedAt: json['updatedAt'],
      userCount: json['userCount'] as int,
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
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
      'poster': instance.poster,
      'postId': instance.postId,
      'ref': instance.ref,
      'reportCount': instance.reportCount,
      'score': instance.score,
      'searchToken': instance.searchToken,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
      'userCount': instance.userCount,
    };
