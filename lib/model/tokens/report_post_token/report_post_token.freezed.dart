// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_post_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReportPostToken {
  String get activeUid;
  dynamic get createdAt;
  String get postId;
  dynamic get postRef;
  String get tokenId;
  String get tokenType;

  /// Create a copy of ReportPostToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReportPostTokenCopyWith<ReportPostToken> get copyWith =>
      _$ReportPostTokenCopyWithImpl<ReportPostToken>(
          this as ReportPostToken, _$identity);

  /// Serializes this ReportPostToken to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReportPostToken &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            const DeepCollectionEquality().equals(other.postRef, postRef) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      postId,
      const DeepCollectionEquality().hash(postRef),
      tokenId,
      tokenType);

  @override
  String toString() {
    return 'ReportPostToken(activeUid: $activeUid, createdAt: $createdAt, postId: $postId, postRef: $postRef, tokenId: $tokenId, tokenType: $tokenType)';
  }
}

/// @nodoc
abstract mixin class $ReportPostTokenCopyWith<$Res> {
  factory $ReportPostTokenCopyWith(
          ReportPostToken value, $Res Function(ReportPostToken) _then) =
      _$ReportPostTokenCopyWithImpl;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postId,
      dynamic postRef,
      String tokenId,
      String tokenType});
}

/// @nodoc
class _$ReportPostTokenCopyWithImpl<$Res>
    implements $ReportPostTokenCopyWith<$Res> {
  _$ReportPostTokenCopyWithImpl(this._self, this._then);

  final ReportPostToken _self;
  final $Res Function(ReportPostToken) _then;

  /// Create a copy of ReportPostToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postId = null,
    Object? postRef = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_self.copyWith(
      activeUid: null == activeUid
          ? _self.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _self.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tokenId: null == tokenId
          ? _self.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReportPostToken implements ReportPostToken {
  const _ReportPostToken(
      {required this.activeUid,
      required this.createdAt,
      required this.postId,
      required this.postRef,
      required this.tokenId,
      required this.tokenType});
  factory _ReportPostToken.fromJson(Map<String, dynamic> json) =>
      _$ReportPostTokenFromJson(json);

  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String postId;
  @override
  final dynamic postRef;
  @override
  final String tokenId;
  @override
  final String tokenType;

  /// Create a copy of ReportPostToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReportPostTokenCopyWith<_ReportPostToken> get copyWith =>
      __$ReportPostTokenCopyWithImpl<_ReportPostToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReportPostTokenToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReportPostToken &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            const DeepCollectionEquality().equals(other.postRef, postRef) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      postId,
      const DeepCollectionEquality().hash(postRef),
      tokenId,
      tokenType);

  @override
  String toString() {
    return 'ReportPostToken(activeUid: $activeUid, createdAt: $createdAt, postId: $postId, postRef: $postRef, tokenId: $tokenId, tokenType: $tokenType)';
  }
}

/// @nodoc
abstract mixin class _$ReportPostTokenCopyWith<$Res>
    implements $ReportPostTokenCopyWith<$Res> {
  factory _$ReportPostTokenCopyWith(
          _ReportPostToken value, $Res Function(_ReportPostToken) _then) =
      __$ReportPostTokenCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postId,
      dynamic postRef,
      String tokenId,
      String tokenType});
}

/// @nodoc
class __$ReportPostTokenCopyWithImpl<$Res>
    implements _$ReportPostTokenCopyWith<$Res> {
  __$ReportPostTokenCopyWithImpl(this._self, this._then);

  final _ReportPostToken _self;
  final $Res Function(_ReportPostToken) _then;

  /// Create a copy of ReportPostToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postId = null,
    Object? postRef = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_ReportPostToken(
      activeUid: null == activeUid
          ? _self.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postId: null == postId
          ? _self.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _self.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tokenId: null == tokenId
          ? _self.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
