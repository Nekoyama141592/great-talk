// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatUser _$ChatUserFromJson(Map<String, dynamic> json) {
  return _ChatUser.fromJson(json);
}

/// @nodoc
mixin _$ChatUser {
  String get imageUrl => throw _privateConstructorUsedError;
  int? get lastSeen => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatUserCopyWith<ChatUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatUserCopyWith<$Res> {
  factory $ChatUserCopyWith(ChatUser value, $Res Function(ChatUser) then) =
      _$ChatUserCopyWithImpl<$Res, ChatUser>;
  @useResult
  $Res call(
      {String imageUrl,
      int? lastSeen,
      Map<String, dynamic>? metadata,
      String uid,
      String userName});
}

/// @nodoc
class _$ChatUserCopyWithImpl<$Res, $Val extends ChatUser>
    implements $ChatUserCopyWith<$Res> {
  _$ChatUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? lastSeen = freezed,
    Object? metadata = freezed,
    Object? uid = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeen: freezed == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatUserCopyWith<$Res> implements $ChatUserCopyWith<$Res> {
  factory _$$_ChatUserCopyWith(
          _$_ChatUser value, $Res Function(_$_ChatUser) then) =
      __$$_ChatUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String imageUrl,
      int? lastSeen,
      Map<String, dynamic>? metadata,
      String uid,
      String userName});
}

/// @nodoc
class __$$_ChatUserCopyWithImpl<$Res>
    extends _$ChatUserCopyWithImpl<$Res, _$_ChatUser>
    implements _$$_ChatUserCopyWith<$Res> {
  __$$_ChatUserCopyWithImpl(
      _$_ChatUser _value, $Res Function(_$_ChatUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
    Object? lastSeen = freezed,
    Object? metadata = freezed,
    Object? uid = null,
    Object? userName = null,
  }) {
    return _then(_$_ChatUser(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      lastSeen: freezed == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatUser implements _ChatUser {
  const _$_ChatUser(
      {required this.imageUrl,
      this.lastSeen,
      final Map<String, dynamic>? metadata,
      required this.uid,
      required this.userName})
      : _metadata = metadata;

  factory _$_ChatUser.fromJson(Map<String, dynamic> json) =>
      _$$_ChatUserFromJson(json);

  @override
  final String imageUrl;
  @override
  final int? lastSeen;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String uid;
  @override
  final String userName;

  @override
  String toString() {
    return 'ChatUser(imageUrl: $imageUrl, lastSeen: $lastSeen, metadata: $metadata, uid: $uid, userName: $userName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatUser &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imageUrl, lastSeen,
      const DeepCollectionEquality().hash(_metadata), uid, userName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatUserCopyWith<_$_ChatUser> get copyWith =>
      __$$_ChatUserCopyWithImpl<_$_ChatUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatUserToJson(
      this,
    );
  }
}

abstract class _ChatUser implements ChatUser {
  const factory _ChatUser(
      {required final String imageUrl,
      final int? lastSeen,
      final Map<String, dynamic>? metadata,
      required final String uid,
      required final String userName}) = _$_ChatUser;

  factory _ChatUser.fromJson(Map<String, dynamic> json) = _$_ChatUser.fromJson;

  @override
  String get imageUrl;
  @override
  int? get lastSeen;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String get uid;
  @override
  String get userName;
  @override
  @JsonKey(ignore: true)
  _$$_ChatUserCopyWith<_$_ChatUser> get copyWith =>
      throw _privateConstructorUsedError;
}
