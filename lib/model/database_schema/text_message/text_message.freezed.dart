// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TextMessage {

 dynamic get createdAt; String get id; String get messageType;// dynamic postRef, // TODO: 対応
// required String posterUid, // TODO: 対応
 String get senderUid; Map<String, dynamic> get text;
/// Create a copy of TextMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextMessageCopyWith<TextMessage> get copyWith => _$TextMessageCopyWithImpl<TextMessage>(this as TextMessage, _$identity);

  /// Serializes this TextMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextMessage&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.senderUid, senderUid) || other.senderUid == senderUid)&&const DeepCollectionEquality().equals(other.text, text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),id,messageType,senderUid,const DeepCollectionEquality().hash(text));

@override
String toString() {
  return 'TextMessage(createdAt: $createdAt, id: $id, messageType: $messageType, senderUid: $senderUid, text: $text)';
}


}

/// @nodoc
abstract mixin class $TextMessageCopyWith<$Res>  {
  factory $TextMessageCopyWith(TextMessage value, $Res Function(TextMessage) _then) = _$TextMessageCopyWithImpl;
@useResult
$Res call({
 dynamic createdAt, String id, String messageType, String senderUid, Map<String, dynamic> text
});




}
/// @nodoc
class _$TextMessageCopyWithImpl<$Res>
    implements $TextMessageCopyWith<$Res> {
  _$TextMessageCopyWithImpl(this._self, this._then);

  final TextMessage _self;
  final $Res Function(TextMessage) _then;

/// Create a copy of TextMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = freezed,Object? id = null,Object? messageType = null,Object? senderUid = null,Object? text = null,}) {
  return _then(_self.copyWith(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as String,senderUid: null == senderUid ? _self.senderUid : senderUid // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TextMessage extends TextMessage {
  const _TextMessage({required this.createdAt, required this.id, required this.messageType, required this.senderUid, required final  Map<String, dynamic> text}): _text = text,super._();
  factory _TextMessage.fromJson(Map<String, dynamic> json) => _$TextMessageFromJson(json);

@override final  dynamic createdAt;
@override final  String id;
@override final  String messageType;
// dynamic postRef, // TODO: 対応
// required String posterUid, // TODO: 対応
@override final  String senderUid;
 final  Map<String, dynamic> _text;
@override Map<String, dynamic> get text {
  if (_text is EqualUnmodifiableMapView) return _text;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_text);
}


/// Create a copy of TextMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextMessageCopyWith<_TextMessage> get copyWith => __$TextMessageCopyWithImpl<_TextMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextMessage&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.messageType, messageType) || other.messageType == messageType)&&(identical(other.senderUid, senderUid) || other.senderUid == senderUid)&&const DeepCollectionEquality().equals(other._text, _text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),id,messageType,senderUid,const DeepCollectionEquality().hash(_text));

@override
String toString() {
  return 'TextMessage(createdAt: $createdAt, id: $id, messageType: $messageType, senderUid: $senderUid, text: $text)';
}


}

/// @nodoc
abstract mixin class _$TextMessageCopyWith<$Res> implements $TextMessageCopyWith<$Res> {
  factory _$TextMessageCopyWith(_TextMessage value, $Res Function(_TextMessage) _then) = __$TextMessageCopyWithImpl;
@override @useResult
$Res call({
 dynamic createdAt, String id, String messageType, String senderUid, Map<String, dynamic> text
});




}
/// @nodoc
class __$TextMessageCopyWithImpl<$Res>
    implements _$TextMessageCopyWith<$Res> {
  __$TextMessageCopyWithImpl(this._self, this._then);

  final _TextMessage _self;
  final $Res Function(_TextMessage) _then;

/// Create a copy of TextMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? id = null,Object? messageType = null,Object? senderUid = null,Object? text = null,}) {
  return _then(_TextMessage(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,messageType: null == messageType ? _self.messageType : messageType // ignore: cast_nullable_to_non_nullable
as String,senderUid: null == senderUid ? _self.senderUid : senderUid // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self._text : text // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
