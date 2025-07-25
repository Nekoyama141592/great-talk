// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PublicUserModel _$PublicUserModelFromJson(Map<String, dynamic> json) =>
    _PublicUserModel(
      accountName: json['accountName'] as String? ?? "",
      bio: const DetectedTextConverter().fromJson(
        json['bio'] as Map<String, dynamic>,
      ),
      blockCount: (json['blockCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'],
      ethAddress: json['ethAddress'] as String? ?? "",
      followerCount: (json['followerCount'] as num?)?.toInt() ?? 0,
      followingCount: (json['followingCount'] as num?)?.toInt() ?? 0,
      isNFTicon: json['isNFTicon'] as bool? ?? false,
      isOfficial: json['isOfficial'] as bool? ?? false,
      isSuspended: json['isSuspended'] as bool? ?? false,
      links:
          (json['links'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      muteCount: (json['muteCount'] as num?)?.toInt() ?? 0,
      postCount: (json['postCount'] as num?)?.toInt() ?? 0,
      reportCount: (json['reportCount'] as num?)?.toInt() ?? 0,
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      searchToken: json['searchToken'] as Map<String, dynamic>? ?? const {},
      uid: json['uid'] as String,
      updatedAt: json['updatedAt'],
      image: const ModeratedImageConverter().fromJson(
        json['image'] as Map<String, dynamic>,
      ),
      userName: const DetectedTextConverter().fromJson(
        json['userName'] as Map<String, dynamic>,
      ),
      walletAddresses:
          (json['walletAddresses'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PublicUserModelToJson(_PublicUserModel instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'bio': const DetectedTextConverter().toJson(instance.bio),
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
      'image': const ModeratedImageConverter().toJson(instance.image),
      'userName': const DetectedTextConverter().toJson(instance.userName),
      'walletAddresses': instance.walletAddresses,
    };
