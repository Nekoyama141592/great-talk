// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestoreUser _$$_FirestoreUserFromJson(Map<String, dynamic> json) =>
    _$_FirestoreUser(
      accountName: json['accountName'] as String,
      bio: DetectedText.fromJson(json['bio'] as Map<String, dynamic>),
      blockCount: json['blockCount'] as int,
      createdAt: json['createdAt'],
      ethAddress: json['ethAddress'] as String,
      followerCount: json['followerCount'] as int,
      followingCount: json['followingCount'] as int,
      isAdmin: json['isAdmin'] as bool,
      isNFTicon: json['isNFTicon'] as bool,
      isOfficial: json['isOfficial'] as bool,
      isSuspended: json['isSuspended'] as bool,
      links: (json['links'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      muteCount: json['muteCount'] as int,
      nftIconInfo: json['nftIconInfo'] as Map<String, dynamic>,
      postCount: json['postCount'] as int,
      ref: json['ref'],
      reportCount: json['reportCount'] as int,
      score: (json['score'] as num).toDouble(),
      searchToken: json['searchToken'] as Map<String, dynamic>,
      uid: json['uid'] as String,
      updatedAt: json['updatedAt'],
      userImage:
          DetectedImage.fromJson(json['userImage'] as Map<String, dynamic>),
      userName: DetectedText.fromJson(json['userName'] as Map<String, dynamic>),
      walletAddresses: (json['walletAddresses'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_FirestoreUserToJson(_$_FirestoreUser instance) =>
    <String, dynamic>{
      'accountName': instance.accountName,
      'bio': instance.bio.toJson(),
      'blockCount': instance.blockCount,
      'createdAt': instance.createdAt,
      'ethAddress': instance.ethAddress,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'isAdmin': instance.isAdmin,
      'isNFTicon': instance.isNFTicon,
      'isOfficial': instance.isOfficial,
      'isSuspended': instance.isSuspended,
      'links': instance.links,
      'muteCount': instance.muteCount,
      'nftIconInfo': instance.nftIconInfo,
      'postCount': instance.postCount,
      'ref': instance.ref,
      'reportCount': instance.reportCount,
      'score': instance.score,
      'searchToken': instance.searchToken,
      'uid': instance.uid,
      'updatedAt': instance.updatedAt,
      'userImage': instance.userImage.toJson(),
      'userName': instance.userName.toJson(),
      'walletAddresses': instance.walletAddresses,
    };