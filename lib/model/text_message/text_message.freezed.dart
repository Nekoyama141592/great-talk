// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TextMessage _$TextMessageFromJson(Map<String, dynamic> json) {
  return _TextMessage.fromJson(json);
}

/// @nodoc
mixin _$TextMessage {
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get messageType => throw _privateConstructorUsedError;
  dynamic get messageRef => throw _privateConstructorUsedError;
  dynamic get postRef => throw _privateConstructorUsedError;
  String get posterUid => throw _privateConstructorUsedError;
  String get senderUid => throw _privateConstructorUsedError;
  Map<String, dynamic> get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextMessageCopyWith<TextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextMessageCopyWith<$Res> {
  factory $TextMessageCopyWith(
          TextMessage value, $Res Function(TextMessage) then) =
      _$TextMessageCopyWithImpl<$Res, TextMessage>;
  @useResult
  $Res call(
      {dynamic createdAt,
      String id,
      String messageType,
      dynamic messageRef,
      dynamic postRef,
      String posterUid,
      String senderUid,
      Map<String, dynamic> text});
}

/// @nodoc
class _$TextMessageCopyWithImpl<$Res, $Val extends TextMessage>
    implements $TextMessageCopyWith<$Res> {
  _$TextMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? messageType = null,
    Object? messageRef = freezed,
    Object? postRef = freezed,
    Object? posterUid = null,
    Object? senderUid = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      messageRef: freezed == messageRef
          ? _value.messageRef
          : messageRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      posterUid: null == posterUid
          ? _value.posterUid
          : posterUid // ignore: cast_nullable_to_non_nullable
              as String,
      senderUid: null == senderUid
          ? _value.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextMessageImplCopyWith<$Res>
    implements $TextMessageCopyWith<$Res> {
  factory _$$TextMessageImplCopyWith(
          _$TextMessageImpl value, $Res Function(_$TextMessageImpl) then) =
      __$$TextMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      String id,
      String messageType,
      dynamic messageRef,
      dynamic postRef,
      String posterUid,
      String senderUid,
      Map<String, dynamic> text});
}

/// @nodoc
class __$$TextMessageImplCopyWithImpl<$Res>
    extends _$TextMessageCopyWithImpl<$Res, _$TextMessageImpl>
    implements _$$TextMessageImplCopyWith<$Res> {
  __$$TextMessageImplCopyWithImpl(
      _$TextMessageImpl _value, $Res Function(_$TextMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? messageType = null,
    Object? messageRef = freezed,
    Object? postRef = freezed,
    Object? posterUid = null,
    Object? senderUid = null,
    Object? text = null,
  }) {
    return _then(_$TextMessageImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      messageRef: freezed == messageRef
          ? _value.messageRef
          : messageRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      posterUid: null == posterUid
          ? _value.posterUid
          : posterUid // ignore: cast_nullable_to_non_nullable
              as String,
      senderUid: null == senderUid
          ? _value.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value._text
          : text // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextMessageImpl extends _TextMessage {
  const _$TextMessageImpl(
      {required this.createdAt,
      required this.id,
      required this.messageType,
      this.messageRef,
      this.postRef,
      required this.posterUid,
      required this.senderUid,
      required final Map<String, dynamic> text})
      : _text = text,
        super._();

  factory _$TextMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextMessageImplFromJson(json);

  @override
  final dynamic createdAt;
  @override
  final String id;
  @override
  final String messageType;
  @override
  final dynamic messageRef;
  @override
  final dynamic postRef;
  @override
  final String posterUid;
  @override
  final String senderUid;
  final Map<String, dynamic> _text;
  @override
  Map<String, dynamic> get text {
    if (_text is EqualUnmodifiableMapView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_text);
  }

  @override
  String toString() {
    return 'TextMessage(createdAt: $createdAt, id: $id, messageType: $messageType, messageRef: $messageRef, postRef: $postRef, posterUid: $posterUid, senderUid: $senderUid, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextMessageImpl &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            const DeepCollectionEquality()
                .equals(other.messageRef, messageRef) &&
            const DeepCollectionEquality().equals(other.postRef, postRef) &&
            (identical(other.posterUid, posterUid) ||
                other.posterUid == posterUid) &&
            (identical(other.senderUid, senderUid) ||
                other.senderUid == senderUid) &&
            const DeepCollectionEquality().equals(other._text, _text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      id,
      messageType,
      const DeepCollectionEquality().hash(messageRef),
      const DeepCollectionEquality().hash(postRef),
      posterUid,
      senderUid,
      const DeepCollectionEquality().hash(_text));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextMessageImplCopyWith<_$TextMessageImpl> get copyWith =>
      __$$TextMessageImplCopyWithImpl<_$TextMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextMessageImplToJson(
      this,
    );
  }
}

abstract class _TextMessage extends TextMessage {
  const factory _TextMessage(
      {required final dynamic createdAt,
      required final String id,
      required final String messageType,
      final dynamic messageRef,
      final dynamic postRef,
      required final String posterUid,
      required final String senderUid,
      required final Map<String, dynamic> text}) = _$TextMessageImpl;
  const _TextMessage._() : super._();

  factory _TextMessage.fromJson(Map<String, dynamic> json) =
      _$TextMessageImpl.fromJson;

  @override
  dynamic get createdAt;
  @override
  String get id;
  @override
  String get messageType;
  @override
  dynamic get messageRef;
  @override
  dynamic get postRef;
  @override
  String get posterUid;
  @override
  String get senderUid;
  @override
  Map<String, dynamic> get text;
  @override
  @JsonKey(ignore: true)
  _$$TextMessageImplCopyWith<_$TextMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
