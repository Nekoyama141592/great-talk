// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_android_receipt_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyAndroidReceiptRequest {

 String get localVerificationData; String get productID;
/// Create a copy of VerifyAndroidReceiptRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyAndroidReceiptRequestCopyWith<VerifyAndroidReceiptRequest> get copyWith => _$VerifyAndroidReceiptRequestCopyWithImpl<VerifyAndroidReceiptRequest>(this as VerifyAndroidReceiptRequest, _$identity);

  /// Serializes this VerifyAndroidReceiptRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyAndroidReceiptRequest&&(identical(other.localVerificationData, localVerificationData) || other.localVerificationData == localVerificationData)&&(identical(other.productID, productID) || other.productID == productID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localVerificationData,productID);

@override
String toString() {
  return 'VerifyAndroidReceiptRequest(localVerificationData: $localVerificationData, productID: $productID)';
}


}

/// @nodoc
abstract mixin class $VerifyAndroidReceiptRequestCopyWith<$Res>  {
  factory $VerifyAndroidReceiptRequestCopyWith(VerifyAndroidReceiptRequest value, $Res Function(VerifyAndroidReceiptRequest) _then) = _$VerifyAndroidReceiptRequestCopyWithImpl;
@useResult
$Res call({
 String localVerificationData, String productID
});




}
/// @nodoc
class _$VerifyAndroidReceiptRequestCopyWithImpl<$Res>
    implements $VerifyAndroidReceiptRequestCopyWith<$Res> {
  _$VerifyAndroidReceiptRequestCopyWithImpl(this._self, this._then);

  final VerifyAndroidReceiptRequest _self;
  final $Res Function(VerifyAndroidReceiptRequest) _then;

/// Create a copy of VerifyAndroidReceiptRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localVerificationData = null,Object? productID = null,}) {
  return _then(_self.copyWith(
localVerificationData: null == localVerificationData ? _self.localVerificationData : localVerificationData // ignore: cast_nullable_to_non_nullable
as String,productID: null == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _VerifyAndroidReceiptRequest extends VerifyAndroidReceiptRequest {
  const _VerifyAndroidReceiptRequest({required this.localVerificationData, required this.productID}): super._();
  factory _VerifyAndroidReceiptRequest.fromJson(Map<String, dynamic> json) => _$VerifyAndroidReceiptRequestFromJson(json);

@override final  String localVerificationData;
@override final  String productID;

/// Create a copy of VerifyAndroidReceiptRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyAndroidReceiptRequestCopyWith<_VerifyAndroidReceiptRequest> get copyWith => __$VerifyAndroidReceiptRequestCopyWithImpl<_VerifyAndroidReceiptRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyAndroidReceiptRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyAndroidReceiptRequest&&(identical(other.localVerificationData, localVerificationData) || other.localVerificationData == localVerificationData)&&(identical(other.productID, productID) || other.productID == productID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localVerificationData,productID);

@override
String toString() {
  return 'VerifyAndroidReceiptRequest(localVerificationData: $localVerificationData, productID: $productID)';
}


}

/// @nodoc
abstract mixin class _$VerifyAndroidReceiptRequestCopyWith<$Res> implements $VerifyAndroidReceiptRequestCopyWith<$Res> {
  factory _$VerifyAndroidReceiptRequestCopyWith(_VerifyAndroidReceiptRequest value, $Res Function(_VerifyAndroidReceiptRequest) _then) = __$VerifyAndroidReceiptRequestCopyWithImpl;
@override @useResult
$Res call({
 String localVerificationData, String productID
});




}
/// @nodoc
class __$VerifyAndroidReceiptRequestCopyWithImpl<$Res>
    implements _$VerifyAndroidReceiptRequestCopyWith<$Res> {
  __$VerifyAndroidReceiptRequestCopyWithImpl(this._self, this._then);

  final _VerifyAndroidReceiptRequest _self;
  final $Res Function(_VerifyAndroidReceiptRequest) _then;

/// Create a copy of VerifyAndroidReceiptRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localVerificationData = null,Object? productID = null,}) {
  return _then(_VerifyAndroidReceiptRequest(
localVerificationData: null == localVerificationData ? _self.localVerificationData : localVerificationData // ignore: cast_nullable_to_non_nullable
as String,productID: null == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
