// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => _AuthUser(
  uid: json['uid'] as String,
  isAnonymous: json['isAnonymous'] as bool,
  emailVerified: json['emailVerified'] as bool,
);

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
  'uid': instance.uid,
  'isAnonymous': instance.isAnonymous,
  'emailVerified': instance.emailVerified,
};
