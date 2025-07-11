// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_post_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MutePostTokenModel {

 String get activeUid; dynamic get createdAt; String get postId; String get tokenId; String get tokenType;
/// Create a copy of MutePostTokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MutePostTokenModelCopyWith<MutePostTokenModel> get copyWith => _$MutePostTokenModelCopyWithImpl<MutePostTokenModel>(this as MutePostTokenModel, _$identity);

  /// Serializes this MutePostTokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MutePostTokenModel&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),postId,tokenId,tokenType);

@override
String toString() {
  return 'MutePostTokenModel(activeUid: $activeUid, createdAt: $createdAt, postId: $postId, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class $MutePostTokenModelCopyWith<$Res>  {
  factory $MutePostTokenModelCopyWith(MutePostTokenModel value, $Res Function(MutePostTokenModel) _then) = _$MutePostTokenModelCopyWithImpl;
@useResult
$Res call({
 String activeUid, dynamic createdAt, String postId, String tokenId, String tokenType
});




}
/// @nodoc
class _$MutePostTokenModelCopyWithImpl<$Res>
    implements $MutePostTokenModelCopyWith<$Res> {
  _$MutePostTokenModelCopyWithImpl(this._self, this._then);

  final MutePostTokenModel _self;
  final $Res Function(MutePostTokenModel) _then;

/// Create a copy of MutePostTokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? postId = null,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MutePostTokenModel implements MutePostTokenModel {
  const _MutePostTokenModel({required this.activeUid, required this.createdAt, required this.postId, required this.tokenId, required this.tokenType});
  factory _MutePostTokenModel.fromJson(Map<String, dynamic> json) => _$MutePostTokenModelFromJson(json);

@override final  String activeUid;
@override final  dynamic createdAt;
@override final  String postId;
@override final  String tokenId;
@override final  String tokenType;

/// Create a copy of MutePostTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MutePostTokenModelCopyWith<_MutePostTokenModel> get copyWith => __$MutePostTokenModelCopyWithImpl<_MutePostTokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MutePostTokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MutePostTokenModel&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.tokenId, tokenId) || other.tokenId == tokenId)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),postId,tokenId,tokenType);

@override
String toString() {
  return 'MutePostTokenModel(activeUid: $activeUid, createdAt: $createdAt, postId: $postId, tokenId: $tokenId, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class _$MutePostTokenModelCopyWith<$Res> implements $MutePostTokenModelCopyWith<$Res> {
  factory _$MutePostTokenModelCopyWith(_MutePostTokenModel value, $Res Function(_MutePostTokenModel) _then) = __$MutePostTokenModelCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, dynamic createdAt, String postId, String tokenId, String tokenType
});




}
/// @nodoc
class __$MutePostTokenModelCopyWithImpl<$Res>
    implements _$MutePostTokenModelCopyWith<$Res> {
  __$MutePostTokenModelCopyWithImpl(this._self, this._then);

  final _MutePostTokenModel _self;
  final $Res Function(_MutePostTokenModel) _then;

/// Create a copy of MutePostTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? postId = null,Object? tokenId = null,Object? tokenType = null,}) {
  return _then(_MutePostTokenModel(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,tokenId: null == tokenId ? _self.tokenId : tokenId // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
