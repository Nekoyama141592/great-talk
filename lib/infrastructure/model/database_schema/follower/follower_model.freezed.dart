// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follower_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowerModel {

 String get activeUid; dynamic get createdAt; String get passiveUid;
/// Create a copy of FollowerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowerModelCopyWith<FollowerModel> get copyWith => _$FollowerModelCopyWithImpl<FollowerModel>(this as FollowerModel, _$identity);

  /// Serializes this FollowerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowerModel&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid);

@override
String toString() {
  return 'FollowerModel(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid)';
}


}

/// @nodoc
abstract mixin class $FollowerModelCopyWith<$Res>  {
  factory $FollowerModelCopyWith(FollowerModel value, $Res Function(FollowerModel) _then) = _$FollowerModelCopyWithImpl;
@useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid
});




}
/// @nodoc
class _$FollowerModelCopyWithImpl<$Res>
    implements $FollowerModelCopyWith<$Res> {
  _$FollowerModelCopyWithImpl(this._self, this._then);

  final FollowerModel _self;
  final $Res Function(FollowerModel) _then;

/// Create a copy of FollowerModel
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

class _FollowerModel extends FollowerModel {
  const _FollowerModel({required this.activeUid, required this.createdAt, required this.passiveUid}): super._();
  factory _FollowerModel.fromJson(Map<String, dynamic> json) => _$FollowerModelFromJson(json);

@override final  String activeUid;
@override final  dynamic createdAt;
@override final  String passiveUid;

/// Create a copy of FollowerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FollowerModelCopyWith<_FollowerModel> get copyWith => __$FollowerModelCopyWithImpl<_FollowerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FollowerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FollowerModel&&(identical(other.activeUid, activeUid) || other.activeUid == activeUid)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.passiveUid, passiveUid) || other.passiveUid == passiveUid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,activeUid,const DeepCollectionEquality().hash(createdAt),passiveUid);

@override
String toString() {
  return 'FollowerModel(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid)';
}


}

/// @nodoc
abstract mixin class _$FollowerModelCopyWith<$Res> implements $FollowerModelCopyWith<$Res> {
  factory _$FollowerModelCopyWith(_FollowerModel value, $Res Function(_FollowerModel) _then) = __$FollowerModelCopyWithImpl;
@override @useResult
$Res call({
 String activeUid, dynamic createdAt, String passiveUid
});




}
/// @nodoc
class __$FollowerModelCopyWithImpl<$Res>
    implements _$FollowerModelCopyWith<$Res> {
  __$FollowerModelCopyWithImpl(this._self, this._then);

  final _FollowerModel _self;
  final $Res Function(_FollowerModel) _then;

/// Create a copy of FollowerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeUid = null,Object? createdAt = freezed,Object? passiveUid = null,}) {
  return _then(_FollowerModel(
activeUid: null == activeUid ? _self.activeUid : activeUid // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,passiveUid: null == passiveUid ? _self.passiveUid : passiveUid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
