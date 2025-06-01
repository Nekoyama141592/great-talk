// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageUser {

 PublicUser? get user; String? get base64;
/// Create a copy of ImageUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageUserCopyWith<ImageUser> get copyWith => _$ImageUserCopyWithImpl<ImageUser>(this as ImageUser, _$identity);

  /// Serializes this ImageUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageUser&&(identical(other.user, user) || other.user == user)&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,base64);

@override
String toString() {
  return 'ImageUser(user: $user, base64: $base64)';
}


}

/// @nodoc
abstract mixin class $ImageUserCopyWith<$Res>  {
  factory $ImageUserCopyWith(ImageUser value, $Res Function(ImageUser) _then) = _$ImageUserCopyWithImpl;
@useResult
$Res call({
 PublicUser? user, String? base64
});


$PublicUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$ImageUserCopyWithImpl<$Res>
    implements $ImageUserCopyWith<$Res> {
  _$ImageUserCopyWithImpl(this._self, this._then);

  final ImageUser _self;
  final $Res Function(ImageUser) _then;

/// Create a copy of ImageUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = freezed,Object? base64 = freezed,}) {
  return _then(_self.copyWith(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as PublicUser?,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ImageUser
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

class _ImageUser implements ImageUser {
  const _ImageUser({required this.user, required this.base64});
  factory _ImageUser.fromJson(Map<String, dynamic> json) => _$ImageUserFromJson(json);

@override final  PublicUser? user;
@override final  String? base64;

/// Create a copy of ImageUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageUserCopyWith<_ImageUser> get copyWith => __$ImageUserCopyWithImpl<_ImageUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageUser&&(identical(other.user, user) || other.user == user)&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,base64);

@override
String toString() {
  return 'ImageUser(user: $user, base64: $base64)';
}


}

/// @nodoc
abstract mixin class _$ImageUserCopyWith<$Res> implements $ImageUserCopyWith<$Res> {
  factory _$ImageUserCopyWith(_ImageUser value, $Res Function(_ImageUser) _then) = __$ImageUserCopyWithImpl;
@override @useResult
$Res call({
 PublicUser? user, String? base64
});


@override $PublicUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$ImageUserCopyWithImpl<$Res>
    implements _$ImageUserCopyWith<$Res> {
  __$ImageUserCopyWithImpl(this._self, this._then);

  final _ImageUser _self;
  final $Res Function(_ImageUser) _then;

/// Create a copy of ImageUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? base64 = freezed,}) {
  return _then(_ImageUser(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as PublicUser?,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ImageUser
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
