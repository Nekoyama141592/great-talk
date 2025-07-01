// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublicUserEntity {

 DetectedText get bio;@TimestampConverter() DateTime? get createdAt; int get followerCount; int get followingCount; bool get isOfficial; int get postCount; String get uid;@TimestampConverter() DateTime? get updatedAt; DetectedImage get image; DetectedText get userName;
/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicUserEntityCopyWith<PublicUserEntity> get copyWith => _$PublicUserEntityCopyWithImpl<PublicUserEntity>(this as PublicUserEntity, _$identity);

  /// Serializes this PublicUserEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicUserEntity&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.image, image) || other.image == image)&&(identical(other.userName, userName) || other.userName == userName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bio,createdAt,followerCount,followingCount,isOfficial,postCount,uid,updatedAt,image,userName);

@override
String toString() {
  return 'PublicUserEntity(bio: $bio, createdAt: $createdAt, followerCount: $followerCount, followingCount: $followingCount, isOfficial: $isOfficial, postCount: $postCount, uid: $uid, updatedAt: $updatedAt, image: $image, userName: $userName)';
}


}

/// @nodoc
abstract mixin class $PublicUserEntityCopyWith<$Res>  {
  factory $PublicUserEntityCopyWith(PublicUserEntity value, $Res Function(PublicUserEntity) _then) = _$PublicUserEntityCopyWithImpl;
@useResult
$Res call({
 DetectedText bio,@TimestampConverter() DateTime? createdAt, int followerCount, int followingCount, bool isOfficial, int postCount, String uid,@TimestampConverter() DateTime? updatedAt, DetectedImage image, DetectedText userName
});


$DetectedTextCopyWith<$Res> get bio;$DetectedImageCopyWith<$Res> get image;$DetectedTextCopyWith<$Res> get userName;

}
/// @nodoc
class _$PublicUserEntityCopyWithImpl<$Res>
    implements $PublicUserEntityCopyWith<$Res> {
  _$PublicUserEntityCopyWithImpl(this._self, this._then);

  final PublicUserEntity _self;
  final $Res Function(PublicUserEntity) _then;

/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bio = null,Object? createdAt = freezed,Object? followerCount = null,Object? followingCount = null,Object? isOfficial = null,Object? postCount = null,Object? uid = null,Object? updatedAt = freezed,Object? image = null,Object? userName = null,}) {
  return _then(_self.copyWith(
bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as DetectedText,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as DetectedImage,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as DetectedText,
  ));
}
/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get bio {
  
  return $DetectedTextCopyWith<$Res>(_self.bio, (value) {
    return _then(_self.copyWith(bio: value));
  });
}/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedImageCopyWith<$Res> get image {
  
  return $DetectedImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get userName {
  
  return $DetectedTextCopyWith<$Res>(_self.userName, (value) {
    return _then(_self.copyWith(userName: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _PublicUserEntity extends PublicUserEntity {
   _PublicUserEntity({required this.bio, @TimestampConverter() this.createdAt, required this.followerCount, required this.followingCount, required this.isOfficial, required this.postCount, required this.uid, @TimestampConverter() this.updatedAt, required this.image, required this.userName}): super._();
  factory _PublicUserEntity.fromJson(Map<String, dynamic> json) => _$PublicUserEntityFromJson(json);

@override final  DetectedText bio;
@override@TimestampConverter() final  DateTime? createdAt;
@override final  int followerCount;
@override final  int followingCount;
@override final  bool isOfficial;
@override final  int postCount;
@override final  String uid;
@override@TimestampConverter() final  DateTime? updatedAt;
@override final  DetectedImage image;
@override final  DetectedText userName;

/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicUserEntityCopyWith<_PublicUserEntity> get copyWith => __$PublicUserEntityCopyWithImpl<_PublicUserEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicUserEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicUserEntity&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.image, image) || other.image == image)&&(identical(other.userName, userName) || other.userName == userName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bio,createdAt,followerCount,followingCount,isOfficial,postCount,uid,updatedAt,image,userName);

@override
String toString() {
  return 'PublicUserEntity(bio: $bio, createdAt: $createdAt, followerCount: $followerCount, followingCount: $followingCount, isOfficial: $isOfficial, postCount: $postCount, uid: $uid, updatedAt: $updatedAt, image: $image, userName: $userName)';
}


}

/// @nodoc
abstract mixin class _$PublicUserEntityCopyWith<$Res> implements $PublicUserEntityCopyWith<$Res> {
  factory _$PublicUserEntityCopyWith(_PublicUserEntity value, $Res Function(_PublicUserEntity) _then) = __$PublicUserEntityCopyWithImpl;
@override @useResult
$Res call({
 DetectedText bio,@TimestampConverter() DateTime? createdAt, int followerCount, int followingCount, bool isOfficial, int postCount, String uid,@TimestampConverter() DateTime? updatedAt, DetectedImage image, DetectedText userName
});


@override $DetectedTextCopyWith<$Res> get bio;@override $DetectedImageCopyWith<$Res> get image;@override $DetectedTextCopyWith<$Res> get userName;

}
/// @nodoc
class __$PublicUserEntityCopyWithImpl<$Res>
    implements _$PublicUserEntityCopyWith<$Res> {
  __$PublicUserEntityCopyWithImpl(this._self, this._then);

  final _PublicUserEntity _self;
  final $Res Function(_PublicUserEntity) _then;

/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bio = null,Object? createdAt = freezed,Object? followerCount = null,Object? followingCount = null,Object? isOfficial = null,Object? postCount = null,Object? uid = null,Object? updatedAt = freezed,Object? image = null,Object? userName = null,}) {
  return _then(_PublicUserEntity(
bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as DetectedText,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as DetectedImage,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as DetectedText,
  ));
}

/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get bio {
  
  return $DetectedTextCopyWith<$Res>(_self.bio, (value) {
    return _then(_self.copyWith(bio: value));
  });
}/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedImageCopyWith<$Res> get image {
  
  return $DetectedImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get userName {
  
  return $DetectedTextCopyWith<$Res>(_self.userName, (value) {
    return _then(_self.copyWith(userName: value));
  });
}
}

// dart format on
