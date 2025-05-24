// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatState _$ChatStateFromJson(Map<String, dynamic> json) => _ChatState(
  isGenerating: json['isGenerating'] as bool? ?? false,
  messages:
      (json['messages'] as List<dynamic>?)
          ?.map((e) => TextMessage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  post: Post.fromJson(json['post'] as Map<String, dynamic>),
  postImage: json['postImage'] as String?,
  isPicked: json['isPicked'] as bool? ?? false,
  pickedImage: json['pickedImage'] as String?,
  realtimeRes: json['realtimeRes'] as String? ?? "",
);

Map<String, dynamic> _$ChatStateToJson(_ChatState instance) =>
    <String, dynamic>{
      'isGenerating': instance.isGenerating,
      'messages': instance.messages,
      'post': instance.post,
      'postImage': instance.postImage,
      'isPicked': instance.isPicked,
      'pickedImage': instance.pickedImage,
      'realtimeRes': instance.realtimeRes,
    };
