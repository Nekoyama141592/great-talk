// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublicUserEntity _$PublicUserEntityFromJson(Map<String, dynamic> json) =>
    _PublicUserEntity(
      bio: DetectedText.fromJson(json['bio'] as Map<String, dynamic>),
      createdAt: const TimestampConverter().fromJson(
        json['createdAt'] as Timestamp?,
      ),
      followerCount: (json['followerCount'] as num).toInt(),
      followingCount: (json['followingCount'] as num).toInt(),
      isOfficial: json['isOfficial'] as bool,
      postCount: (json['postCount'] as num).toInt(),
      uid: json['uid'] as String,
      updatedAt: const TimestampConverter().fromJson(
        json['updatedAt'] as Timestamp?,
      ),
      image: DetectedImage.fromJson(json['image'] as Map<String, dynamic>),
      userName: DetectedText.fromJson(json['userName'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PublicUserEntityToJson(_PublicUserEntity instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'isOfficial': instance.isOfficial,
      'postCount': instance.postCount,
      'uid': instance.uid,
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
      'image': instance.image,
      'userName': instance.userName,
    };
