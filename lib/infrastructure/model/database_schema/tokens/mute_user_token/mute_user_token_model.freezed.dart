// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_user_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MuteUserTokenModel {

 String get activeUid; dynamic get createdAt; String get passiveUid; String get tokenId; String get tokenType;
/// Create a copy of MuteUserTokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuteUserTokenModelCopyWith<MuteUserTokenModel> get copyWith => _$MuteUserTokenModelCopyWithImpl<MuteUserTokenModel>(this as MuteUserTokenModel, _$identity);

  /// Serializes this MuteUserTokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuteUserTokenModel&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid,tokenId,tokenType);

@override
String toString() {
  return 'MuteUserTokenModel(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class $MuteUserTokenModelCopyWith<$Res>  {
  factory $MuteUserTokenModelCopyWith(MuteUserTokenModel value, $Res Function(MuteUserTokenModel) _then) = _$MuteUserTokenModelCopyWithImpl;
@useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid, String tokenId, String tokenType
});




}
/// @nodoc
class _$MuteUserTokenModelCopyWithImpl<$Res>
    implements $MuteUserTokenModelCopyWith<$Res> {
  _$MuteUserTokenModelCopyWithImpl(this._self, this._then);

  final MuteUserTokenModel _self;
  final $Res Function(MuteUserTokenModel) _then;

/// Create a copy of MuteUserTokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MuteUserTokenModel implements MuteUserTokenModel {
  const _MuteUserTokenModel({required this.activeUid, required this.createdAt, required this.passiveUid, required this.tokenId, required this.tokenType});
  factory _MuteUserTokenModel.fromJson(Map<String, dynamic> json) => _$MuteUserTokenModelFromJson(json);

@override final  String activeUid;
@override final  dynamic createdAt;
@override final  String passiveUid;
@override final  String tokenId;
@override final  String tokenType;

/// Create a copy of MuteUserTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuteUserTokenModelCopyWith<_MuteUserTokenModel> get copyWith => __$MuteUserTokenModelCopyWithImpl<_MuteUserTokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MuteUserTokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuteUserTokenModel&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid,tokenId,tokenType);

@override
String toString() {
  return 'MuteUserTokenModel(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class _$MuteUserTokenModelCopyWith<$Res> implements $MuteUserTokenModelCopyWith<$Res> {
  factory _$MuteUserTokenModelCopyWith(_MuteUserTokenModel value, $Res Function(_MuteUserTokenModel) _then) = __$MuteUserTokenModelCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid, String tokenId, String tokenType
});




}
/// @nodoc
class __$MuteUserTokenModelCopyWithImpl<$Res>
    implements _$MuteUserTokenModelCopyWith<$Res> {
  __$MuteUserTokenModelCopyWithImpl(this._self, this._then);

  final _MuteUserTokenModel _self;
  final $Res Function(_MuteUserTokenModel) _then;

/// Create a copy of MuteUserTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_MuteUserTokenModel(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
