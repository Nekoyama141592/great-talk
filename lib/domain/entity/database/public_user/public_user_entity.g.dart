// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublicUserEntity _$PublicUserEntityFromJson(Map<String, dynamic> json) =>
    _PublicUserEntity(
      bio: DetectedText.fromJson(json['bio'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      followerCount: (json['followerCount'] as num).toInt(),
      followingCount: (json['followingCount'] as num).toInt(),
      isOfficial: json['isOfficial'] as bool,
      postCount: (json['postCount'] as num).toInt(),
      uid: json['uid'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      image: ModeratedImage.fromJson(json['image'] as Map<String, dynamic>),
      userName: DetectedText.fromJson(json['userName'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PublicUserEntityToJson(_PublicUserEntity instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'createdAt': instance.createdAt.toIso8601String(),
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'isOfficial': instance.isOfficial,
      'postCount': instance.postCount,
      'uid': instance.uid,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'image': instance.image,
      'userName': instance.userName,
    };
