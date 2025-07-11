// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_post_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LikePostToken {

 String get activeUid; dynamic get createdAt; String get passiveUid; String get postId; String get tokenId; String get tokenType;
/// Create a copy of LikePostToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikePostTokenCopyWith<LikePostToken> get copyWith => _$LikePostTokenCopyWithImpl<LikePostToken>(this as LikePostToken, _$identity);

  /// Serializes this LikePostToken to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikePostToken&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid,postId,tokenId,tokenType);

@override
String toString() {
  return 'LikePostToken(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, postId: $postId, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class $LikePostTokenCopyWith<$Res>  {
  factory $LikePostTokenCopyWith(LikePostToken value, $Res Function(LikePostToken) _then) = _$LikePostTokenCopyWithImpl;
@useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid, String postId, String tokenId, String tokenType
});




}
/// @nodoc
class _$LikePostTokenCopyWithImpl<$Res>
    implements $LikePostTokenCopyWith<$Res> {
  _$LikePostTokenCopyWithImpl(this._self, this._then);

  final LikePostToken _self;
  final $Res Function(LikePostToken) _then;

/// Create a copy of LikePostToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,Object? postId = null,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LikePostToken implements LikePostToken {
  const _LikePostToken({required this.activeUid, required this.createdAt, required this.passiveUid, required this.postId, required this.tokenId, required this.tokenType});
  factory _LikePostToken.fromJson(Map<String, dynamic> json) => _$LikePostTokenFromJson(json);

@override final  String activeUid;
@override final  dynamic createdAt;
@override final  String passiveUid;
@override final  String postId;
@override final  String tokenId;
@override final  String tokenType;

/// Create a copy of LikePostToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikePostTokenCopyWith<_LikePostToken> get copyWith => __$LikePostTokenCopyWithImpl<_LikePostToken>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikePostTokenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikePostToken&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid,postId,tokenId,tokenType);

@override
String toString() {
  return 'LikePostToken(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, postId: $postId, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class _$LikePostTokenCopyWith<$Res> implements $LikePostTokenCopyWith<$Res> {
  factory _$LikePostTokenCopyWith(_LikePostToken value, $Res Function(_LikePostToken) _then) = __$LikePostTokenCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid, String postId, String tokenId, String tokenType
});




}
/// @nodoc
class __$LikePostTokenCopyWithImpl<$Res>
    implements _$LikePostTokenCopyWith<$Res> {
  __$LikePostTokenCopyWithImpl(this._self, this._then);

  final _LikePostToken _self;
  final $Res Function(_LikePostToken) _then;

/// Create a copy of LikePostToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,Object? postId = null,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_LikePostToken(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
