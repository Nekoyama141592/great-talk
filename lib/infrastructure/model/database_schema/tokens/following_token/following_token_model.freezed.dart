// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowingTokenModel implements DiagnosticableTreeMixin {

 dynamic get createdAt; String get passiveUid; String get tokenId; String get tokenType;
/// Create a copy of FollowingTokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowingTokenModelCopyWith<FollowingTokenModel> get copyWith => _$FollowingTokenModelCopyWithImpl<FollowingTokenModel>(this as FollowingTokenModel, _$identity);

  /// Serializes this FollowingTokenModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FollowingTokenModel'))
    ..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('passiveUid', passiveUid))..add(DiagnosticsProperty('tokenId', tokenId))..add(DiagnosticsProperty('tokenType', tokenType));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowingTokenModel&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),passiveUid,tokenId,tokenType);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FollowingTokenModel(createdAt: $createdAt, passiveUid: $passiveUid, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class $FollowingTokenModelCopyWith<$Res>  {
  factory $FollowingTokenModelCopyWith(FollowingTokenModel value, $Res Function(FollowingTokenModel) _then) = _$FollowingTokenModelCopyWithImpl;
@useResult
$Res call({
 dynamic createdAt, String passiveUid, String tokenId, String tokenType
});




}
/// @nodoc
class _$FollowingTokenModelCopyWithImpl<$Res>
    implements $FollowingTokenModelCopyWith<$Res> {
  _$FollowingTokenModelCopyWithImpl(this._self, this._then);

  final FollowingTokenModel _self;
  final $Res Function(FollowingTokenModel) _then;

/// Create a copy of FollowingTokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = freezed,Object? passiveUid = null,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_self.copyWith(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FollowingTokenModel extends FollowingTokenModel with DiagnosticableTreeMixin {
  const _FollowingTokenModel({required this.createdAt, required this.passiveUid, required this.tokenId, required this.tokenType}): super._();
  factory _FollowingTokenModel.fromJson(Map<String, dynamic> json) => _$FollowingTokenModelFromJson(json);

@override final  dynamic createdAt;
@override final  String passiveUid;
@override final  String tokenId;
@override final  String tokenType;

/// Create a copy of FollowingTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowingTokenModelCopyWith<_FollowingTokenModel> get copyWith => __$FollowingTokenModelCopyWithImpl<_FollowingTokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowingTokenModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FollowingTokenModel'))
    ..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('passiveUid', passiveUid))..add(DiagnosticsProperty('tokenId', tokenId))..add(DiagnosticsProperty('tokenType', tokenType));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowingTokenModel&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),passiveUid,tokenId,tokenType);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FollowingTokenModel(createdAt: $createdAt, passiveUid: $passiveUid, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class _$FollowingTokenModelCopyWith<$Res> implements $FollowingTokenModelCopyWith<$Res> {
  factory _$FollowingTokenModelCopyWith(_FollowingTokenModel value, $Res Function(_FollowingTokenModel) _then) = __$FollowingTokenModelCopyWithImpl;
@override @useResult
$Res call({
 dynamic createdAt, String passiveUid, String tokenId, String tokenType
});




}
/// @nodoc
class __$FollowingTokenModelCopyWithImpl<$Res>
    implements _$FollowingTokenModelCopyWith<$Res> {
  __$FollowingTokenModelCopyWithImpl(this._self, this._then);

  final _FollowingTokenModel _self;
  final $Res Function(_FollowingTokenModel) _then;

/// Create a copy of FollowingTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? passiveUid = null,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_FollowingTokenModel(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
