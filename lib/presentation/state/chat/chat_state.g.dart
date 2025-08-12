// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatState _$ChatStateFromJson(Map<String, dynamic> json) => _ChatState(
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => TextMessage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  post: PostEntity.fromJson(json['post'] as Map<String, dynamic>),
  isPicked: json['isPicked'] as bool? ?? false,
  pickedImage: json['pickedImage'] as String?,
);

Map<String, dynamic> _$ChatStateToJson(_ChatState instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'post': instance.post,
      'isPicked': instance.isPicked,
      'pickedImage': instance.pickedImage,
    };
