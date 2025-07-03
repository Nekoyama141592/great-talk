// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_post_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LikePostTokenEntity {

 String get activeUid; String get passiveUid; String get postId; String get tokenId;
/// Create a copy of LikePostTokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LikePostTokenEntityCopyWith<LikePostTokenEntity> get copyWith => _$LikePostTokenEntityCopyWithImpl<LikePostTokenEntity>(this as LikePostTokenEntity, _$identity);

  /// Serializes this LikePostTokenEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LikePostTokenEntity&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,passiveUid,postId,tokenId);

@override
String toString() {
  return 'LikePostTokenEntity(activeUid: $activeUid, passiveUid: $passiveUid, postId: $postId, tokenId: $tokenId)';
}


}

/// @nodoc
abstract mixin class $LikePostTokenEntityCopyWith<$Res>  {
  factory $LikePostTokenEntityCopyWith(LikePostTokenEntity value, $Res Function(LikePostTokenEntity) _then) = _$LikePostTokenEntityCopyWithImpl;
@useResult
$Res call({
 String activeUid, String passiveUid, String postId, String tokenId
});




}
/// @nodoc
class _$LikePostTokenEntityCopyWithImpl<$Res>
    implements $LikePostTokenEntityCopyWith<$Res> {
  _$LikePostTokenEntityCopyWithImpl(this._self, this._then);

  final LikePostTokenEntity _self;
  final $Res Function(LikePostTokenEntity) _then;

/// Create a copy of LikePostTokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? passiveUid = null,Object? postId = null,Object? tokenId = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LikePostTokenEntity extends LikePostTokenEntity {
  const _LikePostTokenEntity({required this.activeUid, required this.passiveUid, required this.postId, required this.tokenId}): super._();
  factory _LikePostTokenEntity.fromJson(Map<String, dynamic> json) => _$LikePostTokenEntityFromJson(json);

@override final  String activeUid;
@override final  String passiveUid;
@override final  String postId;
@override final  String tokenId;

/// Create a copy of LikePostTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LikePostTokenEntityCopyWith<_LikePostTokenEntity> get copyWith => __$LikePostTokenEntityCopyWithImpl<_LikePostTokenEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LikePostTokenEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LikePostTokenEntity&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,passiveUid,postId,tokenId);

@override
String toString() {
  return 'LikePostTokenEntity(activeUid: $activeUid, passiveUid: $passiveUid, postId: $postId, tokenId: $tokenId)';
}


}

/// @nodoc
abstract mixin class _$LikePostTokenEntityCopyWith<$Res> implements $LikePostTokenEntityCopyWith<$Res> {
  factory _$LikePostTokenEntityCopyWith(_LikePostTokenEntity value, $Res Function(_LikePostTokenEntity) _then) = __$LikePostTokenEntityCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, String passiveUid, String postId, String tokenId
});




}
/// @nodoc
class __$LikePostTokenEntityCopyWithImpl<$Res>
    implements _$LikePostTokenEntityCopyWith<$Res> {
  __$LikePostTokenEntityCopyWithImpl(this._self, this._then);

  final _LikePostTokenEntity _self;
  final $Res Function(_LikePostTokenEntity) _then;

/// Create a copy of LikePostTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? passiveUid = null,Object? postId = null,Object? tokenId = null,}) {
  return _then(_LikePostTokenEntity(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
