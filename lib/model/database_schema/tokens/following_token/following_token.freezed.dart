// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowingToken implements DiagnosticableTreeMixin {

 dynamic get createdAt; String get passiveUid; String get tokenId; String get tokenType;
/// Create a copy of FollowingToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowingTokenCopyWith<FollowingToken> get copyWith => _$FollowingTokenCopyWithImpl<FollowingToken>(this as FollowingToken, _$identity);

  /// Serializes this FollowingToken to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FollowingToken'))
    ..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('passiveUid', passiveUid))..add(DiagnosticsProperty('tokenId', tokenId))..add(DiagnosticsProperty('tokenType', tokenType));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowingToken&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),passiveUid,tokenId,tokenType);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FollowingToken(createdAt: $createdAt, passiveUid: $passiveUid, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class $FollowingTokenCopyWith<$Res>  {
  factory $FollowingTokenCopyWith(FollowingToken value, $Res Function(FollowingToken) _then) = _$FollowingTokenCopyWithImpl;
@useResult
$Res call({
 dynamic createdAt, String passiveUid, String tokenId, String tokenType
});




}
/// @nodoc
class _$FollowingTokenCopyWithImpl<$Res>
    implements $FollowingTokenCopyWith<$Res> {
  _$FollowingTokenCopyWithImpl(this._self, this._then);

  final FollowingToken _self;
  final $Res Function(FollowingToken) _then;

/// Create a copy of FollowingToken
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

class _FollowingToken extends FollowingToken with DiagnosticableTreeMixin {
  const _FollowingToken({required this.createdAt, required this.passiveUid, required this.tokenId, required this.tokenType}): super._();
  factory _FollowingToken.fromJson(Map<String, dynamic> json) => _$FollowingTokenFromJson(json);

@override final  dynamic createdAt;
@override final  String passiveUid;
@override final  String tokenId;
@override final  String tokenType;

/// Create a copy of FollowingToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowingTokenCopyWith<_FollowingToken> get copyWith => __$FollowingTokenCopyWithImpl<_FollowingToken>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowingTokenToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'FollowingToken'))
    ..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('passiveUid', passiveUid))..add(DiagnosticsProperty('tokenId', tokenId))..add(DiagnosticsProperty('tokenType', tokenType));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowingToken&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),passiveUid,tokenId,tokenType);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'FollowingToken(createdAt: $createdAt, passiveUid: $passiveUid, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class _$FollowingTokenCopyWith<$Res> implements $FollowingTokenCopyWith<$Res> {
  factory _$FollowingTokenCopyWith(_FollowingToken value, $Res Function(_FollowingToken) _then) = __$FollowingTokenCopyWithImpl;
@override @useResult
$Res call({
 dynamic createdAt, String passiveUid, String tokenId, String tokenType
});




}
/// @nodoc
class __$FollowingTokenCopyWithImpl<$Res>
    implements _$FollowingTokenCopyWith<$Res> {
  __$FollowingTokenCopyWithImpl(this._self, this._then);

  final _FollowingToken _self;
  final $Res Function(_FollowingToken) _then;

/// Create a copy of FollowingToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? passiveUid = null,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_FollowingToken(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
