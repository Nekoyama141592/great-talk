// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PrivateUserModel _$PrivateUserModelFromJson(Map<String, dynamic> json) =>
    _PrivateUserModel(
      accessToken: json['accessToken'] as String? ?? "",
      createdAt: json['createdAt'],
      ethAddress: json['ethAddress'] as String? ?? "",
      fcmToken: json['fcmToken'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      ipAddress: json['ipAddress'] as String? ?? "",
      isAdmin: json['isAdmin'] as bool? ?? false,
      uid: json['uid'] as String,
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$PrivateUserModelToJson(_PrivateUserModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'createdAt': instance.createdAt,
      'ethAddress': instance.ethAddress,
      'fcmToken': instance.fcmToken,
      'gender': instance.gender,
      'ipAddress': instance.ipAddress,
      'isAdmin': instance.isAdmin,
      'uid': instance.uid,
      'updatedAt': instance.updatedAt,
    };
