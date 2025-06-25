// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Timeline {

 dynamic get createdAt; bool get isRead;// フォロワーが投稿を読んだかどうか
 String get posterUid; String get postId;
/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineCopyWith<Timeline> get copyWith => _$TimelineCopyWithImpl<Timeline>(this as Timeline, _$identity);

  /// Serializes this Timeline to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timeline&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.posterUid, posterUid) || other.posterUid == posterUid)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),isRead,posterUid,postId);

@override
String toString() {
  return 'Timeline(createdAt: $createdAt, isRead: $isRead, posterUid: $posterUid, postId: $postId)';
}


}

/// @nodoc
abstract mixin class $TimelineCopyWith<$Res>  {
  factory $TimelineCopyWith(Timeline value, $Res Function(Timeline) _then) = _$TimelineCopyWithImpl;
@useResult
$Res call({
 dynamic createdAt, bool isRead, String posterUid, String postId
});




}
/// @nodoc
class _$TimelineCopyWithImpl<$Res>
    implements $TimelineCopyWith<$Res> {
  _$TimelineCopyWithImpl(this._self, this._then);

  final Timeline _self;
  final $Res Function(Timeline) _then;

/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = freezed,Object? isRead = null,Object? posterUid = null,Object? postId = null,}) {
  return _then(_self.copyWith(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,posterUid: null == posterUid ? _self.posterUid : posterUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Timeline implements Timeline {
  const _Timeline({required this.createdAt, required this.isRead, required this.posterUid, required this.postId});
  factory _Timeline.fromJson(Map<String, dynamic> json) => _$TimelineFromJson(json);

@override final  dynamic createdAt;
@override final  bool isRead;
// フォロワーが投稿を読んだかどうか
@override final  String posterUid;
@override final  String postId;

/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineCopyWith<_Timeline> get copyWith => __$TimelineCopyWithImpl<_Timeline>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timeline&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.posterUid, posterUid) || other.posterUid == posterUid)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),isRead,posterUid,postId);

@override
String toString() {
  return 'Timeline(createdAt: $createdAt, isRead: $isRead, posterUid: $posterUid, postId: $postId)';
}


}

/// @nodoc
abstract mixin class _$TimelineCopyWith<$Res> implements $TimelineCopyWith<$Res> {
  factory _$TimelineCopyWith(_Timeline value, $Res Function(_Timeline) _then) = __$TimelineCopyWithImpl;
@override @useResult
$Res call({
 dynamic createdAt, bool isRead, String posterUid, String postId
});




}
/// @nodoc
class __$TimelineCopyWithImpl<$Res>
    implements _$TimelineCopyWith<$Res> {
  __$TimelineCopyWithImpl(this._self, this._then);

  final _Timeline _self;
  final $Res Function(_Timeline) _then;

/// Create a copy of Timeline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? isRead = null,Object? posterUid = null,Object? postId = null,}) {
  return _then(_Timeline(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,posterUid: null == posterUid ? _self.posterUid : posterUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
