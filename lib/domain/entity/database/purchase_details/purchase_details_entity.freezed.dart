// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseDetailsEntity {

 String get productID; String get status;
/// Create a copy of PurchaseDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseDetailsEntityCopyWith<PurchaseDetailsEntity> get copyWith => _$PurchaseDetailsEntityCopyWithImpl<PurchaseDetailsEntity>(this as PurchaseDetailsEntity, _$identity);

  /// Serializes this PurchaseDetailsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseDetailsEntity&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,status);

@override
String toString() {
  return 'PurchaseDetailsEntity(productID: $productID, status: $status)';
}


}

/// @nodoc
abstract mixin class $PurchaseDetailsEntityCopyWith<$Res>  {
  factory $PurchaseDetailsEntityCopyWith(PurchaseDetailsEntity value, $Res Function(PurchaseDetailsEntity) _then) = _$PurchaseDetailsEntityCopyWithImpl;
@useResult
$Res call({
 String productID, String status
});




}
/// @nodoc
class _$PurchaseDetailsEntityCopyWithImpl<$Res>
    implements $PurchaseDetailsEntityCopyWith<$Res> {
  _$PurchaseDetailsEntityCopyWithImpl(this._self, this._then);

  final PurchaseDetailsEntity _self;
  final $Res Function(PurchaseDetailsEntity) _then;

/// Create a copy of PurchaseDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productID = null,Object? status = null,}) {
  return _then(_self.copyWith(
productID: null == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PurchaseDetailsEntity implements PurchaseDetailsEntity {
  const _PurchaseDetailsEntity({required this.productID, required this.status});
  factory _PurchaseDetailsEntity.fromJson(Map<String, dynamic> json) => _$PurchaseDetailsEntityFromJson(json);

@override final  String productID;
@override final  String status;

/// Create a copy of PurchaseDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseDetailsEntityCopyWith<_PurchaseDetailsEntity> get copyWith => __$PurchaseDetailsEntityCopyWithImpl<_PurchaseDetailsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurchaseDetailsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseDetailsEntity&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,status);

@override
String toString() {
  return 'PurchaseDetailsEntity(productID: $productID, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PurchaseDetailsEntityCopyWith<$Res> implements $PurchaseDetailsEntityCopyWith<$Res> {
  factory _$PurchaseDetailsEntityCopyWith(_PurchaseDetailsEntity value, $Res Function(_PurchaseDetailsEntity) _then) = __$PurchaseDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 String productID, String status
});




}
/// @nodoc
class __$PurchaseDetailsEntityCopyWithImpl<$Res>
    implements _$PurchaseDetailsEntityCopyWith<$Res> {
  __$PurchaseDetailsEntityCopyWithImpl(this._self, this._then);

  final _PurchaseDetailsEntity _self;
  final $Res Function(_PurchaseDetailsEntity) _then;

/// Create a copy of PurchaseDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productID = null,Object? status = null,}) {
  return _then(_PurchaseDetailsEntity(
productID: null == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
