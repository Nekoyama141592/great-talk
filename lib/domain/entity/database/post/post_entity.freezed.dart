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

 dynamic get createdAt; Map<String, dynamic> get customCompleteText; Map<String, dynamic> get description; Map<String, dynamic> get image; int get likeCount; int get msgCount; String get postId; Map<String, dynamic> get title; String get uid; dynamic get updatedAt;
/// Create a copy of PostEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostEntityCopyWith<PostEntity> get copyWith => _$PostEntityCopyWithImpl<PostEntity>(this as PostEntity, _$identity);

  /// Serializes this PostEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostEntity&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&const DeepCollectionEquality().equals(other.customCompleteText, customCompleteText)&&const DeepCollectionEquality().equals(other.description, description)&&const DeepCollectionEquality().equals(other.image, image)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.msgCount, msgCount) || other.msgCount == msgCount)&&(identical(other.postId, postId) || other.postId == postId)&&const DeepCollectionEquality().equals(other.title, title)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),const DeepCollectionEquality().hash(customCompleteText),const DeepCollectionEquality().hash(description),const DeepCollectionEquality().hash(image),likeCount,msgCount,postId,const DeepCollectionEquality().hash(title),uid,const DeepCollectionEquality().hash(updatedAt));

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
 dynamic createdAt, Map<String, dynamic> customCompleteText, Map<String, dynamic> description, Map<String, dynamic> image, int likeCount, int msgCount, String postId, Map<String, dynamic> title, String uid, dynamic updatedAt
});




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
as dynamic,customCompleteText: null == customCompleteText ? _self.customCompleteText : customCompleteText // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,msgCount: null == msgCount ? _self.msgCount : msgCount // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PostEntity extends PostEntity {
  const _PostEntity({required this.createdAt, required final  Map<String, dynamic> customCompleteText, required final  Map<String, dynamic> description, required final  Map<String, dynamic> image, required this.likeCount, required this.msgCount, required this.postId, required final  Map<String, dynamic> title, required this.uid, required this.updatedAt}): _customCompleteText = customCompleteText,_description = description,_image = image,_title = title,super._();
  factory _PostEntity.fromJson(Map<String, dynamic> json) => _$PostEntityFromJson(json);

@override final  dynamic createdAt;
 final  Map<String, dynamic> _customCompleteText;
@override Map<String, dynamic> get customCompleteText {
  if (_customCompleteText is EqualUnmodifiableMapView) return _customCompleteText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_customCompleteText);
}

 final  Map<String, dynamic> _description;
@override Map<String, dynamic> get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

 final  Map<String, dynamic> _image;
@override Map<String, dynamic> get image {
  if (_image is EqualUnmodifiableMapView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_image);
}

@override final  int likeCount;
@override final  int msgCount;
@override final  String postId;
 final  Map<String, dynamic> _title;
@override Map<String, dynamic> get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

@override final  String uid;
@override final  dynamic updatedAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostEntity&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&const DeepCollectionEquality().equals(other._customCompleteText, _customCompleteText)&&const DeepCollectionEquality().equals(other._description, _description)&&const DeepCollectionEquality().equals(other._image, _image)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&(identical(other.msgCount, msgCount) || other.msgCount == msgCount)&&(identical(other.postId, postId) || other.postId == postId)&&const DeepCollectionEquality().equals(other._title, _title)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(createdAt),const DeepCollectionEquality().hash(_customCompleteText),const DeepCollectionEquality().hash(_description),const DeepCollectionEquality().hash(_image),likeCount,msgCount,postId,const DeepCollectionEquality().hash(_title),uid,const DeepCollectionEquality().hash(updatedAt));

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
 dynamic createdAt, Map<String, dynamic> customCompleteText, Map<String, dynamic> description, Map<String, dynamic> image, int likeCount, int msgCount, String postId, Map<String, dynamic> title, String uid, dynamic updatedAt
});




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
as dynamic,customCompleteText: null == customCompleteText ? _self._customCompleteText : customCompleteText // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,image: null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,msgCount: null == msgCount ? _self.msgCount : msgCount // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
