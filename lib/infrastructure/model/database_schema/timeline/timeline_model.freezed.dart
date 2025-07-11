// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelineModel {

 dynamic get createdAt; bool get isRead;// フォロワーが投稿を読んだかどうか
 String get posterUid; String get postId;
/// Create a copy of TimelineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelineModelCopyWith<TimelineModel> get copyWith => _$TimelineModelCopyWithImpl<TimelineModel>(this as TimelineModel, _$identity);

  /// Serializes this TimelineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelineModel&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.posterUid, posterUid) || other.posterUid == posterUid)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),isRead,posterUid,postId);

@override
String toString() {
  return 'TimelineModel(createdAt: $createdAt, isRead: $isRead, posterUid: $posterUid, postId: $postId)';
}


}

/// @nodoc
abstract mixin class $TimelineModelCopyWith<$Res>  {
  factory $TimelineModelCopyWith(TimelineModel value, $Res Function(TimelineModel) _then) = _$TimelineModelCopyWithImpl;
@useResult
$Res call({
 dynamic createdAt, bool isRead, String posterUid, String postId
});




}
/// @nodoc
class _$TimelineModelCopyWithImpl<$Res>
    implements $TimelineModelCopyWith<$Res> {
  _$TimelineModelCopyWithImpl(this._self, this._then);

  final TimelineModel _self;
  final $Res Function(TimelineModel) _then;

/// Create a copy of TimelineModel
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

class _TimelineModel implements TimelineModel {
  const _TimelineModel({required this.createdAt, required this.isRead, required this.posterUid, required this.postId});
  factory _TimelineModel.fromJson(Map<String, dynamic> json) => _$TimelineModelFromJson(json);

@override final  dynamic createdAt;
@override final  bool isRead;
// フォロワーが投稿を読んだかどうか
@override final  String posterUid;
@override final  String postId;

/// Create a copy of TimelineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelineModelCopyWith<_TimelineModel> get copyWith => __$TimelineModelCopyWithImpl<_TimelineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelineModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelineModel&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.posterUid, posterUid) || other.posterUid == posterUid)&&(identical(other.postId, postId) || other.postId == postId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),isRead,posterUid,postId);

@override
String toString() {
  return 'TimelineModel(createdAt: $createdAt, isRead: $isRead, posterUid: $posterUid, postId: $postId)';
}


}

/// @nodoc
abstract mixin class _$TimelineModelCopyWith<$Res> implements $TimelineModelCopyWith<$Res> {
  factory _$TimelineModelCopyWith(_TimelineModel value, $Res Function(_TimelineModel) _then) = __$TimelineModelCopyWithImpl;
@override @useResult
$Res call({
 dynamic createdAt, bool isRead, String posterUid, String postId
});




}
/// @nodoc
class __$TimelineModelCopyWithImpl<$Res>
    implements _$TimelineModelCopyWith<$Res> {
  __$TimelineModelCopyWithImpl(this._self, this._then);

  final _TimelineModel _self;
  final $Res Function(_TimelineModel) _then;

/// Create a copy of TimelineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? isRead = null,Object? posterUid = null,Object? postId = null,}) {
  return _then(_TimelineModel(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,posterUid: null == posterUid ? _self.posterUid : posterUid // ignore: cast_nullable_to_non_nullable
as String,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
