// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_user_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MuteUserToken {

 String get activeUid; dynamic get createdAt; String get passiveUid; dynamic get passiveUserRef; String get tokenId; String get tokenType;
/// Create a copy of MuteUserToken
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuteUserTokenCopyWith<MuteUserToken> get copyWith => _$MuteUserTokenCopyWithImpl<MuteUserToken>(this as MuteUserToken, _$identity);

  /// Serializes this MuteUserToken to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuteUserToken&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&const DeepCollectionEquality().equals(other.passiveUserRef, passiveUserRef)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid,const DeepCollectionEquality().hash(passiveUserRef),tokenId,tokenType);

@override
String toString() {
  return 'MuteUserToken(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, passiveUserRef: $passiveUserRef, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class $MuteUserTokenCopyWith<$Res>  {
  factory $MuteUserTokenCopyWith(MuteUserToken value, $Res Function(MuteUserToken) _then) = _$MuteUserTokenCopyWithImpl;
@useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid, dynamic passiveUserRef, String tokenId, String tokenType
});




}
/// @nodoc
class _$MuteUserTokenCopyWithImpl<$Res>
    implements $MuteUserTokenCopyWith<$Res> {
  _$MuteUserTokenCopyWithImpl(this._self, this._then);

  final MuteUserToken _self;
  final $Res Function(MuteUserToken) _then;

/// Create a copy of MuteUserToken
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,Object? passiveUserRef = freezed,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,passiveUserRef: freezed == passiveUserRef ? _self.passiveUserRef : passiveUserRef // ignore: cast_nullable_to_non_nullable
as dynamic,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MuteUserToken implements MuteUserToken {
  const _MuteUserToken({required this.activeUid, required this.createdAt, required this.passiveUid, required this.passiveUserRef, required this.tokenId, required this.tokenType});
  factory _MuteUserToken.fromJson(Map<String, dynamic> json) => _$MuteUserTokenFromJson(json);

@override final  String activeUid;
@override final  dynamic createdAt;
@override final  String passiveUid;
@override final  dynamic passiveUserRef;
@override final  String tokenId;
@override final  String tokenType;

/// Create a copy of MuteUserToken
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuteUserTokenCopyWith<_MuteUserToken> get copyWith => __$MuteUserTokenCopyWithImpl<_MuteUserToken>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MuteUserTokenToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuteUserToken&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&const DeepCollectionEquality().equals(other.passiveUserRef, passiveUserRef)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid,const DeepCollectionEquality().hash(passiveUserRef),tokenId,tokenType);

@override
String toString() {
  return 'MuteUserToken(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, passiveUserRef: $passiveUserRef, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class _$MuteUserTokenCopyWith<$Res> implements $MuteUserTokenCopyWith<$Res> {
  factory _$MuteUserTokenCopyWith(_MuteUserToken value, $Res Function(_MuteUserToken) _then) = __$MuteUserTokenCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid, dynamic passiveUserRef, String tokenId, String tokenType
});




}
/// @nodoc
class __$MuteUserTokenCopyWithImpl<$Res>
    implements _$MuteUserTokenCopyWith<$Res> {
  __$MuteUserTokenCopyWithImpl(this._self, this._then);

  final _MuteUserToken _self;
  final $Res Function(_MuteUserToken) _then;

/// Create a copy of MuteUserToken
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,Object? passiveUserRef = freezed,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_MuteUserToken(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,passiveUserRef: freezed == passiveUserRef ? _self.passiveUserRef : passiveUserRef // ignore: cast_nullable_to_non_nullable
as dynamic,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
