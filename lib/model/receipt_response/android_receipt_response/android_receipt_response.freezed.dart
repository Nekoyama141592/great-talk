// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'android_receipt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AndroidReceiptResponse _$AndroidReceiptResponseFromJson(
    Map<String, dynamic> json) {
  return _AndroidReceiptResponse.fromJson(json);
}

/// @nodoc
mixin _$AndroidReceiptResponse {
  int get acknowledgementState => throw _privateConstructorUsedError;
  bool get autoRenewing => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get developerPayload => throw _privateConstructorUsedError;
  String get expiryTimeMillis => throw _privateConstructorUsedError;
  String get kind => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  int get paymentState => throw _privateConstructorUsedError;
  String get priceAmountMicros => throw _privateConstructorUsedError;
  String get priceCurrencyCode => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError; // 独自設定
  int get purchaseType => throw _privateConstructorUsedError;
  String get startTimeMillis => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AndroidReceiptResponseCopyWith<AndroidReceiptResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AndroidReceiptResponseCopyWith<$Res> {
  factory $AndroidReceiptResponseCopyWith(AndroidReceiptResponse value,
          $Res Function(AndroidReceiptResponse) then) =
      _$AndroidReceiptResponseCopyWithImpl<$Res, AndroidReceiptResponse>;
  @useResult
  $Res call(
      {int acknowledgementState,
      bool autoRenewing,
      String countryCode,
      String developerPayload,
      String expiryTimeMillis,
      String kind,
      String orderId,
      int paymentState,
      String priceAmountMicros,
      String priceCurrencyCode,
      String productId,
      int purchaseType,
      String startTimeMillis,
      String uid});
}

/// @nodoc
class _$AndroidReceiptResponseCopyWithImpl<$Res,
        $Val extends AndroidReceiptResponse>
    implements $AndroidReceiptResponseCopyWith<$Res> {
  _$AndroidReceiptResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acknowledgementState = null,
    Object? autoRenewing = null,
    Object? countryCode = null,
    Object? developerPayload = null,
    Object? expiryTimeMillis = null,
    Object? kind = null,
    Object? orderId = null,
    Object? paymentState = null,
    Object? priceAmountMicros = null,
    Object? priceCurrencyCode = null,
    Object? productId = null,
    Object? purchaseType = null,
    Object? startTimeMillis = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      acknowledgementState: null == acknowledgementState
          ? _value.acknowledgementState
          : acknowledgementState // ignore: cast_nullable_to_non_nullable
              as int,
      autoRenewing: null == autoRenewing
          ? _value.autoRenewing
          : autoRenewing // ignore: cast_nullable_to_non_nullable
              as bool,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      developerPayload: null == developerPayload
          ? _value.developerPayload
          : developerPayload // ignore: cast_nullable_to_non_nullable
              as String,
      expiryTimeMillis: null == expiryTimeMillis
          ? _value.expiryTimeMillis
          : expiryTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentState: null == paymentState
          ? _value.paymentState
          : paymentState // ignore: cast_nullable_to_non_nullable
              as int,
      priceAmountMicros: null == priceAmountMicros
          ? _value.priceAmountMicros
          : priceAmountMicros // ignore: cast_nullable_to_non_nullable
              as String,
      priceCurrencyCode: null == priceCurrencyCode
          ? _value.priceCurrencyCode
          : priceCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseType: null == purchaseType
          ? _value.purchaseType
          : purchaseType // ignore: cast_nullable_to_non_nullable
              as int,
      startTimeMillis: null == startTimeMillis
          ? _value.startTimeMillis
          : startTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AndroidReceiptResponseImplCopyWith<$Res>
    implements $AndroidReceiptResponseCopyWith<$Res> {
  factory _$$AndroidReceiptResponseImplCopyWith(
          _$AndroidReceiptResponseImpl value,
          $Res Function(_$AndroidReceiptResponseImpl) then) =
      __$$AndroidReceiptResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int acknowledgementState,
      bool autoRenewing,
      String countryCode,
      String developerPayload,
      String expiryTimeMillis,
      String kind,
      String orderId,
      int paymentState,
      String priceAmountMicros,
      String priceCurrencyCode,
      String productId,
      int purchaseType,
      String startTimeMillis,
      String uid});
}

/// @nodoc
class __$$AndroidReceiptResponseImplCopyWithImpl<$Res>
    extends _$AndroidReceiptResponseCopyWithImpl<$Res,
        _$AndroidReceiptResponseImpl>
    implements _$$AndroidReceiptResponseImplCopyWith<$Res> {
  __$$AndroidReceiptResponseImplCopyWithImpl(
      _$AndroidReceiptResponseImpl _value,
      $Res Function(_$AndroidReceiptResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? acknowledgementState = null,
    Object? autoRenewing = null,
    Object? countryCode = null,
    Object? developerPayload = null,
    Object? expiryTimeMillis = null,
    Object? kind = null,
    Object? orderId = null,
    Object? paymentState = null,
    Object? priceAmountMicros = null,
    Object? priceCurrencyCode = null,
    Object? productId = null,
    Object? purchaseType = null,
    Object? startTimeMillis = null,
    Object? uid = null,
  }) {
    return _then(_$AndroidReceiptResponseImpl(
      acknowledgementState: null == acknowledgementState
          ? _value.acknowledgementState
          : acknowledgementState // ignore: cast_nullable_to_non_nullable
              as int,
      autoRenewing: null == autoRenewing
          ? _value.autoRenewing
          : autoRenewing // ignore: cast_nullable_to_non_nullable
              as bool,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      developerPayload: null == developerPayload
          ? _value.developerPayload
          : developerPayload // ignore: cast_nullable_to_non_nullable
              as String,
      expiryTimeMillis: null == expiryTimeMillis
          ? _value.expiryTimeMillis
          : expiryTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentState: null == paymentState
          ? _value.paymentState
          : paymentState // ignore: cast_nullable_to_non_nullable
              as int,
      priceAmountMicros: null == priceAmountMicros
          ? _value.priceAmountMicros
          : priceAmountMicros // ignore: cast_nullable_to_non_nullable
              as String,
      priceCurrencyCode: null == priceCurrencyCode
          ? _value.priceCurrencyCode
          : priceCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseType: null == purchaseType
          ? _value.purchaseType
          : purchaseType // ignore: cast_nullable_to_non_nullable
              as int,
      startTimeMillis: null == startTimeMillis
          ? _value.startTimeMillis
          : startTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AndroidReceiptResponseImpl extends _AndroidReceiptResponse {
  const _$AndroidReceiptResponseImpl(
      {required this.acknowledgementState,
      required this.autoRenewing,
      required this.countryCode,
      required this.developerPayload,
      required this.expiryTimeMillis,
      required this.kind,
      required this.orderId,
      required this.paymentState,
      required this.priceAmountMicros,
      required this.priceCurrencyCode,
      required this.productId,
      required this.purchaseType,
      required this.startTimeMillis,
      required this.uid})
      : super._();

  factory _$AndroidReceiptResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AndroidReceiptResponseImplFromJson(json);

  @override
  final int acknowledgementState;
  @override
  final bool autoRenewing;
  @override
  final String countryCode;
  @override
  final String developerPayload;
  @override
  final String expiryTimeMillis;
  @override
  final String kind;
  @override
  final String orderId;
  @override
  final int paymentState;
  @override
  final String priceAmountMicros;
  @override
  final String priceCurrencyCode;
  @override
  final String productId;
// 独自設定
  @override
  final int purchaseType;
  @override
  final String startTimeMillis;
  @override
  final String uid;

  @override
  String toString() {
    return 'AndroidReceiptResponse(acknowledgementState: $acknowledgementState, autoRenewing: $autoRenewing, countryCode: $countryCode, developerPayload: $developerPayload, expiryTimeMillis: $expiryTimeMillis, kind: $kind, orderId: $orderId, paymentState: $paymentState, priceAmountMicros: $priceAmountMicros, priceCurrencyCode: $priceCurrencyCode, productId: $productId, purchaseType: $purchaseType, startTimeMillis: $startTimeMillis, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AndroidReceiptResponseImpl &&
            (identical(other.acknowledgementState, acknowledgementState) ||
                other.acknowledgementState == acknowledgementState) &&
            (identical(other.autoRenewing, autoRenewing) ||
                other.autoRenewing == autoRenewing) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.developerPayload, developerPayload) ||
                other.developerPayload == developerPayload) &&
            (identical(other.expiryTimeMillis, expiryTimeMillis) ||
                other.expiryTimeMillis == expiryTimeMillis) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.paymentState, paymentState) ||
                other.paymentState == paymentState) &&
            (identical(other.priceAmountMicros, priceAmountMicros) ||
                other.priceAmountMicros == priceAmountMicros) &&
            (identical(other.priceCurrencyCode, priceCurrencyCode) ||
                other.priceCurrencyCode == priceCurrencyCode) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.purchaseType, purchaseType) ||
                other.purchaseType == purchaseType) &&
            (identical(other.startTimeMillis, startTimeMillis) ||
                other.startTimeMillis == startTimeMillis) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      acknowledgementState,
      autoRenewing,
      countryCode,
      developerPayload,
      expiryTimeMillis,
      kind,
      orderId,
      paymentState,
      priceAmountMicros,
      priceCurrencyCode,
      productId,
      purchaseType,
      startTimeMillis,
      uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AndroidReceiptResponseImplCopyWith<_$AndroidReceiptResponseImpl>
      get copyWith => __$$AndroidReceiptResponseImplCopyWithImpl<
          _$AndroidReceiptResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AndroidReceiptResponseImplToJson(
      this,
    );
  }
}

abstract class _AndroidReceiptResponse extends AndroidReceiptResponse {
  const factory _AndroidReceiptResponse(
      {required final int acknowledgementState,
      required final bool autoRenewing,
      required final String countryCode,
      required final String developerPayload,
      required final String expiryTimeMillis,
      required final String kind,
      required final String orderId,
      required final int paymentState,
      required final String priceAmountMicros,
      required final String priceCurrencyCode,
      required final String productId,
      required final int purchaseType,
      required final String startTimeMillis,
      required final String uid}) = _$AndroidReceiptResponseImpl;
  const _AndroidReceiptResponse._() : super._();

  factory _AndroidReceiptResponse.fromJson(Map<String, dynamic> json) =
      _$AndroidReceiptResponseImpl.fromJson;

  @override
  int get acknowledgementState;
  @override
  bool get autoRenewing;
  @override
  String get countryCode;
  @override
  String get developerPayload;
  @override
  String get expiryTimeMillis;
  @override
  String get kind;
  @override
  String get orderId;
  @override
  int get paymentState;
  @override
  String get priceAmountMicros;
  @override
  String get priceCurrencyCode;
  @override
  String get productId;
  @override // 独自設定
  int get purchaseType;
  @override
  String get startTimeMillis;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$AndroidReceiptResponseImplCopyWith<_$AndroidReceiptResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
