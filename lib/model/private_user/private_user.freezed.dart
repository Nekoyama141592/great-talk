// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'private_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivateUser _$PrivateUserFromJson(Map<String, dynamic> json) {
  return _PrivateUser.fromJson(json);
}

/// @nodoc
mixin _$PrivateUser {
  String? get accessToken => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get ethAddress => throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get ipAddress => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  dynamic get ref => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  dynamic get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PrivateUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivateUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivateUserCopyWith<PrivateUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivateUserCopyWith<$Res> {
  factory $PrivateUserCopyWith(
          PrivateUser value, $Res Function(PrivateUser) then) =
      _$PrivateUserCopyWithImpl<$Res, PrivateUser>;
  @useResult
  $Res call(
      {String? accessToken,
      dynamic createdAt,
      String ethAddress,
      String? fcmToken,
      String gender,
      String ipAddress,
      bool isAdmin,
      dynamic ref,
      String uid,
      dynamic updatedAt});
}

/// @nodoc
class _$PrivateUserCopyWithImpl<$Res, $Val extends PrivateUser>
    implements $PrivateUserCopyWith<$Res> {
  _$PrivateUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivateUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? createdAt = freezed,
    Object? ethAddress = null,
    Object? fcmToken = freezed,
    Object? gender = null,
    Object? ipAddress = null,
    Object? isAdmin = null,
    Object? ref = freezed,
    Object? uid = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ethAddress: null == ethAddress
          ? _value.ethAddress
          : ethAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivateUserImplCopyWith<$Res>
    implements $PrivateUserCopyWith<$Res> {
  factory _$$PrivateUserImplCopyWith(
          _$PrivateUserImpl value, $Res Function(_$PrivateUserImpl) then) =
      __$$PrivateUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? accessToken,
      dynamic createdAt,
      String ethAddress,
      String? fcmToken,
      String gender,
      String ipAddress,
      bool isAdmin,
      dynamic ref,
      String uid,
      dynamic updatedAt});
}

/// @nodoc
class __$$PrivateUserImplCopyWithImpl<$Res>
    extends _$PrivateUserCopyWithImpl<$Res, _$PrivateUserImpl>
    implements _$$PrivateUserImplCopyWith<$Res> {
  __$$PrivateUserImplCopyWithImpl(
      _$PrivateUserImpl _value, $Res Function(_$PrivateUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivateUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? createdAt = freezed,
    Object? ethAddress = null,
    Object? fcmToken = freezed,
    Object? gender = null,
    Object? ipAddress = null,
    Object? isAdmin = null,
    Object? ref = freezed,
    Object? uid = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PrivateUserImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ethAddress: null == ethAddress
          ? _value.ethAddress
          : ethAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivateUserImpl extends _PrivateUser {
  const _$PrivateUserImpl(
      {this.accessToken = "",
      required this.createdAt,
      this.ethAddress = "",
      this.fcmToken = "",
      this.gender = "",
      this.ipAddress = "",
      this.isAdmin = false,
      required this.ref,
      required this.uid,
      required this.updatedAt})
      : super._();

  factory _$PrivateUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivateUserImplFromJson(json);

  @override
  @JsonKey()
  final String? accessToken;
  @override
  final dynamic createdAt;
  @override
  @JsonKey()
  final String ethAddress;
  @override
  @JsonKey()
  final String? fcmToken;
  @override
  @JsonKey()
  final String gender;
  @override
  @JsonKey()
  final String ipAddress;
  @override
  @JsonKey()
  final bool isAdmin;
  @override
  final dynamic ref;
  @override
  final String uid;
  @override
  final dynamic updatedAt;

  @override
  String toString() {
    return 'PrivateUser(accessToken: $accessToken, createdAt: $createdAt, ethAddress: $ethAddress, fcmToken: $fcmToken, gender: $gender, ipAddress: $ipAddress, isAdmin: $isAdmin, ref: $ref, uid: $uid, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivateUserImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.ethAddress, ethAddress) ||
                other.ethAddress == ethAddress) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      accessToken,
      const DeepCollectionEquality().hash(createdAt),
      ethAddress,
      fcmToken,
      gender,
      ipAddress,
      isAdmin,
      const DeepCollectionEquality().hash(ref),
      uid,
      const DeepCollectionEquality().hash(updatedAt));

  /// Create a copy of PrivateUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivateUserImplCopyWith<_$PrivateUserImpl> get copyWith =>
      __$$PrivateUserImplCopyWithImpl<_$PrivateUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivateUserImplToJson(
      this,
    );
  }
}

abstract class _PrivateUser extends PrivateUser {
  const factory _PrivateUser(
      {final String? accessToken,
      required final dynamic createdAt,
      final String ethAddress,
      final String? fcmToken,
      final String gender,
      final String ipAddress,
      final bool isAdmin,
      required final dynamic ref,
      required final String uid,
      required final dynamic updatedAt}) = _$PrivateUserImpl;
  const _PrivateUser._() : super._();

  factory _PrivateUser.fromJson(Map<String, dynamic> json) =
      _$PrivateUserImpl.fromJson;

  @override
  String? get accessToken;
  @override
  dynamic get createdAt;
  @override
  String get ethAddress;
  @override
  String? get fcmToken;
  @override
  String get gender;
  @override
  String get ipAddress;
  @override
  bool get isAdmin;
  @override
  dynamic get ref;
  @override
  String get uid;
  @override
  dynamic get updatedAt;

  /// Create a copy of PrivateUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivateUserImplCopyWith<_$PrivateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
