// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowingTokenEntity {

 String get passiveUid; String get tokenId;
/// Create a copy of FollowingTokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowingTokenEntityCopyWith<FollowingTokenEntity> get copyWith => _$FollowingTokenEntityCopyWithImpl<FollowingTokenEntity>(this as FollowingTokenEntity, _$identity);

  /// Serializes this FollowingTokenEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowingTokenEntity&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passiveUid,tokenId);

@override
String toString() {
  return 'FollowingTokenEntity(passiveUid: $passiveUid, tokenId: $tokenId)';
}


}

/// @nodoc
abstract mixin class $FollowingTokenEntityCopyWith<$Res>  {
  factory $FollowingTokenEntityCopyWith(FollowingTokenEntity value, $Res Function(FollowingTokenEntity) _then) = _$FollowingTokenEntityCopyWithImpl;
@useResult
$Res call({
 String passiveUid, String tokenId
});




}
/// @nodoc
class _$FollowingTokenEntityCopyWithImpl<$Res>
    implements $FollowingTokenEntityCopyWith<$Res> {
  _$FollowingTokenEntityCopyWithImpl(this._self, this._then);

  final FollowingTokenEntity _self;
  final $Res Function(FollowingTokenEntity) _then;

/// Create a copy of FollowingTokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? passiveUid = null,Object? tokenId = null,}) {
  return _then(_self.copyWith(
passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FollowingTokenEntity extends FollowingTokenEntity {
  const _FollowingTokenEntity({required this.passiveUid, required this.tokenId}): super._();
  factory _FollowingTokenEntity.fromJson(Map<String, dynamic> json) => _$FollowingTokenEntityFromJson(json);

@override final  String passiveUid;
@override final  String tokenId;

/// Create a copy of FollowingTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowingTokenEntityCopyWith<_FollowingTokenEntity> get copyWith => __$FollowingTokenEntityCopyWithImpl<_FollowingTokenEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowingTokenEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowingTokenEntity&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,passiveUid,tokenId);

@override
String toString() {
  return 'FollowingTokenEntity(passiveUid: $passiveUid, tokenId: $tokenId)';
}


}

/// @nodoc
abstract mixin class _$FollowingTokenEntityCopyWith<$Res> implements $FollowingTokenEntityCopyWith<$Res> {
  factory _$FollowingTokenEntityCopyWith(_FollowingTokenEntity value, $Res Function(_FollowingTokenEntity) _then) = __$FollowingTokenEntityCopyWithImpl;
@override @useResult
$Res call({
 String passiveUid, String tokenId
});




}
/// @nodoc
class __$FollowingTokenEntityCopyWithImpl<$Res>
    implements _$FollowingTokenEntityCopyWith<$Res> {
  __$FollowingTokenEntityCopyWithImpl(this._self, this._then);

  final _FollowingTokenEntity _self;
  final $Res Function(_FollowingTokenEntity) _then;

/// Create a copy of FollowingTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? passiveUid = null,Object? tokenId = null,}) {
  return _then(_FollowingTokenEntity(
passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
