// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      createdAt: json['createdAt'],
      description: json['description'] as String,
      descriptionLanguageCode: json['descriptionLanguageCode'] as String,
      descriptionNegativeScore:
          (json['descriptionNegativeScore'] as num).toDouble(),
      exampleTexts: (json['exampleTexts'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      genre: json['genre'] as String,
      hashTags:
          (json['hashTags'] as List<dynamic>).map((e) => e as String).toList(),
      impressionCount: json['impressionCount'] as int,
      likeCount: json['likeCount'] as int,
      links: (json['links'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      msgCount: json['msgCount'] as int,
      poster: OriginalUser.fromJson(json['poster'] as Map<String, dynamic>),
      postId: json['postId'] as String,
      reportCount: json['reportCount'] as int,
      score: (json['score'] as num).toDouble(),
      searchToken: json['searchToken'] as Map<String, dynamic>,
      title: json['title'] as String,
      titleLanguageCode: json['titleLanguageCode'] as String,
      titleNegativeScore: (json['titleNegativeScore'] as num).toDouble(),
      updatedAt: json['updatedAt'],
      userCount: json['userCount'] as int,
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'description': instance.description,
      'descriptionLanguageCode': instance.descriptionLanguageCode,
      'descriptionNegativeScore': instance.descriptionNegativeScore,
      'exampleTexts': instance.exampleTexts,
      'genre': instance.genre,
      'hashTags': instance.hashTags,
      'impressionCount': instance.impressionCount,
      'likeCount': instance.likeCount,
      'links': instance.links,
      'msgCount': instance.msgCount,
      'poster': instance.poster,
      'postId': instance.postId,
      'reportCount': instance.reportCount,
      'score': instance.score,
      'searchToken': instance.searchToken,
      'title': instance.title,
      'titleLanguageCode': instance.titleLanguageCode,
      'titleNegativeScore': instance.titleNegativeScore,
      'updatedAt': instance.updatedAt,
      'userCount': instance.userCount,
    };
