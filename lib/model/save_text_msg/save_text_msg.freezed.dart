// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_text_msg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SaveTextMsg _$SaveTextMsgFromJson(Map<String, dynamic> json) {
  return _SaveTextMsg.fromJson(json);
}

/// @nodoc
mixin _$SaveTextMsg {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get messageType => throw _privateConstructorUsedError;
  dynamic get messageRef => throw _privateConstructorUsedError;
  dynamic get postRef => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DetectedText get text => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaveTextMsgCopyWith<SaveTextMsg> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveTextMsgCopyWith<$Res> {
  factory $SaveTextMsgCopyWith(
          SaveTextMsg value, $Res Function(SaveTextMsg) then) =
      _$SaveTextMsgCopyWithImpl<$Res, SaveTextMsg>;
  @useResult
  $Res call(
      {DateTime createdAt,
      String id,
      String messageType,
      dynamic messageRef,
      dynamic postRef,
      String uid,
      DateTime updatedAt,
      DetectedText text});

  $DetectedTextCopyWith<$Res> get text;
}

/// @nodoc
class _$SaveTextMsgCopyWithImpl<$Res, $Val extends SaveTextMsg>
    implements $SaveTextMsgCopyWith<$Res> {
  _$SaveTextMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? messageType = null,
    Object? messageRef = freezed,
    Object? postRef = freezed,
    Object? uid = null,
    Object? updatedAt = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
abstract class _$$_SaveTextMsgCopyWith<$Res>
    implements $SaveTextMsgCopyWith<$Res> {
  factory _$$_SaveTextMsgCopyWith(
          _$_SaveTextMsg value, $Res Function(_$_SaveTextMsg) then) =
      __$$_SaveTextMsgCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime createdAt,
      String id,
      String messageType,
      dynamic messageRef,
      dynamic postRef,
      String uid,
      DateTime updatedAt,
      DetectedText text});

  @override
  $DetectedTextCopyWith<$Res> get text;
}

/// @nodoc
class __$$_SaveTextMsgCopyWithImpl<$Res>
    extends _$SaveTextMsgCopyWithImpl<$Res, _$_SaveTextMsg>
    implements _$$_SaveTextMsgCopyWith<$Res> {
  __$$_SaveTextMsgCopyWithImpl(
      _$_SaveTextMsg _value, $Res Function(_$_SaveTextMsg) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? messageType = null,
    Object? messageRef = freezed,
    Object? postRef = freezed,
    Object? uid = null,
    Object? updatedAt = null,
    Object? text = null,
  }) {
    return _then(_$_SaveTextMsg(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as DetectedText,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SaveTextMsg extends _SaveTextMsg {
  const _$_SaveTextMsg(
      {required this.createdAt,
      required this.id,
      required this.messageType,
      required this.messageRef,
      required this.postRef,
      required this.uid,
      required this.updatedAt,
      required this.text})
      : super._();

  factory _$_SaveTextMsg.fromJson(Map<String, dynamic> json) =>
      _$$_SaveTextMsgFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final String id;
  @override
  final String messageType;
  @override
  final dynamic messageRef;
  @override
  final dynamic postRef;
  @override
  final String uid;
  @override
  final DateTime updatedAt;
  @override
  final DetectedText text;

  @override
  String toString() {
    return 'SaveTextMsg(createdAt: $createdAt, id: $id, messageType: $messageType, messageRef: $messageRef, postRef: $postRef, uid: $uid, updatedAt: $updatedAt, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveTextMsg &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            const DeepCollectionEquality()
                .equals(other.messageRef, messageRef) &&
            const DeepCollectionEquality().equals(other.postRef, postRef) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      id,
      messageType,
      const DeepCollectionEquality().hash(messageRef),
      const DeepCollectionEquality().hash(postRef),
      uid,
      updatedAt,
      text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaveTextMsgCopyWith<_$_SaveTextMsg> get copyWith =>
      __$$_SaveTextMsgCopyWithImpl<_$_SaveTextMsg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SaveTextMsgToJson(
      this,
    );
  }
}

abstract class _SaveTextMsg extends SaveTextMsg {
  const factory _SaveTextMsg(
      {required final DateTime createdAt,
      required final String id,
      required final String messageType,
      required final dynamic messageRef,
      required final dynamic postRef,
      required final String uid,
      required final DateTime updatedAt,
      required final DetectedText text}) = _$_SaveTextMsg;
  const _SaveTextMsg._() : super._();

  factory _SaveTextMsg.fromJson(Map<String, dynamic> json) =
      _$_SaveTextMsg.fromJson;

  @override
  DateTime get createdAt;
  @override
  String get id;
  @override
  String get messageType;
  @override
  dynamic get messageRef;
  @override
  dynamic get postRef;
  @override
  String get uid;
  @override
  DateTime get updatedAt;
  @override
  DetectedText get text;
  @override
  @JsonKey(ignore: true)
  _$$_SaveTextMsgCopyWith<_$_SaveTextMsg> get copyWith =>
      throw _privateConstructorUsedError;
}
