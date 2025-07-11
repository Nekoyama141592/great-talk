// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_mute_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostMuteModel {

 String get activeUid; dynamic get createdAt; String get postId;
/// Create a copy of PostMuteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostMuteModelCopyWith<PostMuteModel> get copyWith => _$PostMuteModelCopyWithImpl<PostMuteModel>(this as PostMuteModel, _$identity);

  /// Serializes this PostMuteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostMuteModel&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),postId);

@override
String toString() {
  return 'PostMuteModel(activeUid: $activeUid, createdAt: $createdAt, postId: $postId)';
}


}

/// @nodoc
abstract mixin class $PostMuteModelCopyWith<$Res>  {
  factory $PostMuteModelCopyWith(PostMuteModel value, $Res Function(PostMuteModel) _then) = _$PostMuteModelCopyWithImpl;
@useResult
$Res call({
 String activeUid, dynamic createdAt, String postId
});




}
/// @nodoc
class _$PostMuteModelCopyWithImpl<$Res>
    implements $PostMuteModelCopyWith<$Res> {
  _$PostMuteModelCopyWithImpl(this._self, this._then);

  final PostMuteModel _self;
  final $Res Function(PostMuteModel) _then;

/// Create a copy of PostMuteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? postId = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PostMuteModel implements PostMuteModel {
  const _PostMuteModel({required this.activeUid, required this.createdAt, required this.postId});
  factory _PostMuteModel.fromJson(Map<String, dynamic> json) => _$PostMuteModelFromJson(json);

@override final  String activeUid;
@override final  dynamic createdAt;
@override final  String postId;

/// Create a copy of PostMuteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostMuteModelCopyWith<_PostMuteModel> get copyWith => __$PostMuteModelCopyWithImpl<_PostMuteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostMuteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostMuteModel&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),postId);

@override
String toString() {
  return 'PostMuteModel(activeUid: $activeUid, createdAt: $createdAt, postId: $postId)';
}


}

/// @nodoc
abstract mixin class _$PostMuteModelCopyWith<$Res> implements $PostMuteModelCopyWith<$Res> {
  factory _$PostMuteModelCopyWith(_PostMuteModel value, $Res Function(_PostMuteModel) _then) = __$PostMuteModelCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, dynamic createdAt, String postId
});




}
/// @nodoc
class __$PostMuteModelCopyWithImpl<$Res>
    implements _$PostMuteModelCopyWith<$Res> {
  __$PostMuteModelCopyWithImpl(this._self, this._then);

  final _PostMuteModel _self;
  final $Res Function(_PostMuteModel) _then;

/// Create a copy of PostMuteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? postId = null,}) {
  return _then(_PostMuteModel(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
