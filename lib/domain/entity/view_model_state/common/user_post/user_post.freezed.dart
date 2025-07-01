// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPost {

 Post get post; PublicUserEntity? get user; String? get base64;
/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPostCopyWith<UserPost> get copyWith => _$UserPostCopyWithImpl<UserPost>(this as UserPost, _$identity);

  /// Serializes this UserPost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPost&&(identical(other.post, post) || other.post == post)&&(identical(other.user, user) || other.user == user)&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,post,user,base64);

@override
String toString() {
  return 'UserPost(post: $post, user: $user, base64: $base64)';
}


}

/// @nodoc
abstract mixin class $UserPostCopyWith<$Res>  {
  factory $UserPostCopyWith(UserPost value, $Res Function(UserPost) _then) = _$UserPostCopyWithImpl;
@useResult
$Res call({
 Post post, PublicUserEntity? user, String? base64
});


$PostCopyWith<$Res> get post;$PublicUserEntityCopyWith<$Res>? get user;

}
/// @nodoc
class _$UserPostCopyWithImpl<$Res>
    implements $UserPostCopyWith<$Res> {
  _$UserPostCopyWithImpl(this._self, this._then);

  final UserPost _self;
  final $Res Function(UserPost) _then;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? post = null,Object? user = freezed,Object? base64 = freezed,}) {
  return _then(_self.copyWith(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as PublicUserEntity?,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicUserEntityCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $PublicUserEntityCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _UserPost implements UserPost {
  const _UserPost({required this.post, required this.user, required this.base64});
  factory _UserPost.fromJson(Map<String, dynamic> json) => _$UserPostFromJson(json);

@override final  Post post;
@override final  PublicUserEntity? user;
@override final  String? base64;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPostCopyWith<_UserPost> get copyWith => __$UserPostCopyWithImpl<_UserPost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPost&&(identical(other.post, post) || other.post == post)&&(identical(other.user, user) || other.user == user)&&(identical(other.base64, base64) || other.base64 == base64));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,post,user,base64);

@override
String toString() {
  return 'UserPost(post: $post, user: $user, base64: $base64)';
}


}

/// @nodoc
abstract mixin class _$UserPostCopyWith<$Res> implements $UserPostCopyWith<$Res> {
  factory _$UserPostCopyWith(_UserPost value, $Res Function(_UserPost) _then) = __$UserPostCopyWithImpl;
@override @useResult
$Res call({
 Post post, PublicUserEntity? user, String? base64
});


@override $PostCopyWith<$Res> get post;@override $PublicUserEntityCopyWith<$Res>? get user;

}
/// @nodoc
class __$UserPostCopyWithImpl<$Res>
    implements _$UserPostCopyWith<$Res> {
  __$UserPostCopyWithImpl(this._self, this._then);

  final _UserPost _self;
  final $Res Function(_UserPost) _then;

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? post = null,Object? user = freezed,Object? base64 = freezed,}) {
  return _then(_UserPost(
post: null == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as PublicUserEntity?,base64: freezed == base64 ? _self.base64 : base64 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res> get post {
  
  return $PostCopyWith<$Res>(_self.post, (value) {
    return _then(_self.copyWith(post: value));
  });
}/// Create a copy of UserPost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PublicUserEntityCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $PublicUserEntityCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
