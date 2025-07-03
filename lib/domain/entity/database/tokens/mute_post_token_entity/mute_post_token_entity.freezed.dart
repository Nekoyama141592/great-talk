// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_post_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MutePostTokenEntity {

 String get activeUid; String get postId; String get tokenId;
/// Create a copy of MutePostTokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MutePostTokenEntityCopyWith<MutePostTokenEntity> get copyWith => _$MutePostTokenEntityCopyWithImpl<MutePostTokenEntity>(this as MutePostTokenEntity, _$identity);

  /// Serializes this MutePostTokenEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MutePostTokenEntity&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,postId,tokenId);

@override
String toString() {
  return 'MutePostTokenEntity(activeUid: $activeUid, postId: $postId, tokenId: $tokenId)';
}


}

/// @nodoc
abstract mixin class $MutePostTokenEntityCopyWith<$Res>  {
  factory $MutePostTokenEntityCopyWith(MutePostTokenEntity value, $Res Function(MutePostTokenEntity) _then) = _$MutePostTokenEntityCopyWithImpl;
@useResult
$Res call({
 String activeUid, String postId, String tokenId
});




}
/// @nodoc
class _$MutePostTokenEntityCopyWithImpl<$Res>
    implements $MutePostTokenEntityCopyWith<$Res> {
  _$MutePostTokenEntityCopyWithImpl(this._self, this._then);

  final MutePostTokenEntity _self;
  final $Res Function(MutePostTokenEntity) _then;

/// Create a copy of MutePostTokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? postId = null,Object? tokenId = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MutePostTokenEntity extends MutePostTokenEntity {
  const _MutePostTokenEntity({required this.activeUid, required this.postId, required this.tokenId}): super._();
  factory _MutePostTokenEntity.fromJson(Map<String, dynamic> json) => _$MutePostTokenEntityFromJson(json);

@override final  String activeUid;
@override final  String postId;
@override final  String tokenId;

/// Create a copy of MutePostTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MutePostTokenEntityCopyWith<_MutePostTokenEntity> get copyWith => __$MutePostTokenEntityCopyWithImpl<_MutePostTokenEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MutePostTokenEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MutePostTokenEntity&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,postId,tokenId);

@override
String toString() {
  return 'MutePostTokenEntity(activeUid: $activeUid, postId: $postId, tokenId: $tokenId)';
}


}

/// @nodoc
abstract mixin class _$MutePostTokenEntityCopyWith<$Res> implements $MutePostTokenEntityCopyWith<$Res> {
  factory _$MutePostTokenEntityCopyWith(_MutePostTokenEntity value, $Res Function(_MutePostTokenEntity) _then) = __$MutePostTokenEntityCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, String postId, String tokenId
});




}
/// @nodoc
class __$MutePostTokenEntityCopyWithImpl<$Res>
    implements _$MutePostTokenEntityCopyWith<$Res> {
  __$MutePostTokenEntityCopyWithImpl(this._self, this._then);

  final _MutePostTokenEntity _self;
  final $Res Function(_MutePostTokenEntity) _then;

/// Create a copy of MutePostTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? postId = null,Object? tokenId = null,}) {
  return _then(_MutePostTokenEntity(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
