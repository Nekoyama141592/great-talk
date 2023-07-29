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
  String get uid => throw _privateConstructorUsedError;
  dynamic get updatedAt => throw _privateConstructorUsedError;
  DetectedText get text => throw _privateConstructorUsedError;

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
      String uid,
      dynamic updatedAt,
      DetectedText text});

  $DetectedTextCopyWith<$Res> get text;
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
    Object? uid = null,
    Object? updatedAt = freezed,
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as DetectedText,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetectedTextCopyWith<$Res> get text {
    return $DetectedTextCopyWith<$Res>(_value.text, (value) {
      return _then(_value.copyWith(text: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TextMessageCopyWith<$Res>
    implements $TextMessageCopyWith<$Res> {
  factory _$$_TextMessageCopyWith(
          _$_TextMessage value, $Res Function(_$_TextMessage) then) =
      __$$_TextMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      String id,
      String messageType,
      String uid,
      dynamic updatedAt,
      DetectedText text});

  @override
  $DetectedTextCopyWith<$Res> get text;
}

/// @nodoc
class __$$_TextMessageCopyWithImpl<$Res>
    extends _$TextMessageCopyWithImpl<$Res, _$_TextMessage>
    implements _$$_TextMessageCopyWith<$Res> {
  __$$_TextMessageCopyWithImpl(
      _$_TextMessage _value, $Res Function(_$_TextMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? messageType = null,
    Object? uid = null,
    Object? updatedAt = freezed,
    Object? text = null,
  }) {
    return _then(_$_TextMessage(
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as DetectedText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TextMessage extends _TextMessage {
  const _$_TextMessage(
      {required this.createdAt,
      required this.id,
      required this.messageType,
      required this.uid,
      required this.updatedAt,
      required this.text})
      : super._();

  factory _$_TextMessage.fromJson(Map<String, dynamic> json) =>
      _$$_TextMessageFromJson(json);

  @override
  final dynamic createdAt;
  @override
  final String id;
  @override
  final String messageType;
  @override
  final String uid;
  @override
  final dynamic updatedAt;
  @override
  final DetectedText text;

  @override
  String toString() {
    return 'TextMessage(createdAt: $createdAt, id: $id, messageType: $messageType, uid: $uid, updatedAt: $updatedAt, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextMessage &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      id,
      messageType,
      uid,
      const DeepCollectionEquality().hash(updatedAt),
      text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextMessageCopyWith<_$_TextMessage> get copyWith =>
      __$$_TextMessageCopyWithImpl<_$_TextMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TextMessageToJson(
      this,
    );
  }
}

abstract class _TextMessage extends TextMessage {
  const factory _TextMessage(
      {required final dynamic createdAt,
      required final String id,
      required final String messageType,
      required final String uid,
      required final dynamic updatedAt,
      required final DetectedText text}) = _$_TextMessage;
  const _TextMessage._() : super._();

  factory _TextMessage.fromJson(Map<String, dynamic> json) =
      _$_TextMessage.fromJson;

  @override
  dynamic get createdAt;
  @override
  String get id;
  @override
  String get messageType;
  @override
  String get uid;
  @override
  dynamic get updatedAt;
  @override
  DetectedText get text;
  @override
  @JsonKey(ignore: true)
  _$$_TextMessageCopyWith<_$_TextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
