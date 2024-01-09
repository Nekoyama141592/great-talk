// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicUserImpl _$$PublicUserImplFromJson(Map<String, dynamic> json) =>
    _$PublicUserImpl(
      accountName: json['accountName'] as String? ?? "",
      bio: json['bio'] as Map<String, dynamic>,
      blockCount: json['blockCount'] as int? ?? 0,
      createdAt: json['createdAt'],
      ethAddress: json['ethAddress'] as String? ?? "",
      followerCount: json['followerCount'] as int? ?? 0,
      followingCount: json['followingCount'] as int? ?? 0,
      isNFTicon: json['isNFTicon'] as bool? ?? false,
      isOfficial: json['isOfficial'] as bool? ?? false,
      isSuspended: json['isSuspended'] as bool? ?? false,
      links: (json['links'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      muteCount: json['muteCount'] as int? ?? 0,
      postCount: json['postCount'] as int? ?? 0,
      ref: json['ref'],
      reportCount: json['reportCount'] as int? ?? 0,
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      searchToken: json['searchToken'] as Map<String, dynamic>? ?? const {},
      uid: json['uid'] as String,
      updatedAt: json['updatedAt'],
      image: json['image'] as Map<String, dynamic>,
      userName: json['userName'] as Map<String, dynamic>,
      walletAddresses: (json['walletAddresses'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PublicUserImplToJson(_$PublicUserImpl instance) =>
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
      'ref': instance.ref,
      'reportCount': instance.reportCount,
      'score': instance.score,
      'searchToken': instance.searchToken,
      'uid': instance.uid,
      'updatedAt': instance.updatedAt,
      'image': instance.image,
      'userName': instance.userName,
      'walletAddresses': instance.walletAddresses,
    };
