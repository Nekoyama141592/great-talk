// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follower.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Follower {

// required dynamic activeUserRef, // TODO: 対応
 String get activeUid;// TODO: 新規追加対応
 dynamic get createdAt; String get passiveUid;
/// Create a copy of Follower
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowerCopyWith<Follower> get copyWith => _$FollowerCopyWithImpl<Follower>(this as Follower, _$identity);

  /// Serializes this Follower to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Follower&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid);

@override
String toString() {
  return 'Follower(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid)';
}


}

/// @nodoc
abstract mixin class $FollowerCopyWith<$Res>  {
  factory $FollowerCopyWith(Follower value, $Res Function(Follower) _then) = _$FollowerCopyWithImpl;
@useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid
});




}
/// @nodoc
class _$FollowerCopyWithImpl<$Res>
    implements $FollowerCopyWith<$Res> {
  _$FollowerCopyWithImpl(this._self, this._then);

  final Follower _self;
  final $Res Function(Follower) _then;

/// Create a copy of Follower
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,}) {
  return _then(_self.copyWith(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Follower extends Follower {
  const _Follower({required this.activeUid, required this.createdAt, required this.passiveUid}): super._();
  factory _Follower.fromJson(Map<String, dynamic> json) => _$FollowerFromJson(json);

// required dynamic activeUserRef, // TODO: 対応
@override final  String activeUid;
// TODO: 新規追加対応
@override final  dynamic createdAt;
@override final  String passiveUid;

/// Create a copy of Follower
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowerCopyWith<_Follower> get copyWith => __$FollowerCopyWithImpl<_Follower>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Follower&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid);

@override
String toString() {
  return 'Follower(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid)';
}


}

/// @nodoc
abstract mixin class _$FollowerCopyWith<$Res> implements $FollowerCopyWith<$Res> {
  factory _$FollowerCopyWith(_Follower value, $Res Function(_Follower) _then) = __$FollowerCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid
});




}
/// @nodoc
class __$FollowerCopyWithImpl<$Res>
    implements _$FollowerCopyWith<$Res> {
  __$FollowerCopyWithImpl(this._self, this._then);

  final _Follower _self;
  final $Res Function(_Follower) _then;

/// Create a copy of Follower
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,}) {
  return _then(_Follower(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
