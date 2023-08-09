// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PrivateUser _$$_PrivateUserFromJson(Map<String, dynamic> json) =>
    _$_PrivateUser(
      createdAt: json['createdAt'],
      ethAddress: json['ethAddress'] as String,
      gender: json['gender'] as String,
      ipAddress: json['ipAddress'] as String,
      isAdmin: json['isAdmin'] as bool,
      ref: json['ref'],
      uid: json['uid'] as String,
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$_PrivateUserToJson(_$_PrivateUser instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'ethAddress': instance.ethAddress,
      'gender': instance.gender,
      'ipAddress': instance.ipAddress,
      'isAdmin': instance.isAdmin,
      'ref': instance.ref,
      'uid': instance.uid,
      'updatedAt': instance.updatedAt,
    };
