// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_like_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostLikeModel {

 String get activeUid; dynamic get createdAt; String get passiveUid; String get postId;
/// Create a copy of PostLikeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostLikeModelCopyWith<PostLikeModel> get copyWith => _$PostLikeModelCopyWithImpl<PostLikeModel>(this as PostLikeModel, _$identity);

  /// Serializes this PostLikeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostLikeModel&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid,postId);

@override
String toString() {
  return 'PostLikeModel(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, postId: $postId)';
}


}

/// @nodoc
abstract mixin class $PostLikeModelCopyWith<$Res>  {
  factory $PostLikeModelCopyWith(PostLikeModel value, $Res Function(PostLikeModel) _then) = _$PostLikeModelCopyWithImpl;
@useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid, String postId
});




}
/// @nodoc
class _$PostLikeModelCopyWithImpl<$Res>
    implements $PostLikeModelCopyWith<$Res> {
  _$PostLikeModelCopyWithImpl(this._self, this._then);

  final PostLikeModel _self;
  final $Res Function(PostLikeModel) _then;

/// Create a copy of PostLikeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,Object? postId = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PostLikeModel extends PostLikeModel {
  const _PostLikeModel({required this.activeUid, required this.createdAt, required this.passiveUid, required this.postId}): super._();
  factory _PostLikeModel.fromJson(Map<String, dynamic> json) => _$PostLikeModelFromJson(json);

@override final  String activeUid;
@override final  dynamic createdAt;
@override final  String passiveUid;
@override final  String postId;

/// Create a copy of PostLikeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostLikeModelCopyWith<_PostLikeModel> get copyWith => __$PostLikeModelCopyWithImpl<_PostLikeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostLikeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostLikeModel&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid,postId);

@override
String toString() {
  return 'PostLikeModel(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, postId: $postId)';
}


}

/// @nodoc
abstract mixin class _$PostLikeModelCopyWith<$Res> implements $PostLikeModelCopyWith<$Res> {
  factory _$PostLikeModelCopyWith(_PostLikeModel value, $Res Function(_PostLikeModel) _then) = __$PostLikeModelCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid, String postId
});




}
/// @nodoc
class __$PostLikeModelCopyWithImpl<$Res>
    implements _$PostLikeModelCopyWith<$Res> {
  __$PostLikeModelCopyWithImpl(this._self, this._then);

  final _PostLikeModel _self;
  final $Res Function(_PostLikeModel) _then;

/// Create a copy of PostLikeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,Object? postId = null,}) {
  return _then(_PostLikeModel(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
