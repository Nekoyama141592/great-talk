// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_user_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MuteUserTokenEntity {

 String get activeUid; String get passiveUid; String get tokenId;
/// Create a copy of MuteUserTokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuteUserTokenEntityCopyWith<MuteUserTokenEntity> get copyWith => _$MuteUserTokenEntityCopyWithImpl<MuteUserTokenEntity>(this as MuteUserTokenEntity, _$identity);

  /// Serializes this MuteUserTokenEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuteUserTokenEntity&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,passiveUid,tokenId);

@override
String toString() {
  return 'MuteUserTokenEntity(activeUid: $activeUid, passiveUid: $passiveUid, tokenId: $tokenId)';
}


}

/// @nodoc
abstract mixin class $MuteUserTokenEntityCopyWith<$Res>  {
  factory $MuteUserTokenEntityCopyWith(MuteUserTokenEntity value, $Res Function(MuteUserTokenEntity) _then) = _$MuteUserTokenEntityCopyWithImpl;
@useResult
$Res call({
 String activeUid, String passiveUid, String tokenId
});




}
/// @nodoc
class _$MuteUserTokenEntityCopyWithImpl<$Res>
    implements $MuteUserTokenEntityCopyWith<$Res> {
  _$MuteUserTokenEntityCopyWithImpl(this._self, this._then);

  final MuteUserTokenEntity _self;
  final $Res Function(MuteUserTokenEntity) _then;

/// Create a copy of MuteUserTokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? passiveUid = null,Object? tokenId = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MuteUserTokenEntity extends MuteUserTokenEntity {
  const _MuteUserTokenEntity({required this.activeUid, required this.passiveUid, required this.tokenId}): super._();
  factory _MuteUserTokenEntity.fromJson(Map<String, dynamic> json) => _$MuteUserTokenEntityFromJson(json);

@override final  String activeUid;
@override final  String passiveUid;
@override final  String tokenId;

/// Create a copy of MuteUserTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuteUserTokenEntityCopyWith<_MuteUserTokenEntity> get copyWith => __$MuteUserTokenEntityCopyWithImpl<_MuteUserTokenEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MuteUserTokenEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuteUserTokenEntity&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,passiveUid,tokenId);

@override
String toString() {
  return 'MuteUserTokenEntity(activeUid: $activeUid, passiveUid: $passiveUid, tokenId: $tokenId)';
}


}

/// @nodoc
abstract mixin class _$MuteUserTokenEntityCopyWith<$Res> implements $MuteUserTokenEntityCopyWith<$Res> {
  factory _$MuteUserTokenEntityCopyWith(_MuteUserTokenEntity value, $Res Function(_MuteUserTokenEntity) _then) = __$MuteUserTokenEntityCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, String passiveUid, String tokenId
});




}
/// @nodoc
class __$MuteUserTokenEntityCopyWithImpl<$Res>
    implements _$MuteUserTokenEntityCopyWith<$Res> {
  __$MuteUserTokenEntityCopyWithImpl(this._self, this._then);

  final _MuteUserTokenEntity _self;
  final $Res Function(_MuteUserTokenEntity) _then;

/// Create a copy of MuteUserTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? passiveUid = null,Object? tokenId = null,}) {
  return _then(_MuteUserTokenEntity(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
