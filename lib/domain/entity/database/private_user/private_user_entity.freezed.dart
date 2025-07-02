// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'private_user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrivateUserEntity {

 bool get isAdmin;
/// Create a copy of PrivateUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivateUserEntityCopyWith<PrivateUserEntity> get copyWith => _$PrivateUserEntityCopyWithImpl<PrivateUserEntity>(this as PrivateUserEntity, _$identity);

  /// Serializes this PrivateUserEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivateUserEntity&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAdmin);

@override
String toString() {
  return 'PrivateUserEntity(isAdmin: $isAdmin)';
}


}

/// @nodoc
abstract mixin class $PrivateUserEntityCopyWith<$Res>  {
  factory $PrivateUserEntityCopyWith(PrivateUserEntity value, $Res Function(PrivateUserEntity) _then) = _$PrivateUserEntityCopyWithImpl;
@useResult
$Res call({
 bool isAdmin
});




}
/// @nodoc
class _$PrivateUserEntityCopyWithImpl<$Res>
    implements $PrivateUserEntityCopyWith<$Res> {
  _$PrivateUserEntityCopyWithImpl(this._self, this._then);

  final PrivateUserEntity _self;
  final $Res Function(PrivateUserEntity) _then;

/// Create a copy of PrivateUserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAdmin = null,}) {
  return _then(_self.copyWith(
isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PrivateUserEntity extends PrivateUserEntity {
  const _PrivateUserEntity({this.isAdmin = false}): super._();
  factory _PrivateUserEntity.fromJson(Map<String, dynamic> json) => _$PrivateUserEntityFromJson(json);

@override@JsonKey() final  bool isAdmin;

/// Create a copy of PrivateUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivateUserEntityCopyWith<_PrivateUserEntity> get copyWith => __$PrivateUserEntityCopyWithImpl<_PrivateUserEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivateUserEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivateUserEntity&&(identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isAdmin);

@override
String toString() {
  return 'PrivateUserEntity(isAdmin: $isAdmin)';
}


}

/// @nodoc
abstract mixin class _$PrivateUserEntityCopyWith<$Res> implements $PrivateUserEntityCopyWith<$Res> {
  factory _$PrivateUserEntityCopyWith(_PrivateUserEntity value, $Res Function(_PrivateUserEntity) _then) = __$PrivateUserEntityCopyWithImpl;
@override @useResult
$Res call({
 bool isAdmin
});




}
/// @nodoc
class __$PrivateUserEntityCopyWithImpl<$Res>
    implements _$PrivateUserEntityCopyWith<$Res> {
  __$PrivateUserEntityCopyWithImpl(this._self, this._then);

  final _PrivateUserEntity _self;
  final $Res Function(_PrivateUserEntity) _then;

/// Create a copy of PrivateUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAdmin = null,}) {
  return _then(_PrivateUserEntity(
isAdmin: null == isAdmin ? _self.isAdmin : isAdmin // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
