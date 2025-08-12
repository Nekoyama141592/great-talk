// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostModel {

 dynamic get createdAt;@CustomCompleteTextConverter() CustomCompleteText get customCompleteText;@DetectedTextConverter() DetectedText get description;@ModeratedImageConverter() ModeratedImage get image; int get likeCount; int get msgCount; String get postId;@DetectedTextConverter() DetectedText get title; String get uid; dynamic get updatedAt;
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostModelCopyWith<PostModel> get copyWith => _$PostModelCopyWithImpl<PostModel>(this as PostModel, _$identity);

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostModel&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.customCompleteText, customCompleteText) || other.customCompleteText == customCompleteText)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.msgCount, msgCount) || other.msgCount == msgCount)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.title, title) || other.title == title)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),customCompleteText,description,image,likeCount,msgCount,postId,title,uid,const DeepCollectionEquality().hash(updatedAt));

@override
String toString() {
  return 'PostModel(createdAt: $createdAt, customCompleteText: $customCompleteText, description: $description, image: $image, likeCount: $likeCount, msgCount: $msgCount, postId: $postId, title: $title, uid: $uid, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PostModelCopyWith<$Res>  {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) _then) = _$PostModelCopyWithImpl;
@useResult
$Res call({
 dynamic createdAt,@CustomCompleteTextConverter() CustomCompleteText customCompleteText,@DetectedTextConverter() DetectedText description,@ModeratedImageConverter() ModeratedImage image, int likeCount, int msgCount, String postId,@DetectedTextConverter() DetectedText title, String uid, dynamic updatedAt
});


$CustomCompleteTextCopyWith<$Res> get customCompleteText;$DetectedTextCopyWith<$Res> get description;$ModeratedImageCopyWith<$Res> get image;$DetectedTextCopyWith<$Res> get title;

}
/// @nodoc
class _$PostModelCopyWithImpl<$Res>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._self, this._then);

  final PostModel _self;
  final $Res Function(PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdAt = freezed,Object? customCompleteText = null,Object? description = null,Object? image = null,Object? likeCount = null,Object? msgCount = null,Object? postId = null,Object? title = null,Object? uid = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,customCompleteText: null == customCompleteText ? _self.customCompleteText : customCompleteText // ignore: cast_nullable_to_non_nullable
as CustomCompleteText,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as DetectedText,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ModeratedImage,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,msgCount: null == msgCount ? _self.msgCount : msgCount // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as DetectedText,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomCompleteTextCopyWith<$Res> get customCompleteText {
  
  return $CustomCompleteTextCopyWith<$Res>(_self.customCompleteText, (value) {
    return _then(_self.copyWith(customCompleteText: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get description {
  
  return $DetectedTextCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModeratedImageCopyWith<$Res> get image {
  
  return $ModeratedImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of PostModel
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

class _PostModel extends PostModel {
  const _PostModel({required this.createdAt, @CustomCompleteTextConverter() required this.customCompleteText, @DetectedTextConverter() required this.description, @ModeratedImageConverter() required this.image, this.likeCount = 0, this.msgCount = 0, required this.postId, @DetectedTextConverter() required this.title, required this.uid, required this.updatedAt}): super._();
  factory _PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

@override final  dynamic createdAt;
@override@CustomCompleteTextConverter() final  CustomCompleteText customCompleteText;
@override@DetectedTextConverter() final  DetectedText description;
@override@ModeratedImageConverter() final  ModeratedImage image;
@override@JsonKey() final  int likeCount;
@override@JsonKey() final  int msgCount;
@override final  String postId;
@override@DetectedTextConverter() final  DetectedText title;
@override final  String uid;
@override final  dynamic updatedAt;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostModelCopyWith<_PostModel> get copyWith => __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostModel&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.customCompleteText, customCompleteText) || other.customCompleteText == customCompleteText)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.msgCount, msgCount) || other.msgCount == msgCount)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.title, title) || other.title == title)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),customCompleteText,description,image,likeCount,msgCount,postId,title,uid,const DeepCollectionEquality().hash(updatedAt));

@override
String toString() {
  return 'PostModel(createdAt: $createdAt, customCompleteText: $customCompleteText, description: $description, image: $image, likeCount: $likeCount, msgCount: $msgCount, postId: $postId, title: $title, uid: $uid, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(_PostModel value, $Res Function(_PostModel) _then) = __$PostModelCopyWithImpl;
@override @useResult
$Res call({
 dynamic createdAt,@CustomCompleteTextConverter() CustomCompleteText customCompleteText,@DetectedTextConverter() DetectedText description,@ModeratedImageConverter() ModeratedImage image, int likeCount, int msgCount, String postId,@DetectedTextConverter() DetectedText title, String uid, dynamic updatedAt
});


@override $CustomCompleteTextCopyWith<$Res> get customCompleteText;@override $DetectedTextCopyWith<$Res> get description;@override $ModeratedImageCopyWith<$Res> get image;@override $DetectedTextCopyWith<$Res> get title;

}
/// @nodoc
class __$PostModelCopyWithImpl<$Res>
    implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(this._self, this._then);

  final _PostModel _self;
  final $Res Function(_PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createdAt = freezed,Object? customCompleteText = null,Object? description = null,Object? image = null,Object? likeCount = null,Object? msgCount = null,Object? postId = null,Object? title = null,Object? uid = null,Object? updatedAt = freezed,}) {
  return _then(_PostModel(
createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,customCompleteText: null == customCompleteText ? _self.customCompleteText : customCompleteText // ignore: cast_nullable_to_non_nullable
as CustomCompleteText,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as DetectedText,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ModeratedImage,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,msgCount: null == msgCount ? _self.msgCount : msgCount // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as DetectedText,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomCompleteTextCopyWith<$Res> get customCompleteText {
  
  return $CustomCompleteTextCopyWith<$Res>(_self.customCompleteText, (value) {
    return _then(_self.copyWith(customCompleteText: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get description {
  
  return $DetectedTextCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModeratedImageCopyWith<$Res> get image {
  
  return $ModeratedImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of PostModel
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
