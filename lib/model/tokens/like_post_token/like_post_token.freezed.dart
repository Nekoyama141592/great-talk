// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_post_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LikePostToken _$LikePostTokenFromJson(Map<String, dynamic> json) {
  return _LikePostToken.fromJson(json);
}

/// @nodoc
mixin _$LikePostToken {
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get passiveUid => throw _privateConstructorUsedError;
  dynamic get postRef => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikePostTokenCopyWith<LikePostToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikePostTokenCopyWith<$Res> {
  factory $LikePostTokenCopyWith(
          LikePostToken value, $Res Function(LikePostToken) then) =
      _$LikePostTokenCopyWithImpl<$Res, LikePostToken>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String passiveUid,
      dynamic postRef,
      String postId,
      String tokenId,
      String tokenType});
}

/// @nodoc
class _$LikePostTokenCopyWithImpl<$Res, $Val extends LikePostToken>
    implements $LikePostTokenCopyWith<$Res> {
  _$LikePostTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? passiveUid = null,
    Object? postRef = freezed,
    Object? postId = null,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LikePostTokenCopyWith<$Res>
    implements $LikePostTokenCopyWith<$Res> {
  factory _$$_LikePostTokenCopyWith(
          _$_LikePostToken value, $Res Function(_$_LikePostToken) then) =
      __$$_LikePostTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String passiveUid,
      dynamic postRef,
      String postId,
      String tokenId,
      String tokenType});
}

/// @nodoc
class __$$_LikePostTokenCopyWithImpl<$Res>
    extends _$LikePostTokenCopyWithImpl<$Res, _$_LikePostToken>
    implements _$$_LikePostTokenCopyWith<$Res> {
  __$$_LikePostTokenCopyWithImpl(
      _$_LikePostToken _value, $Res Function(_$_LikePostToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? passiveUid = null,
    Object? postRef = freezed,
    Object? postId = null,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_$_LikePostToken(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LikePostToken implements _LikePostToken {
  const _$_LikePostToken(
      {required this.activeUid,
      required this.createdAt,
      required this.passiveUid,
      required this.postRef,
      required this.postId,
      required this.tokenId,
      required this.tokenType});

  factory _$_LikePostToken.fromJson(Map<String, dynamic> json) =>
      _$$_LikePostTokenFromJson(json);

  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String passiveUid;
  @override
  final dynamic postRef;
  @override
  final String postId;
  @override
  final String tokenId;
  @override
  final String tokenType;

  @override
  String toString() {
    return 'LikePostToken(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, postRef: $postRef, postId: $postId, tokenId: $tokenId, tokenType: $tokenType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LikePostToken &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.passiveUid, passiveUid) ||
                other.passiveUid == passiveUid) &&
            const DeepCollectionEquality().equals(other.postRef, postRef) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      passiveUid,
      const DeepCollectionEquality().hash(postRef),
      postId,
      tokenId,
      tokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikePostTokenCopyWith<_$_LikePostToken> get copyWith =>
      __$$_LikePostTokenCopyWithImpl<_$_LikePostToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LikePostTokenToJson(
      this,
    );
  }
}

abstract class _LikePostToken implements LikePostToken {
  const factory _LikePostToken(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String passiveUid,
      required final dynamic postRef,
      required final String postId,
      required final String tokenId,
      required final String tokenType}) = _$_LikePostToken;

  factory _LikePostToken.fromJson(Map<String, dynamic> json) =
      _$_LikePostToken.fromJson;

  @override
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get passiveUid;
  @override
  dynamic get postRef;
  @override
  String get postId;
  @override
  String get tokenId;
  @override
  String get tokenType;
  @override
  @JsonKey(ignore: true)
  _$$_LikePostTokenCopyWith<_$_LikePostToken> get copyWith =>
      throw _privateConstructorUsedError;
}
