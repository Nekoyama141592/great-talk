// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileState {

 PublicUser? get user; String? get base64; List<UserPost> get userPosts;
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStateCopyWith<ProfileState> get copyWith => _$ProfileStateCopyWithImpl<ProfileState>(this as ProfileState, _$identity);

  /// Serializes this ProfileState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileState&&(identical(other.user, user) || other.user == user)&&(identical(other.base64, base64) || other.base64 == base64)&&const DeepCollectionEquality().equals(other.userPosts, userPosts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,base64,const DeepCollectionEquality().hash(userPosts));

@override
String toString() {
  return 'ProfileState(user: $user, base64: $base64, userPosts: $userPosts)';
}


}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res>  {
  factory $ProfileStateCopyWith(ProfileState value, $Res Function(ProfileState) _then) = _$ProfileStateCopyWithImpl;
@useResult
$Res call({
 PublicUser? user, String? base64, List<UserPost> userPosts
});


$PublicUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$ProfileStateCopyWithImpl<$Res>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? base64 = freezed,Object? userPosts = null,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as PublicUser?,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,userPosts: null == userPosts ? _self.userPosts : userPosts // ignore: cast_nullable_to_non_nullable
as List<UserPost>,
  ));
}
/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $PublicUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ProfileState implements ProfileState {
  const _ProfileState({required this.user, required this.base64, required final  List<UserPost> userPosts}): _userPosts = userPosts;
  factory _ProfileState.fromJson(Map<String, dynamic> json) => _$ProfileStateFromJson(json);

@override final  PublicUser? user;
@override final  String? base64;
 final  List<UserPost> _userPosts;
@override List<UserPost> get userPosts {
  if (_userPosts is EqualUnmodifiableListView) return _userPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userPosts);
}


/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStateCopyWith<_ProfileState> get copyWith => __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileState&&(identical(other.user, user) || other.user == user)&&(identical(other.base64, base64) || other.base64 == base64)&&const DeepCollectionEquality().equals(other._userPosts, _userPosts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,base64,const DeepCollectionEquality().hash(_userPosts));

@override
String toString() {
  return 'ProfileState(user: $user, base64: $base64, userPosts: $userPosts)';
}


}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res> implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(_ProfileState value, $Res Function(_ProfileState) _then) = __$ProfileStateCopyWithImpl;
@override @useResult
$Res call({
 PublicUser? user, String? base64, List<UserPost> userPosts
});


@override $PublicUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? base64 = freezed,Object? userPosts = null,}) {
  return _then(_ProfileState(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as PublicUser?,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,userPosts: null == userPosts ? _self._userPosts : userPosts // ignore: cast_nullable_to_non_nullable
as List<UserPost>,
  ));
}

/// Create a copy of ProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $PublicUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
