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

 PublicUserEntity? get publicUser; PrivateUserModel? get privateUser; String? get base64;
/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentUserStateCopyWith<CurrentUserState> get copyWith => _$CurrentUserStateCopyWithImpl<CurrentUserState>(this as CurrentUserState, _$identity);

  /// Serializes this CurrentUserState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentUserState&&(identical(other.publicUser, publicUser) || other.publicUser == publicUser)&&(identical(other.privateUser, privateUser) || other.privateUser == privateUser)&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicUser,privateUser,base64);

@override
String toString() {
  return 'CurrentUserState(publicUser: $publicUser, privateUser: $privateUser, base64: $base64)';
}


}

/// @nodoc
abstract mixin class $CurrentUserStateCopyWith<$Res>  {
  factory $CurrentUserStateCopyWith(CurrentUserState value, $Res Function(CurrentUserState) _then) = _$CurrentUserStateCopyWithImpl;
@useResult
$Res call({
 PublicUserEntity? publicUser, PrivateUserModel? privateUser, String? base64
});


$PublicUserEntityCopyWith<$Res>? get publicUser;$PrivateUserModelCopyWith<$Res>? get privateUser;

}
/// @nodoc
class _$CurrentUserStateCopyWithImpl<$Res>
    implements $CurrentUserStateCopyWith<$Res> {
  _$CurrentUserStateCopyWithImpl(this._self, this._then);

  final CurrentUserState _self;
  final $Res Function(CurrentUserState) _then;

/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicUser = freezed,Object? privateUser = freezed,Object? base64 = freezed,}) {
  return _then(_self.copyWith(
publicUser: freezed == publicUser ? _self.publicUser : publicUser // ignore: cast_nullable_to_non_nullable
as PublicUserEntity?,privateUser: freezed == privateUser ? _self.privateUser : privateUser // ignore: cast_nullable_to_non_nullable
as PrivateUserModel?,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicUserEntityCopyWith<$Res>? get publicUser {
    if (_self.publicUser == null) {
    return null;
  }

  return $PublicUserEntityCopyWith<$Res>(_self.publicUser!, (value) {
    return _then(_self.copyWith(publicUser: value));
  });
}/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivateUserModelCopyWith<$Res>? get privateUser {
    if (_self.privateUser == null) {
    return null;
  }

  return $PrivateUserModelCopyWith<$Res>(_self.privateUser!, (value) {
    return _then(_self.copyWith(privateUser: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _CurrentUserState extends CurrentUserState {
  const _CurrentUserState({this.publicUser, this.privateUser, this.base64}): super._();
  factory _CurrentUserState.fromJson(Map<String, dynamic> json) => _$CurrentUserStateFromJson(json);

@override final  PublicUserEntity? publicUser;
@override final  PrivateUserModel? privateUser;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentUserState&&(identical(other.publicUser, publicUser) || other.publicUser == publicUser)&&(identical(other.privateUser, privateUser) || other.privateUser == privateUser)&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicUser,privateUser,base64);

@override
String toString() {
  return 'CurrentUserState(publicUser: $publicUser, privateUser: $privateUser, base64: $base64)';
}


}

/// @nodoc
abstract mixin class _$CurrentUserStateCopyWith<$Res> implements $CurrentUserStateCopyWith<$Res> {
  factory _$CurrentUserStateCopyWith(_CurrentUserState value, $Res Function(_CurrentUserState) _then) = __$CurrentUserStateCopyWithImpl;
@override @useResult
$Res call({
 PublicUserEntity? publicUser, PrivateUserModel? privateUser, String? base64
});


@override $PublicUserEntityCopyWith<$Res>? get publicUser;@override $PrivateUserModelCopyWith<$Res>? get privateUser;

}
/// @nodoc
class __$CurrentUserStateCopyWithImpl<$Res>
    implements _$CurrentUserStateCopyWith<$Res> {
  __$CurrentUserStateCopyWithImpl(this._self, this._then);

  final _CurrentUserState _self;
  final $Res Function(_CurrentUserState) _then;

/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicUser = freezed,Object? privateUser = freezed,Object? base64 = freezed,}) {
  return _then(_CurrentUserState(
publicUser: freezed == publicUser ? _self.publicUser : publicUser // ignore: cast_nullable_to_non_nullable
as PublicUserEntity?,privateUser: freezed == privateUser ? _self.privateUser : privateUser // ignore: cast_nullable_to_non_nullable
as PrivateUserModel?,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicUserEntityCopyWith<$Res>? get publicUser {
    if (_self.publicUser == null) {
    return null;
  }

  return $PublicUserEntityCopyWith<$Res>(_self.publicUser!, (value) {
    return _then(_self.copyWith(publicUser: value));
  });
}/// Create a copy of CurrentUserState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivateUserModelCopyWith<$Res>? get privateUser {
    if (_self.privateUser == null) {
    return null;
  }

  return $PrivateUserModelCopyWith<$Res>(_self.privateUser!, (value) {
    return _then(_self.copyWith(privateUser: value));
  });
}
}

// dart format on
