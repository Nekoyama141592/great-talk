// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurrentUserState {

 AuthUser? get authUser; PublicUser? get publicUser; PrivateUser? get privateUser; String? get base64;
/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentUserStateCopyWith<CurrentUserState> get copyWith => _$CurrentUserStateCopyWithImpl<CurrentUserState>(this as CurrentUserState, _$identity);

  /// Serializes this CurrentUserState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentUserState&&(identical(other.authUser, authUser) || other.authUser == authUser)&&(identical(other.publicUser, publicUser) || other.publicUser == publicUser)&&(identical(other.privateUser, privateUser) || other.privateUser == privateUser)&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authUser,publicUser,privateUser,base64);

@override
String toString() {
  return 'CurrentUserState(authUser: $authUser, publicUser: $publicUser, privateUser: $privateUser, base64: $base64)';
}


}

/// @nodoc
abstract mixin class $CurrentUserStateCopyWith<$Res>  {
  factory $CurrentUserStateCopyWith(CurrentUserState value, $Res Function(CurrentUserState) _then) = _$CurrentUserStateCopyWithImpl;
@useResult
$Res call({
 AuthUser? authUser, PublicUser? publicUser, PrivateUser? privateUser, String? base64
});


$AuthUserCopyWith<$Res>? get authUser;$PublicUserCopyWith<$Res>? get publicUser;$PrivateUserCopyWith<$Res>? get privateUser;

}
/// @nodoc
class _$CurrentUserStateCopyWithImpl<$Res>
    implements $CurrentUserStateCopyWith<$Res> {
  _$CurrentUserStateCopyWithImpl(this._self, this._then);

  final CurrentUserState _self;
  final $Res Function(CurrentUserState) _then;

/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authUser = freezed,Object? publicUser = freezed,Object? privateUser = freezed,Object? base64 = freezed,}) {
  return _then(_self.copyWith(
authUser: freezed == authUser ? _self.authUser : authUser // ignore: cast_nullable_to_non_nullable
as AuthUser?,publicUser: freezed == publicUser ? _self.publicUser : publicUser // ignore: cast_nullable_to_non_nullable
as PublicUser?,privateUser: freezed == privateUser ? _self.privateUser : privateUser // ignore: cast_nullable_to_non_nullable
as PrivateUser?,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res>? get authUser {
    if (_self.authUser == null) {
    return null;
  }

  return $AuthUserCopyWith<$Res>(_self.authUser!, (value) {
    return _then(_self.copyWith(authUser: value));
  });
}/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicUserCopyWith<$Res>? get publicUser {
    if (_self.publicUser == null) {
    return null;
  }

  return $PublicUserCopyWith<$Res>(_self.publicUser!, (value) {
    return _then(_self.copyWith(publicUser: value));
  });
}/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivateUserCopyWith<$Res>? get privateUser {
    if (_self.privateUser == null) {
    return null;
  }

  return $PrivateUserCopyWith<$Res>(_self.privateUser!, (value) {
    return _then(_self.copyWith(privateUser: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _CurrentUserState extends CurrentUserState {
  const _CurrentUserState({required this.authUser, required this.publicUser, required this.privateUser, required this.base64}): super._();
  factory _CurrentUserState.fromJson(Map<String, dynamic> json) => _$CurrentUserStateFromJson(json);

@override final  AuthUser? authUser;
@override final  PublicUser? publicUser;
@override final  PrivateUser? privateUser;
@override final  String? base64;

/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentUserStateCopyWith<_CurrentUserState> get copyWith => __$CurrentUserStateCopyWithImpl<_CurrentUserState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentUserStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentUserState&&(identical(other.authUser, authUser) || other.authUser == authUser)&&(identical(other.publicUser, publicUser) || other.publicUser == publicUser)&&(identical(other.privateUser, privateUser) || other.privateUser == privateUser)&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,authUser,publicUser,privateUser,base64);

@override
String toString() {
  return 'CurrentUserState(authUser: $authUser, publicUser: $publicUser, privateUser: $privateUser, base64: $base64)';
}


}

/// @nodoc
abstract mixin class _$CurrentUserStateCopyWith<$Res> implements $CurrentUserStateCopyWith<$Res> {
  factory _$CurrentUserStateCopyWith(_CurrentUserState value, $Res Function(_CurrentUserState) _then) = __$CurrentUserStateCopyWithImpl;
@override @useResult
$Res call({
 AuthUser? authUser, PublicUser? publicUser, PrivateUser? privateUser, String? base64
});


@override $AuthUserCopyWith<$Res>? get authUser;@override $PublicUserCopyWith<$Res>? get publicUser;@override $PrivateUserCopyWith<$Res>? get privateUser;

}
/// @nodoc
class __$CurrentUserStateCopyWithImpl<$Res>
    implements _$CurrentUserStateCopyWith<$Res> {
  __$CurrentUserStateCopyWithImpl(this._self, this._then);

  final _CurrentUserState _self;
  final $Res Function(_CurrentUserState) _then;

/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authUser = freezed,Object? publicUser = freezed,Object? privateUser = freezed,Object? base64 = freezed,}) {
  return _then(_CurrentUserState(
authUser: freezed == authUser ? _self.authUser : authUser // ignore: cast_nullable_to_non_nullable
as AuthUser?,publicUser: freezed == publicUser ? _self.publicUser : publicUser // ignore: cast_nullable_to_non_nullable
as PublicUser?,privateUser: freezed == privateUser ? _self.privateUser : privateUser // ignore: cast_nullable_to_non_nullable
as PrivateUser?,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthUserCopyWith<$Res>? get authUser {
    if (_self.authUser == null) {
    return null;
  }

  return $AuthUserCopyWith<$Res>(_self.authUser!, (value) {
    return _then(_self.copyWith(authUser: value));
  });
}/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicUserCopyWith<$Res>? get publicUser {
    if (_self.publicUser == null) {
    return null;
  }

  return $PublicUserCopyWith<$Res>(_self.publicUser!, (value) {
    return _then(_self.copyWith(publicUser: value));
  });
}/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivateUserCopyWith<$Res>? get privateUser {
    if (_self.privateUser == null) {
    return null;
  }

  return $PrivateUserCopyWith<$Res>(_self.privateUser!, (value) {
    return _then(_self.copyWith(privateUser: value));
  });
}
}

// dart format on
