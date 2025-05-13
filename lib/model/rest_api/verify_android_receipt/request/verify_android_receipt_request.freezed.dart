// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_android_receipt_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyAndroidReceiptRequest _$VerifyAndroidReceiptRequestFromJson(
    Map<String, dynamic> json) {
  return _VerifyAndroidReceiptRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyAndroidReceiptRequest {
  String get localVerificationData => throw _privateConstructorUsedError;
  String get productID => throw _privateConstructorUsedError;

  /// Serializes this VerifyAndroidReceiptRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyAndroidReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyAndroidReceiptRequestCopyWith<VerifyAndroidReceiptRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyAndroidReceiptRequestCopyWith<$Res> {
  factory $VerifyAndroidReceiptRequestCopyWith(
          VerifyAndroidReceiptRequest value,
          $Res Function(VerifyAndroidReceiptRequest) then) =
      _$VerifyAndroidReceiptRequestCopyWithImpl<$Res,
          VerifyAndroidReceiptRequest>;
  @useResult
  $Res call({String localVerificationData, String productID});
}

/// @nodoc
class _$VerifyAndroidReceiptRequestCopyWithImpl<$Res,
        $Val extends VerifyAndroidReceiptRequest>
    implements $VerifyAndroidReceiptRequestCopyWith<$Res> {
  _$VerifyAndroidReceiptRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyAndroidReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localVerificationData = null,
    Object? productID = null,
  }) {
    return _then(_value.copyWith(
      localVerificationData: null == localVerificationData
          ? _value.localVerificationData
          : localVerificationData // ignore: cast_nullable_to_non_nullable
              as String,
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyAndroidReceiptRequestImplCopyWith<$Res>
    implements $VerifyAndroidReceiptRequestCopyWith<$Res> {
  factory _$$VerifyAndroidReceiptRequestImplCopyWith(
          _$VerifyAndroidReceiptRequestImpl value,
          $Res Function(_$VerifyAndroidReceiptRequestImpl) then) =
      __$$VerifyAndroidReceiptRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String localVerificationData, String productID});
}

/// @nodoc
class __$$VerifyAndroidReceiptRequestImplCopyWithImpl<$Res>
    extends _$VerifyAndroidReceiptRequestCopyWithImpl<$Res,
        _$VerifyAndroidReceiptRequestImpl>
    implements _$$VerifyAndroidReceiptRequestImplCopyWith<$Res> {
  __$$VerifyAndroidReceiptRequestImplCopyWithImpl(
      _$VerifyAndroidReceiptRequestImpl _value,
      $Res Function(_$VerifyAndroidReceiptRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyAndroidReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localVerificationData = null,
    Object? productID = null,
  }) {
    return _then(_$VerifyAndroidReceiptRequestImpl(
      localVerificationData: null == localVerificationData
          ? _value.localVerificationData
          : localVerificationData // ignore: cast_nullable_to_non_nullable
              as String,
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyAndroidReceiptRequestImpl extends _VerifyAndroidReceiptRequest {
  const _$VerifyAndroidReceiptRequestImpl(
      {required this.localVerificationData, required this.productID})
      : super._();

  factory _$VerifyAndroidReceiptRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VerifyAndroidReceiptRequestImplFromJson(json);

  @override
  final String localVerificationData;
  @override
  final String productID;

  @override
  String toString() {
    return 'VerifyAndroidReceiptRequest(localVerificationData: $localVerificationData, productID: $productID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyAndroidReceiptRequestImpl &&
            (identical(other.localVerificationData, localVerificationData) ||
                other.localVerificationData == localVerificationData) &&
            (identical(other.productID, productID) ||
                other.productID == productID));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, localVerificationData, productID);

  /// Create a copy of VerifyAndroidReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyAndroidReceiptRequestImplCopyWith<_$VerifyAndroidReceiptRequestImpl>
      get copyWith => __$$VerifyAndroidReceiptRequestImplCopyWithImpl<
          _$VerifyAndroidReceiptRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyAndroidReceiptRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifyAndroidReceiptRequest
    extends VerifyAndroidReceiptRequest {
  const factory _VerifyAndroidReceiptRequest(
      {required final String localVerificationData,
      required final String productID}) = _$VerifyAndroidReceiptRequestImpl;
  const _VerifyAndroidReceiptRequest._() : super._();

  factory _VerifyAndroidReceiptRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyAndroidReceiptRequestImpl.fromJson;

  @override
  String get localVerificationData;
  @override
  String get productID;

  /// Create a copy of VerifyAndroidReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyAndroidReceiptRequestImplCopyWith<_$VerifyAndroidReceiptRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
