// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'private_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrivateUserModel {

 String? get accessToken; dynamic get createdAt; String get ethAddress; String? get fcmToken; String get gender; String get ipAddress; bool get isAdmin; String get uid; dynamic get updatedAt;
/// Create a copy of PrivateUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivateUserModelCopyWith<PrivateUserModel> get copyWith => _$PrivateUserModelCopyWithImpl<PrivateUserModel>(this as PrivateUserModel, _$identity);

  /// Serializes this PrivateUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivateUserModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.ethAddress, ethAddress) || other.ethAddress == ethAddress)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,const DeepCollectionEquality().hash(createdAt),ethAddress,fcmToken,gender,ipAddress,isAdmin,uid,const DeepCollectionEquality().hash(updatedAt));

@override
String toString() {
  return 'PrivateUserModel(accessToken: $accessToken, createdAt: $createdAt, ethAddress: $ethAddress, fcmToken: $fcmToken, gender: $gender, ipAddress: $ipAddress, isAdmin: $isAdmin, uid: $uid, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PrivateUserModelCopyWith<$Res>  {
  factory $PrivateUserModelCopyWith(PrivateUserModel value, $Res Function(PrivateUserModel) _then) = _$PrivateUserModelCopyWithImpl;
@useResult
$Res call({
 String? accessToken, dynamic createdAt, String ethAddress, String? fcmToken, String gender, String ipAddress, bool isAdmin, String uid, dynamic updatedAt
});




}
/// @nodoc
class _$PrivateUserModelCopyWithImpl<$Res>
    implements $PrivateUserModelCopyWith<$Res> {
  _$PrivateUserModelCopyWithImpl(this._self, this._then);

  final PrivateUserModel _self;
  final $Res Function(PrivateUserModel) _then;

/// Create a copy of PrivateUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = freezed,Object? createdAt = freezed,Object? ethAddress = null,Object? fcmToken = freezed,Object? gender = null,Object? ipAddress = null,Object? isAdmin = null,Object? uid = null,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,ethAddress: null == ethAddress ? _self.ethAddress : ethAddress // ignore: cast_nullable_to_non_nullable
as String,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PrivateUserModel extends PrivateUserModel {
  const _PrivateUserModel({this.accessToken = "", required this.createdAt, this.ethAddress = "", this.fcmToken = "", this.gender = "", this.ipAddress = "", this.isAdmin = false, required this.uid, required this.updatedAt}): super._();
  factory _PrivateUserModel.fromJson(Map<String, dynamic> json) => _$PrivateUserModelFromJson(json);

@override@JsonKey() final  String? accessToken;
@override final  dynamic createdAt;
@override@JsonKey() final  String ethAddress;
@override@JsonKey() final  String? fcmToken;
@override@JsonKey() final  String gender;
@override@JsonKey() final  String ipAddress;
@override@JsonKey() final  bool isAdmin;
@override final  String uid;
@override final  dynamic updatedAt;

/// Create a copy of PrivateUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivateUserModelCopyWith<_PrivateUserModel> get copyWith => __$PrivateUserModelCopyWithImpl<_PrivateUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivateUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivateUserModel&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.ethAddress, ethAddress) || other.ethAddress == ethAddress)&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,const DeepCollectionEquality().hash(createdAt),ethAddress,fcmToken,gender,ipAddress,isAdmin,uid,const DeepCollectionEquality().hash(updatedAt));

@override
String toString() {
  return 'PrivateUserModel(accessToken: $accessToken, createdAt: $createdAt, ethAddress: $ethAddress, fcmToken: $fcmToken, gender: $gender, ipAddress: $ipAddress, isAdmin: $isAdmin, uid: $uid, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PrivateUserModelCopyWith<$Res> implements $PrivateUserModelCopyWith<$Res> {
  factory _$PrivateUserModelCopyWith(_PrivateUserModel value, $Res Function(_PrivateUserModel) _then) = __$PrivateUserModelCopyWithImpl;
@override @useResult
$Res call({
 String? accessToken, dynamic createdAt, String ethAddress, String? fcmToken, String gender, String ipAddress, bool isAdmin, String uid, dynamic updatedAt
});




}
/// @nodoc
class __$PrivateUserModelCopyWithImpl<$Res>
    implements _$PrivateUserModelCopyWith<$Res> {
  __$PrivateUserModelCopyWithImpl(this._self, this._then);

  final _PrivateUserModel _self;
  final $Res Function(_PrivateUserModel) _then;

/// Create a copy of PrivateUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = freezed,Object? createdAt = freezed,Object? ethAddress = null,Object? fcmToken = freezed,Object? gender = null,Object? ipAddress = null,Object? isAdmin = null,Object? uid = null,Object? updatedAt = freezed,}) {
  return _then(_PrivateUserModel(
accessToken: freezed == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,ethAddress: null == ethAddress ? _self.ethAddress : ethAddress // ignore: cast_nullable_to_non_nullable
as String,fcmToken: freezed == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String?,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
