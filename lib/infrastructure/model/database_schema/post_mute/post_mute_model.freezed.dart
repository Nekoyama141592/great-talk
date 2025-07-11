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
mixin _$PostMute {

 String get activeUid; dynamic get createdAt; String get postId;
/// Create a copy of PostMute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostMuteCopyWith<PostMute> get copyWith => _$PostMuteCopyWithImpl<PostMute>(this as PostMute, _$identity);

  /// Serializes this PostMute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostMute&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),postId);

@override
String toString() {
  return 'PostMute(activeUid: $activeUid, createdAt: $createdAt, postId: $postId)';
}


}

/// @nodoc
abstract mixin class $PostMuteCopyWith<$Res>  {
  factory $PostMuteCopyWith(PostMute value, $Res Function(PostMute) _then) = _$PostMuteCopyWithImpl;
@useResult
$Res call({
 String activeUid, dynamic createdAt, String postId
});




}
/// @nodoc
class _$PostMuteCopyWithImpl<$Res>
    implements $PostMuteCopyWith<$Res> {
  _$PostMuteCopyWithImpl(this._self, this._then);

  final PostMute _self;
  final $Res Function(PostMute) _then;

/// Create a copy of PostMute
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

class _PostMute implements PostMute {
  const _PostMute({required this.activeUid, required this.createdAt, required this.postId});
  factory _PostMute.fromJson(Map<String, dynamic> json) => _$PostMuteFromJson(json);

@override final  String activeUid;
@override final  dynamic createdAt;
@override final  String postId;

/// Create a copy of PostMute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostMuteCopyWith<_PostMute> get copyWith => __$PostMuteCopyWithImpl<_PostMute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostMuteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostMute&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),postId);

@override
String toString() {
  return 'PostMute(activeUid: $activeUid, createdAt: $createdAt, postId: $postId)';
}


}

/// @nodoc
abstract mixin class _$PostMuteCopyWith<$Res> implements $PostMuteCopyWith<$Res> {
  factory _$PostMuteCopyWith(_PostMute value, $Res Function(_PostMute) _then) = __$PostMuteCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, dynamic createdAt, String postId
});




}
/// @nodoc
class __$PostMuteCopyWithImpl<$Res>
    implements _$PostMuteCopyWith<$Res> {
  __$PostMuteCopyWithImpl(this._self, this._then);

  final _PostMute _self;
  final $Res Function(_PostMute) _then;

/// Create a copy of PostMute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? postId = null,}) {
  return _then(_PostMute(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
