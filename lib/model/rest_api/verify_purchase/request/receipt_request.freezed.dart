// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceiptRequest {

 Map<String, dynamic> get purchaseDetails;
/// Create a copy of ReceiptRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiptRequestCopyWith<ReceiptRequest> get copyWith => _$ReceiptRequestCopyWithImpl<ReceiptRequest>(this as ReceiptRequest, _$identity);

  /// Serializes this ReceiptRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiptRequest&&const DeepCollectionEquality().equals(other.purchaseDetails, purchaseDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(purchaseDetails));

@override
String toString() {
  return 'ReceiptRequest(purchaseDetails: $purchaseDetails)';
}


}

/// @nodoc
abstract mixin class $ReceiptRequestCopyWith<$Res>  {
  factory $ReceiptRequestCopyWith(ReceiptRequest value, $Res Function(ReceiptRequest) _then) = _$ReceiptRequestCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> purchaseDetails
});




}
/// @nodoc
class _$ReceiptRequestCopyWithImpl<$Res>
    implements $ReceiptRequestCopyWith<$Res> {
  _$ReceiptRequestCopyWithImpl(this._self, this._then);

  final ReceiptRequest _self;
  final $Res Function(ReceiptRequest) _then;

/// Create a copy of ReceiptRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? purchaseDetails = null,}) {
  return _then(_self.copyWith(
purchaseDetails: null == purchaseDetails ? _self.purchaseDetails : purchaseDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReceiptRequest extends ReceiptRequest {
  const _ReceiptRequest({required final  Map<String, dynamic> purchaseDetails}): _purchaseDetails = purchaseDetails,super._();
  factory _ReceiptRequest.fromJson(Map<String, dynamic> json) => _$ReceiptRequestFromJson(json);

 final  Map<String, dynamic> _purchaseDetails;
@override Map<String, dynamic> get purchaseDetails {
  if (_purchaseDetails is EqualUnmodifiableMapView) return _purchaseDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_purchaseDetails);
}


/// Create a copy of ReceiptRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReceiptRequestCopyWith<_ReceiptRequest> get copyWith => __$ReceiptRequestCopyWithImpl<_ReceiptRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReceiptRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReceiptRequest&&const DeepCollectionEquality().equals(other._purchaseDetails, _purchaseDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_purchaseDetails));

@override
String toString() {
  return 'ReceiptRequest(purchaseDetails: $purchaseDetails)';
}


}

/// @nodoc
abstract mixin class _$ReceiptRequestCopyWith<$Res> implements $ReceiptRequestCopyWith<$Res> {
  factory _$ReceiptRequestCopyWith(_ReceiptRequest value, $Res Function(_ReceiptRequest) _then) = __$ReceiptRequestCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> purchaseDetails
});




}
/// @nodoc
class __$ReceiptRequestCopyWithImpl<$Res>
    implements _$ReceiptRequestCopyWith<$Res> {
  __$ReceiptRequestCopyWithImpl(this._self, this._then);

  final _ReceiptRequest _self;
  final $Res Function(_ReceiptRequest) _then;

/// Create a copy of ReceiptRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? purchaseDetails = null,}) {
  return _then(_ReceiptRequest(
purchaseDetails: null == purchaseDetails ? _self._purchaseDetails : purchaseDetails // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
