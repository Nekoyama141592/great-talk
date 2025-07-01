// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublicUserEntity _$PublicUserEntityFromJson(Map<String, dynamic> json) =>
    _PublicUserEntity(
      accountName: json['accountName'] as String,
      bio: json['bio'] as Map<String, dynamic>,
      blockCount: (json['blockCount'] as num).toInt(),
      createdAt: json['createdAt'],
      ethAddress: json['ethAddress'] as String,
      followerCount: (json['followerCount'] as num).toInt(),
      followingCount: (json['followingCount'] as num).toInt(),
      isNFTicon: json['isNFTicon'] as bool,
      isOfficial: json['isOfficial'] as bool,
      isSuspended: json['isSuspended'] as bool,
      links:
          (json['links'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
      muteCount: (json['muteCount'] as num).toInt(),
      postCount: (json['postCount'] as num).toInt(),
      reportCount: (json['reportCount'] as num).toInt(),
      score: (json['score'] as num).toDouble(),
      searchToken: json['searchToken'] as Map<String, dynamic>,
      uid: json['uid'] as String,
      updatedAt: json['updatedAt'],
      image: json['image'] as Map<String, dynamic>,
      userName: json['userName'] as Map<String, dynamic>,
      walletAddresses:
          (json['walletAddresses'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
    );

Map<String, dynamic> _$PublicUserEntityToJson(_PublicUserEntity instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'bio': instance.bio,
      'blockCount': instance.blockCount,
      'createdAt': instance.createdAt,
      'ethAddress': instance.ethAddress,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'isNFTicon': instance.isNFTicon,
      'isOfficial': instance.isOfficial,
      'isSuspended': instance.isSuspended,
      'links': instance.links,
      'muteCount': instance.muteCount,
      'postCount': instance.postCount,
      'reportCount': instance.reportCount,
      'score': instance.score,
      'searchToken': instance.searchToken,
      'uid': instance.uid,
      'updatedAt': instance.updatedAt,
      'image': instance.image,
      'userName': instance.userName,
      'walletAddresses': instance.walletAddresses,
    };
