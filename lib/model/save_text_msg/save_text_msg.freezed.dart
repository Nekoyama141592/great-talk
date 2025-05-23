// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_text_msg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SaveTextMsg {
  DateTime get createdAt;
  String get id;
  String get messageType;
  String get posterUid;
  String get senderUid;
  SDMap get text;

  /// Create a copy of SaveTextMsg
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaveTextMsgCopyWith<SaveTextMsg> get copyWith =>
      _$SaveTextMsgCopyWithImpl<SaveTextMsg>(this as SaveTextMsg, _$identity);

  /// Serializes this SaveTextMsg to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaveTextMsg &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.posterUid, posterUid) ||
                other.posterUid == posterUid) &&
            (identical(other.senderUid, senderUid) ||
                other.senderUid == senderUid) &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, id, messageType,
      posterUid, senderUid, const DeepCollectionEquality().hash(text));

  @override
  String toString() {
    return 'SaveTextMsg(createdAt: $createdAt, id: $id, messageType: $messageType, posterUid: $posterUid, senderUid: $senderUid, text: $text)';
  }
}

/// @nodoc
abstract mixin class $SaveTextMsgCopyWith<$Res> {
  factory $SaveTextMsgCopyWith(
          SaveTextMsg value, $Res Function(SaveTextMsg) _then) =
      _$SaveTextMsgCopyWithImpl;
  @useResult
  $Res call(
      {DateTime createdAt,
      String id,
      String messageType,
      String posterUid,
      String senderUid,
      SDMap text});
}

/// @nodoc
class _$SaveTextMsgCopyWithImpl<$Res> implements $SaveTextMsgCopyWith<$Res> {
  _$SaveTextMsgCopyWithImpl(this._self, this._then);

  final SaveTextMsg _self;
  final $Res Function(SaveTextMsg) _then;

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
    return _then(_self.copyWith(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _self.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      posterUid: null == posterUid
          ? _self.posterUid
          : posterUid // ignore: cast_nullable_to_non_nullable
              as String,
      senderUid: null == senderUid
          ? _self.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as SDMap,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SaveTextMsg extends SaveTextMsg {
  const _SaveTextMsg(
      {required this.createdAt,
      required this.id,
      required this.messageType,
      required this.posterUid,
      required this.senderUid,
      required final SDMap text})
      : _text = text,
        super._();
  factory _SaveTextMsg.fromJson(Map<String, dynamic> json) =>
      _$SaveTextMsgFromJson(json);

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
  final SDMap _text;
  @override
  SDMap get text {
    if (_text is EqualUnmodifiableMapView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_text);
  }

  /// Create a copy of SaveTextMsg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SaveTextMsgCopyWith<_SaveTextMsg> get copyWith =>
      __$SaveTextMsgCopyWithImpl<_SaveTextMsg>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SaveTextMsgToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveTextMsg &&
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

  @override
  String toString() {
    return 'SaveTextMsg(createdAt: $createdAt, id: $id, messageType: $messageType, posterUid: $posterUid, senderUid: $senderUid, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$SaveTextMsgCopyWith<$Res>
    implements $SaveTextMsgCopyWith<$Res> {
  factory _$SaveTextMsgCopyWith(
          _SaveTextMsg value, $Res Function(_SaveTextMsg) _then) =
      __$SaveTextMsgCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime createdAt,
      String id,
      String messageType,
      String posterUid,
      String senderUid,
      SDMap text});
}

/// @nodoc
class __$SaveTextMsgCopyWithImpl<$Res> implements _$SaveTextMsgCopyWith<$Res> {
  __$SaveTextMsgCopyWithImpl(this._self, this._then);

  final _SaveTextMsg _self;
  final $Res Function(_SaveTextMsg) _then;

  /// Create a copy of SaveTextMsg
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? messageType = null,
    Object? posterUid = null,
    Object? senderUid = null,
    Object? text = null,
  }) {
    return _then(_SaveTextMsg(
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _self.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      posterUid: null == posterUid
          ? _self.posterUid
          : posterUid // ignore: cast_nullable_to_non_nullable
              as String,
      senderUid: null == senderUid
          ? _self.senderUid
          : senderUid // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self._text
          : text // ignore: cast_nullable_to_non_nullable
              as SDMap,
    ));
  }
}

// dart format on
