// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_renewal_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PendingRenewalInfo {

 String get auto_renew_product_id; String get auto_renew_status; String get original_transaction_id; String get product_id;
/// Create a copy of PendingRenewalInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingRenewalInfoCopyWith<PendingRenewalInfo> get copyWith => _$PendingRenewalInfoCopyWithImpl<PendingRenewalInfo>(this as PendingRenewalInfo, _$identity);

  /// Serializes this PendingRenewalInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingRenewalInfo&&(identical(other.auto_renew_product_id, auto_renew_product_id) || other.auto_renew_product_id == auto_renew_product_id)&&(identical(other.auto_renew_status, auto_renew_status) || other.auto_renew_status == auto_renew_status)&&(identical(other.original_transaction_id, original_transaction_id) || other.original_transaction_id == original_transaction_id)&&(identical(other.product_id, product_id) || other.product_id == product_id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auto_renew_product_id,auto_renew_status,original_transaction_id,product_id);

@override
String toString() {
  return 'PendingRenewalInfo(auto_renew_product_id: $auto_renew_product_id, auto_renew_status: $auto_renew_status, original_transaction_id: $original_transaction_id, product_id: $product_id)';
}


}

/// @nodoc
abstract mixin class $PendingRenewalInfoCopyWith<$Res>  {
  factory $PendingRenewalInfoCopyWith(PendingRenewalInfo value, $Res Function(PendingRenewalInfo) _then) = _$PendingRenewalInfoCopyWithImpl;
@useResult
$Res call({
 String auto_renew_product_id, String auto_renew_status, String original_transaction_id, String product_id
});




}
/// @nodoc
class _$PendingRenewalInfoCopyWithImpl<$Res>
    implements $PendingRenewalInfoCopyWith<$Res> {
  _$PendingRenewalInfoCopyWithImpl(this._self, this._then);

  final PendingRenewalInfo _self;
  final $Res Function(PendingRenewalInfo) _then;

/// Create a copy of PendingRenewalInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? auto_renew_product_id = null,Object? auto_renew_status = null,Object? original_transaction_id = null,Object? product_id = null,}) {
  return _then(_self.copyWith(
auto_renew_product_id: null == auto_renew_product_id ? _self.auto_renew_product_id : auto_renew_product_id // ignore: cast_nullable_to_non_nullable
as String,auto_renew_status: null == auto_renew_status ? _self.auto_renew_status : auto_renew_status // ignore: cast_nullable_to_non_nullable
as String,original_transaction_id: null == original_transaction_id ? _self.original_transaction_id : original_transaction_id // ignore: cast_nullable_to_non_nullable
as String,product_id: null == product_id ? _self.product_id : product_id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PendingRenewalInfo extends PendingRenewalInfo {
  const _PendingRenewalInfo({required this.auto_renew_product_id, required this.auto_renew_status, required this.original_transaction_id, required this.product_id}): super._();
  factory _PendingRenewalInfo.fromJson(Map<String, dynamic> json) => _$PendingRenewalInfoFromJson(json);

@override final  String auto_renew_product_id;
@override final  String auto_renew_status;
@override final  String original_transaction_id;
@override final  String product_id;

/// Create a copy of PendingRenewalInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingRenewalInfoCopyWith<_PendingRenewalInfo> get copyWith => __$PendingRenewalInfoCopyWithImpl<_PendingRenewalInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingRenewalInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingRenewalInfo&&(identical(other.auto_renew_product_id, auto_renew_product_id) || other.auto_renew_product_id == auto_renew_product_id)&&(identical(other.auto_renew_status, auto_renew_status) || other.auto_renew_status == auto_renew_status)&&(identical(other.original_transaction_id, original_transaction_id) || other.original_transaction_id == original_transaction_id)&&(identical(other.product_id, product_id) || other.product_id == product_id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auto_renew_product_id,auto_renew_status,original_transaction_id,product_id);

@override
String toString() {
  return 'PendingRenewalInfo(auto_renew_product_id: $auto_renew_product_id, auto_renew_status: $auto_renew_status, original_transaction_id: $original_transaction_id, product_id: $product_id)';
}


}

/// @nodoc
abstract mixin class _$PendingRenewalInfoCopyWith<$Res> implements $PendingRenewalInfoCopyWith<$Res> {
  factory _$PendingRenewalInfoCopyWith(_PendingRenewalInfo value, $Res Function(_PendingRenewalInfo) _then) = __$PendingRenewalInfoCopyWithImpl;
@override @useResult
$Res call({
 String auto_renew_product_id, String auto_renew_status, String original_transaction_id, String product_id
});




}
/// @nodoc
class __$PendingRenewalInfoCopyWithImpl<$Res>
    implements _$PendingRenewalInfoCopyWith<$Res> {
  __$PendingRenewalInfoCopyWithImpl(this._self, this._then);

  final _PendingRenewalInfo _self;
  final $Res Function(_PendingRenewalInfo) _then;

/// Create a copy of PendingRenewalInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? auto_renew_product_id = null,Object? auto_renew_status = null,Object? original_transaction_id = null,Object? product_id = null,}) {
  return _then(_PendingRenewalInfo(
auto_renew_product_id: null == auto_renew_product_id ? _self.auto_renew_product_id : auto_renew_product_id // ignore: cast_nullable_to_non_nullable
as String,auto_renew_status: null == auto_renew_status ? _self.auto_renew_status : auto_renew_status // ignore: cast_nullable_to_non_nullable
as String,original_transaction_id: null == original_transaction_id ? _self.original_transaction_id : original_transaction_id // ignore: cast_nullable_to_non_nullable
as String,product_id: null == product_id ? _self.product_id : product_id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
