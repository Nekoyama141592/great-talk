// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_text_request_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateTextRequestMessage {

 String get role; String get content;
/// Create a copy of GenerateTextRequestMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GenerateTextRequestMessageCopyWith<GenerateTextRequestMessage> get copyWith => _$GenerateTextRequestMessageCopyWithImpl<GenerateTextRequestMessage>(this as GenerateTextRequestMessage, _$identity);

  /// Serializes this GenerateTextRequestMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GenerateTextRequestMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'GenerateTextRequestMessage(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class $GenerateTextRequestMessageCopyWith<$Res>  {
  factory $GenerateTextRequestMessageCopyWith(GenerateTextRequestMessage value, $Res Function(GenerateTextRequestMessage) _then) = _$GenerateTextRequestMessageCopyWithImpl;
@useResult
$Res call({
 String role, String content
});




}
/// @nodoc
class _$GenerateTextRequestMessageCopyWithImpl<$Res>
    implements $GenerateTextRequestMessageCopyWith<$Res> {
  _$GenerateTextRequestMessageCopyWithImpl(this._self, this._then);

  final GenerateTextRequestMessage _self;
  final $Res Function(GenerateTextRequestMessage) _then;

/// Create a copy of GenerateTextRequestMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? content = null,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _GenerateTextRequestMessage implements GenerateTextRequestMessage {
  const _GenerateTextRequestMessage({required this.role, required this.content});
  factory _GenerateTextRequestMessage.fromJson(Map<String, dynamic> json) => _$GenerateTextRequestMessageFromJson(json);

@override final  String role;
@override final  String content;

/// Create a copy of GenerateTextRequestMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GenerateTextRequestMessageCopyWith<_GenerateTextRequestMessage> get copyWith => __$GenerateTextRequestMessageCopyWithImpl<_GenerateTextRequestMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GenerateTextRequestMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GenerateTextRequestMessage&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,content);

@override
String toString() {
  return 'GenerateTextRequestMessage(role: $role, content: $content)';
}


}

/// @nodoc
abstract mixin class _$GenerateTextRequestMessageCopyWith<$Res> implements $GenerateTextRequestMessageCopyWith<$Res> {
  factory _$GenerateTextRequestMessageCopyWith(_GenerateTextRequestMessage value, $Res Function(_GenerateTextRequestMessage) _then) = __$GenerateTextRequestMessageCopyWithImpl;
@override @useResult
$Res call({
 String role, String content
});




}
/// @nodoc
class __$GenerateTextRequestMessageCopyWithImpl<$Res>
    implements _$GenerateTextRequestMessageCopyWith<$Res> {
  __$GenerateTextRequestMessageCopyWithImpl(this._self, this._then);

  final _GenerateTextRequestMessage _self;
  final $Res Function(_GenerateTextRequestMessage) _then;

/// Create a copy of GenerateTextRequestMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? content = null,}) {
  return _then(_GenerateTextRequestMessage(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
