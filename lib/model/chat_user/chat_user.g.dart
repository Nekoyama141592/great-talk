// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatUser _$$_ChatUserFromJson(Map<String, dynamic> json) => _$_ChatUser(
      imageUrl: json['imageUrl'] as String,
      lastSeen: json['lastSeen'] as int?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      uid: json['uid'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$$_ChatUserToJson(_$_ChatUser instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'lastSeen': instance.lastSeen,
      'metadata': instance.metadata,
      'uid': instance.uid,
      'userName': instance.userName,
    };
