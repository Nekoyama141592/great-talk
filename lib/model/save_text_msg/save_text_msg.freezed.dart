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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SaveTextMsg _$SaveTextMsgFromJson(Map<String, dynamic> json) {
  return _SaveTextMsg.fromJson(json);
}

/// @nodoc
mixin _$SaveTextMsg {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get messageType => throw _privateConstructorUsedError;
  String get posterUid => throw _privateConstructorUsedError;
  String get senderUid => throw _privateConstructorUsedError;
  Map<String, dynamic> get text => throw _privateConstructorUsedError;

  /// Serializes this SaveTextMsg to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaveTextMsg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      String posterUid,
      String senderUid,
      Map<String, dynamic> text});
}

/// @nodoc
class _$SaveTextMsgCopyWithImpl<$Res, $Val extends SaveTextMsg>
    implements $SaveTextMsgCopyWith<$Res> {
  _$SaveTextMsgCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaveTextMsg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? messageType = null,
    Object? posterUid = null,
    Object? senderUid = null,
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
abstract class _$$SaveTextMsgImplCopyWith<$Res>
    implements $SaveTextMsgCopyWith<$Res> {
  factory _$$SaveTextMsgImplCopyWith(
          _$SaveTextMsgImpl value, $Res Function(_$SaveTextMsgImpl) then) =
      __$$SaveTextMsgImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime createdAt,
      String id,
      String messageType,
      String posterUid,
      String senderUid,
      Map<String, dynamic> text});
}

/// @nodoc
class __$$SaveTextMsgImplCopyWithImpl<$Res>
    extends _$SaveTextMsgCopyWithImpl<$Res, _$SaveTextMsgImpl>
    implements _$$SaveTextMsgImplCopyWith<$Res> {
  __$$SaveTextMsgImplCopyWithImpl(
      _$SaveTextMsgImpl _value, $Res Function(_$SaveTextMsgImpl) _then)
      : super(_value, _then);

  /// Create a copy of SaveTextMsg
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? messageType = null,
    Object? posterUid = null,
    Object? senderUid = null,
    Object? text = null,
  }) {
    return _then(_$SaveTextMsgImpl(
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
class _$SaveTextMsgImpl extends _SaveTextMsg {
  const _$SaveTextMsgImpl(
      {required this.createdAt,
      required this.id,
      required this.messageType,
      required this.posterUid,
      required this.senderUid,
      required final Map<String, dynamic> text})
      : _text = text,
        super._();

  factory _$SaveTextMsgImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveTextMsgImplFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final String id;
  @override
  final String messageType;
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
    return 'SaveTextMsg(createdAt: $createdAt, id: $id, messageType: $messageType, posterUid: $posterUid, senderUid: $senderUid, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveTextMsgImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.posterUid, posterUid) ||
                other.posterUid == posterUid) &&
            (identical(other.senderUid, senderUid) ||
                other.senderUid == senderUid) &&
            const DeepCollectionEquality().equals(other._text, _text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, id, messageType,
      posterUid, senderUid, const DeepCollectionEquality().hash(_text));

  /// Create a copy of SaveTextMsg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveTextMsgImplCopyWith<_$SaveTextMsgImpl> get copyWith =>
      __$$SaveTextMsgImplCopyWithImpl<_$SaveTextMsgImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveTextMsgImplToJson(
      this,
    );
  }
}

abstract class _SaveTextMsg extends SaveTextMsg {
  const factory _SaveTextMsg(
      {required final DateTime createdAt,
      required final String id,
      required final String messageType,
      required final String posterUid,
      required final String senderUid,
      required final Map<String, dynamic> text}) = _$SaveTextMsgImpl;
  const _SaveTextMsg._() : super._();

  factory _SaveTextMsg.fromJson(Map<String, dynamic> json) =
      _$SaveTextMsgImpl.fromJson;

  @override
  DateTime get createdAt;
  @override
  String get id;
  @override
  String get messageType;
  @override
  String get posterUid;
  @override
  String get senderUid;
  @override
  Map<String, dynamic> get text;

  /// Create a copy of SaveTextMsg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveTextMsgImplCopyWith<_$SaveTextMsgImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
