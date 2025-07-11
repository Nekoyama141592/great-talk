// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostEntity {

@TimestampConverter() DateTime? get createdAt; CustomCompleteText get customCompleteText; DetectedText get description; ModeratedImage get image; int get likeCount; int get msgCount; String get postId; DetectedText get title; String get uid;@TimestampConverter() DateTime? get updatedAt;
/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostEntityCopyWith<PostEntity> get copyWith => _$PostEntityCopyWithImpl<PostEntity>(this as PostEntity, _$identity);

  /// Serializes this PostEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostEntity&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.customCompleteText, customCompleteText) || other.customCompleteText == customCompleteText)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.msgCount, msgCount) || other.msgCount == msgCount)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.title, title) || other.title == title)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,customCompleteText,description,image,likeCount,msgCount,postId,title,uid,updatedAt);

@override
String toString() {
  return 'PostEntity(createdAt: $createdAt, customCompleteText: $customCompleteText, description: $description, image: $image, likeCount: $likeCount, msgCount: $msgCount, postId: $postId, title: $title, uid: $uid, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PostEntityCopyWith<$Res>  {
  factory $PostEntityCopyWith(PostEntity value, $Res Function(PostEntity) _then) = _$PostEntityCopyWithImpl;
@useResult
$Res call({
@TimestampConverter() DateTime? createdAt, CustomCompleteText customCompleteText, DetectedText description, ModeratedImage image, int likeCount, int msgCount, String postId, DetectedText title, String uid,@TimestampConverter() DateTime? updatedAt
});


$CustomCompleteTextCopyWith<$Res> get customCompleteText;$DetectedTextCopyWith<$Res> get description;$ModeratedImageCopyWith<$Res> get image;$DetectedTextCopyWith<$Res> get title;

}
/// @nodoc
class _$PostEntityCopyWithImpl<$Res>
    implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._self, this._then);

  final PostEntity _self;
  final $Res Function(PostEntity) _then;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = freezed,Object? customCompleteText = null,Object? description = null,Object? image = null,Object? likeCount = null,Object? msgCount = null,Object? postId = null,Object? title = null,Object? uid = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,customCompleteText: null == customCompleteText ? _self.customCompleteText : customCompleteText // ignore: cast_nullable_to_non_nullable
as CustomCompleteText,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as DetectedText,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ModeratedImage,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,msgCount: null == msgCount ? _self.msgCount : msgCount // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as DetectedText,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomCompleteTextCopyWith<$Res> get customCompleteText {
  
  return $CustomCompleteTextCopyWith<$Res>(_self.customCompleteText, (value) {
    return _then(_self.copyWith(customCompleteText: value));
  });
}/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get description {
  
  return $DetectedTextCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModeratedImageCopyWith<$Res> get image {
  
  return $ModeratedImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get title {
  
  return $DetectedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _PostEntity extends PostEntity {
  const _PostEntity({@TimestampConverter() this.createdAt, required this.customCompleteText, required this.description, required this.image, required this.likeCount, required this.msgCount, required this.postId, required this.title, required this.uid, @TimestampConverter() this.updatedAt}): super._();
  factory _PostEntity.fromJson(Map<String, dynamic> json) => _$PostEntityFromJson(json);

@override@TimestampConverter() final  DateTime? createdAt;
@override final  CustomCompleteText customCompleteText;
@override final  DetectedText description;
@override final  ModeratedImage image;
@override final  int likeCount;
@override final  int msgCount;
@override final  String postId;
@override final  DetectedText title;
@override final  String uid;
@override@TimestampConverter() final  DateTime? updatedAt;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostEntityCopyWith<_PostEntity> get copyWith => __$PostEntityCopyWithImpl<_PostEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostEntity&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.customCompleteText, customCompleteText) || other.customCompleteText == customCompleteText)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.msgCount, msgCount) || other.msgCount == msgCount)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.title, title) || other.title == title)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,createdAt,customCompleteText,description,image,likeCount,msgCount,postId,title,uid,updatedAt);

@override
String toString() {
  return 'PostEntity(createdAt: $createdAt, customCompleteText: $customCompleteText, description: $description, image: $image, likeCount: $likeCount, msgCount: $msgCount, postId: $postId, title: $title, uid: $uid, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PostEntityCopyWith<$Res> implements $PostEntityCopyWith<$Res> {
  factory _$PostEntityCopyWith(_PostEntity value, $Res Function(_PostEntity) _then) = __$PostEntityCopyWithImpl;
@override @useResult
$Res call({
@TimestampConverter() DateTime? createdAt, CustomCompleteText customCompleteText, DetectedText description, ModeratedImage image, int likeCount, int msgCount, String postId, DetectedText title, String uid,@TimestampConverter() DateTime? updatedAt
});


@override $CustomCompleteTextCopyWith<$Res> get customCompleteText;@override $DetectedTextCopyWith<$Res> get description;@override $ModeratedImageCopyWith<$Res> get image;@override $DetectedTextCopyWith<$Res> get title;

}
/// @nodoc
class __$PostEntityCopyWithImpl<$Res>
    implements _$PostEntityCopyWith<$Res> {
  __$PostEntityCopyWithImpl(this._self, this._then);

  final _PostEntity _self;
  final $Res Function(_PostEntity) _then;

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? customCompleteText = null,Object? description = null,Object? image = null,Object? likeCount = null,Object? msgCount = null,Object? postId = null,Object? title = null,Object? uid = null,Object? updatedAt = freezed,}) {
  return _then(_PostEntity(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,customCompleteText: null == customCompleteText ? _self.customCompleteText : customCompleteText // ignore: cast_nullable_to_non_nullable
as CustomCompleteText,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as DetectedText,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ModeratedImage,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,msgCount: null == msgCount ? _self.msgCount : msgCount // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as DetectedText,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomCompleteTextCopyWith<$Res> get customCompleteText {
  
  return $CustomCompleteTextCopyWith<$Res>(_self.customCompleteText, (value) {
    return _then(_self.copyWith(customCompleteText: value));
  });
}/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get description {
  
  return $DetectedTextCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModeratedImageCopyWith<$Res> get image {
  
  return $ModeratedImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get title {
  
  return $DetectedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}
}

// dart format on
