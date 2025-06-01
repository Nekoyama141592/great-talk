// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_update_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserUpdateLog {

 dynamic get logCreatedAt; Map<String,dynamic> get searchToken; String get stringBio; String get stringUserName; String get uid; Map<String,dynamic> get image; dynamic get userRef;
/// Create a copy of UserUpdateLog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserUpdateLogCopyWith<UserUpdateLog> get copyWith => _$UserUpdateLogCopyWithImpl<UserUpdateLog>(this as UserUpdateLog, _$identity);

  /// Serializes this UserUpdateLog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserUpdateLog&&const DeepCollectionEquality().equals(other.logCreatedAt, logCreatedAt)&&const DeepCollectionEquality().equals(other.searchToken, searchToken)&&(identical(other.stringBio, stringBio) || other.stringBio == stringBio)&&(identical(other.stringUserName, stringUserName) || other.stringUserName == stringUserName)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.image, image)&&const DeepCollectionEquality().equals(other.userRef, userRef));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logCreatedAt),const DeepCollectionEquality().hash(searchToken),stringBio,stringUserName,uid,const DeepCollectionEquality().hash(image),const DeepCollectionEquality().hash(userRef));

@override
String toString() {
  return 'UserUpdateLog(logCreatedAt: $logCreatedAt, searchToken: $searchToken, stringBio: $stringBio, stringUserName: $stringUserName, uid: $uid, image: $image, userRef: $userRef)';
}


}

/// @nodoc
abstract mixin class $UserUpdateLogCopyWith<$Res>  {
  factory $UserUpdateLogCopyWith(UserUpdateLog value, $Res Function(UserUpdateLog) _then) = _$UserUpdateLogCopyWithImpl;
@useResult
$Res call({
 dynamic logCreatedAt, Map<String,dynamic> searchToken, String stringBio, String stringUserName, String uid, Map<String,dynamic> image, dynamic userRef
});




}
/// @nodoc
class _$UserUpdateLogCopyWithImpl<$Res>
    implements $UserUpdateLogCopyWith<$Res> {
  _$UserUpdateLogCopyWithImpl(this._self, this._then);

  final UserUpdateLog _self;
  final $Res Function(UserUpdateLog) _then;

/// Create a copy of UserUpdateLog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? logCreatedAt = freezed,Object? searchToken = null,Object? stringBio = null,Object? stringUserName = null,Object? uid = null,Object? image = null,Object? userRef = freezed,}) {
  return _then(_self.copyWith(
logCreatedAt: freezed == logCreatedAt ? _self.logCreatedAt : logCreatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,searchToken: null == searchToken ? _self.searchToken : searchToken // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,stringBio: null == stringBio ? _self.stringBio : stringBio // ignore: cast_nullable_to_non_nullable
as String,stringUserName: null == stringUserName ? _self.stringUserName : stringUserName // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,userRef: freezed == userRef ? _self.userRef : userRef // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserUpdateLog implements UserUpdateLog {
  const _UserUpdateLog({required this.logCreatedAt, required final  Map<String,dynamic> searchToken, required this.stringBio, required this.stringUserName, required this.uid, required final  Map<String,dynamic> image, required this.userRef}): _searchToken = searchToken,_image = image;
  factory _UserUpdateLog.fromJson(Map<String, dynamic> json) => _$UserUpdateLogFromJson(json);

@override final  dynamic logCreatedAt;
 final  Map<String,dynamic> _searchToken;
@override Map<String,dynamic> get searchToken {
  if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_searchToken);
}

@override final  String stringBio;
@override final  String stringUserName;
@override final  String uid;
 final  Map<String,dynamic> _image;
@override Map<String,dynamic> get image {
  if (_image is EqualUnmodifiableMapView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_image);
}

@override final  dynamic userRef;

/// Create a copy of UserUpdateLog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserUpdateLogCopyWith<_UserUpdateLog> get copyWith => __$UserUpdateLogCopyWithImpl<_UserUpdateLog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserUpdateLogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserUpdateLog&&const DeepCollectionEquality().equals(other.logCreatedAt, logCreatedAt)&&const DeepCollectionEquality().equals(other._searchToken, _searchToken)&&(identical(other.stringBio, stringBio) || other.stringBio == stringBio)&&(identical(other.stringUserName, stringUserName) || other.stringUserName == stringUserName)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other._image, _image)&&const DeepCollectionEquality().equals(other.userRef, userRef));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(logCreatedAt),const DeepCollectionEquality().hash(_searchToken),stringBio,stringUserName,uid,const DeepCollectionEquality().hash(_image),const DeepCollectionEquality().hash(userRef));

@override
String toString() {
  return 'UserUpdateLog(logCreatedAt: $logCreatedAt, searchToken: $searchToken, stringBio: $stringBio, stringUserName: $stringUserName, uid: $uid, image: $image, userRef: $userRef)';
}


}

/// @nodoc
abstract mixin class _$UserUpdateLogCopyWith<$Res> implements $UserUpdateLogCopyWith<$Res> {
  factory _$UserUpdateLogCopyWith(_UserUpdateLog value, $Res Function(_UserUpdateLog) _then) = __$UserUpdateLogCopyWithImpl;
@override @useResult
$Res call({
 dynamic logCreatedAt, Map<String,dynamic> searchToken, String stringBio, String stringUserName, String uid, Map<String,dynamic> image, dynamic userRef
});




}
/// @nodoc
class __$UserUpdateLogCopyWithImpl<$Res>
    implements _$UserUpdateLogCopyWith<$Res> {
  __$UserUpdateLogCopyWithImpl(this._self, this._then);

  final _UserUpdateLog _self;
  final $Res Function(_UserUpdateLog) _then;

/// Create a copy of UserUpdateLog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? logCreatedAt = freezed,Object? searchToken = null,Object? stringBio = null,Object? stringUserName = null,Object? uid = null,Object? image = null,Object? userRef = freezed,}) {
  return _then(_UserUpdateLog(
logCreatedAt: freezed == logCreatedAt ? _self.logCreatedAt : logCreatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,searchToken: null == searchToken ? _self._searchToken : searchToken // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,stringBio: null == stringBio ? _self.stringBio : stringBio // ignore: cast_nullable_to_non_nullable
as String,stringUserName: null == stringUserName ? _self.stringUserName : stringUserName // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,userRef: freezed == userRef ? _self.userRef : userRef // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
