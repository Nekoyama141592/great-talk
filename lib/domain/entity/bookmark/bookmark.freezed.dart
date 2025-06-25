// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bookmark {

 String get activeUid; String get categoryId; dynamic get createdAt; String get passiveUid; dynamic get postRef; String get postId; dynamic get ref;
/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkCopyWith<Bookmark> get copyWith => _$BookmarkCopyWithImpl<Bookmark>(this as Bookmark, _$identity);

  /// Serializes this Bookmark to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bookmark&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&const DeepCollectionEquality().equals(other.postRef, postRef)&&(identical(other.postId, postId) || other.postId == postId)&&const DeepCollectionEquality().equals(other.ref, ref));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,categoryId,const DeepCollectionEquality().hash(createdAt),passiveUid,const DeepCollectionEquality().hash(postRef),postId,const DeepCollectionEquality().hash(ref));

@override
String toString() {
  return 'Bookmark(activeUid: $activeUid, categoryId: $categoryId, createdAt: $createdAt, passiveUid: $passiveUid, postRef: $postRef, postId: $postId, ref: $ref)';
}


}

/// @nodoc
abstract mixin class $BookmarkCopyWith<$Res>  {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) _then) = _$BookmarkCopyWithImpl;
@useResult
$Res call({
 String activeUid, String categoryId, dynamic createdAt, String passiveUid, dynamic postRef, String postId, dynamic ref
});




}
/// @nodoc
class _$BookmarkCopyWithImpl<$Res>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._self, this._then);

  final Bookmark _self;
  final $Res Function(Bookmark) _then;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? categoryId = null,Object? createdAt = freezed,Object? passiveUid = null,Object? postRef = freezed,Object? postId = null,Object? ref = freezed,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,postRef: freezed == postRef ? _self.postRef : postRef // ignore: cast_nullable_to_non_nullable
as dynamic,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,ref: freezed == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Bookmark implements Bookmark {
  const _Bookmark({required this.activeUid, required this.categoryId, required this.createdAt, required this.passiveUid, required this.postRef, required this.postId, required this.ref});
  factory _Bookmark.fromJson(Map<String, dynamic> json) => _$BookmarkFromJson(json);

@override final  String activeUid;
@override final  String categoryId;
@override final  dynamic createdAt;
@override final  String passiveUid;
@override final  dynamic postRef;
@override final  String postId;
@override final  dynamic ref;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkCopyWith<_Bookmark> get copyWith => __$BookmarkCopyWithImpl<_Bookmark>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bookmark&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid)&&const DeepCollectionEquality().equals(other.postRef, postRef)&&(identical(other.postId, postId) || other.postId == postId)&&const DeepCollectionEquality().equals(other.ref, ref));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,categoryId,const DeepCollectionEquality().hash(createdAt),passiveUid,const DeepCollectionEquality().hash(postRef),postId,const DeepCollectionEquality().hash(ref));

@override
String toString() {
  return 'Bookmark(activeUid: $activeUid, categoryId: $categoryId, createdAt: $createdAt, passiveUid: $passiveUid, postRef: $postRef, postId: $postId, ref: $ref)';
}


}

/// @nodoc
abstract mixin class _$BookmarkCopyWith<$Res> implements $BookmarkCopyWith<$Res> {
  factory _$BookmarkCopyWith(_Bookmark value, $Res Function(_Bookmark) _then) = __$BookmarkCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, String categoryId, dynamic createdAt, String passiveUid, dynamic postRef, String postId, dynamic ref
});




}
/// @nodoc
class __$BookmarkCopyWithImpl<$Res>
    implements _$BookmarkCopyWith<$Res> {
  __$BookmarkCopyWithImpl(this._self, this._then);

  final _Bookmark _self;
  final $Res Function(_Bookmark) _then;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? categoryId = null,Object? createdAt = freezed,Object? passiveUid = null,Object? postRef = freezed,Object? postId = null,Object? ref = freezed,}) {
  return _then(_Bookmark(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,postRef: freezed == postRef ? _self.postRef : postRef // ignore: cast_nullable_to_non_nullable
as dynamic,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,ref: freezed == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
