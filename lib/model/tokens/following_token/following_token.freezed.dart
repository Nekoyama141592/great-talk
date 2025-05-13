// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowingToken _$FollowingTokenFromJson(Map<String, dynamic> json) {
  return _FollowingToken.fromJson(json);
}

/// @nodoc
mixin _$FollowingToken {
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get passiveUid => throw _privateConstructorUsedError;
  dynamic get passiveUserRef => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;

  /// Serializes this FollowingToken to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FollowingToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FollowingTokenCopyWith<FollowingToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingTokenCopyWith<$Res> {
  factory $FollowingTokenCopyWith(
          FollowingToken value, $Res Function(FollowingToken) then) =
      _$FollowingTokenCopyWithImpl<$Res, FollowingToken>;
  @useResult
  $Res call(
      {dynamic createdAt,
      String passiveUid,
      dynamic passiveUserRef,
      String tokenId,
      String tokenType});
}

/// @nodoc
class _$FollowingTokenCopyWithImpl<$Res, $Val extends FollowingToken>
    implements $FollowingTokenCopyWith<$Res> {
  _$FollowingTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FollowingToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? passiveUid = null,
    Object? passiveUserRef = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUserRef: freezed == passiveUserRef
          ? _value.passiveUserRef
          : passiveUserRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$FollowingTokenImplCopyWith<$Res>
    implements $FollowingTokenCopyWith<$Res> {
  factory _$$FollowingTokenImplCopyWith(_$FollowingTokenImpl value,
          $Res Function(_$FollowingTokenImpl) then) =
      __$$FollowingTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      String passiveUid,
      dynamic passiveUserRef,
      String tokenId,
      String tokenType});
}

/// @nodoc
class __$$FollowingTokenImplCopyWithImpl<$Res>
    extends _$FollowingTokenCopyWithImpl<$Res, _$FollowingTokenImpl>
    implements _$$FollowingTokenImplCopyWith<$Res> {
  __$$FollowingTokenImplCopyWithImpl(
      _$FollowingTokenImpl _value, $Res Function(_$FollowingTokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of FollowingToken
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? passiveUid = null,
    Object? passiveUserRef = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_$FollowingTokenImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUserRef: freezed == passiveUserRef
          ? _value.passiveUserRef
          : passiveUserRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$FollowingTokenImpl extends _FollowingToken
    with DiagnosticableTreeMixin {
  const _$FollowingTokenImpl(
      {required this.createdAt,
      required this.passiveUid,
      required this.passiveUserRef,
      required this.tokenId,
      required this.tokenType})
      : super._();

  factory _$FollowingTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowingTokenImplFromJson(json);

  @override
  final dynamic createdAt;
  @override
  final String passiveUid;
  @override
  final dynamic passiveUserRef;
  @override
  final String tokenId;
  @override
  final String tokenType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FollowingToken(createdAt: $createdAt, passiveUid: $passiveUid, passiveUserRef: $passiveUserRef, tokenId: $tokenId, tokenType: $tokenType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FollowingToken'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('passiveUid', passiveUid))
      ..add(DiagnosticsProperty('passiveUserRef', passiveUserRef))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('tokenType', tokenType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowingTokenImpl &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.passiveUid, passiveUid) ||
                other.passiveUid == passiveUid) &&
            const DeepCollectionEquality()
                .equals(other.passiveUserRef, passiveUserRef) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      passiveUid,
      const DeepCollectionEquality().hash(passiveUserRef),
      tokenId,
      tokenType);

  /// Create a copy of FollowingToken
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowingTokenImplCopyWith<_$FollowingTokenImpl> get copyWith =>
      __$$FollowingTokenImplCopyWithImpl<_$FollowingTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowingTokenImplToJson(
      this,
    );
  }
}

abstract class _FollowingToken extends FollowingToken {
  const factory _FollowingToken(
      {required final dynamic createdAt,
      required final String passiveUid,
      required final dynamic passiveUserRef,
      required final String tokenId,
      required final String tokenType}) = _$FollowingTokenImpl;
  const _FollowingToken._() : super._();

  factory _FollowingToken.fromJson(Map<String, dynamic> json) =
      _$FollowingTokenImpl.fromJson;

  @override
  dynamic get createdAt;
  @override
  String get passiveUid;
  @override
  dynamic get passiveUserRef;
  @override
  String get tokenId;
  @override
  String get tokenType;

  /// Create a copy of FollowingToken
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FollowingTokenImplCopyWith<_$FollowingTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
