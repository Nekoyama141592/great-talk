// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'android_receipt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AndroidReceiptResponse {
  int get acknowledgementState;
  bool get autoRenewing;
  String get countryCode;
  String get developerPayload;
  String get expiryTimeMillis;
  String get kind;
  String get orderId;
  int get paymentState;
  String get priceAmountMicros;
  String get priceCurrencyCode;
  String get productId; // 独自設定
  int get purchaseType;
  String get startTimeMillis;
  String get uid;

  /// Create a copy of AndroidReceiptResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AndroidReceiptResponseCopyWith<AndroidReceiptResponse> get copyWith =>
      _$AndroidReceiptResponseCopyWithImpl<AndroidReceiptResponse>(
          this as AndroidReceiptResponse, _$identity);

  /// Serializes this AndroidReceiptResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AndroidReceiptResponse &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'AndroidReceiptResponse(acknowledgementState: $acknowledgementState, autoRenewing: $autoRenewing, countryCode: $countryCode, developerPayload: $developerPayload, expiryTimeMillis: $expiryTimeMillis, kind: $kind, orderId: $orderId, paymentState: $paymentState, priceAmountMicros: $priceAmountMicros, priceCurrencyCode: $priceCurrencyCode, productId: $productId, purchaseType: $purchaseType, startTimeMillis: $startTimeMillis, uid: $uid)';
  }
}

/// @nodoc
abstract mixin class $AndroidReceiptResponseCopyWith<$Res> {
  factory $AndroidReceiptResponseCopyWith(AndroidReceiptResponse value,
          $Res Function(AndroidReceiptResponse) _then) =
      _$AndroidReceiptResponseCopyWithImpl;
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
class _$AndroidReceiptResponseCopyWithImpl<$Res>
    implements $AndroidReceiptResponseCopyWith<$Res> {
  _$AndroidReceiptResponseCopyWithImpl(this._self, this._then);

  final AndroidReceiptResponse _self;
  final $Res Function(AndroidReceiptResponse) _then;

  /// Create a copy of AndroidReceiptResponse
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      acknowledgementState: null == acknowledgementState
          ? _self.acknowledgementState
          : acknowledgementState // ignore: cast_nullable_to_non_nullable
              as int,
      autoRenewing: null == autoRenewing
          ? _self.autoRenewing
          : autoRenewing // ignore: cast_nullable_to_non_nullable
              as bool,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      developerPayload: null == developerPayload
          ? _self.developerPayload
          : developerPayload // ignore: cast_nullable_to_non_nullable
              as String,
      expiryTimeMillis: null == expiryTimeMillis
          ? _self.expiryTimeMillis
          : expiryTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentState: null == paymentState
          ? _self.paymentState
          : paymentState // ignore: cast_nullable_to_non_nullable
              as int,
      priceAmountMicros: null == priceAmountMicros
          ? _self.priceAmountMicros
          : priceAmountMicros // ignore: cast_nullable_to_non_nullable
              as String,
      priceCurrencyCode: null == priceCurrencyCode
          ? _self.priceCurrencyCode
          : priceCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseType: null == purchaseType
          ? _self.purchaseType
          : purchaseType // ignore: cast_nullable_to_non_nullable
              as int,
      startTimeMillis: null == startTimeMillis
          ? _self.startTimeMillis
          : startTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AndroidReceiptResponse extends AndroidReceiptResponse {
  const _AndroidReceiptResponse(
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
  factory _AndroidReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$AndroidReceiptResponseFromJson(json);

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

  /// Create a copy of AndroidReceiptResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AndroidReceiptResponseCopyWith<_AndroidReceiptResponse> get copyWith =>
      __$AndroidReceiptResponseCopyWithImpl<_AndroidReceiptResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AndroidReceiptResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AndroidReceiptResponse &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'AndroidReceiptResponse(acknowledgementState: $acknowledgementState, autoRenewing: $autoRenewing, countryCode: $countryCode, developerPayload: $developerPayload, expiryTimeMillis: $expiryTimeMillis, kind: $kind, orderId: $orderId, paymentState: $paymentState, priceAmountMicros: $priceAmountMicros, priceCurrencyCode: $priceCurrencyCode, productId: $productId, purchaseType: $purchaseType, startTimeMillis: $startTimeMillis, uid: $uid)';
  }
}

/// @nodoc
abstract mixin class _$AndroidReceiptResponseCopyWith<$Res>
    implements $AndroidReceiptResponseCopyWith<$Res> {
  factory _$AndroidReceiptResponseCopyWith(_AndroidReceiptResponse value,
          $Res Function(_AndroidReceiptResponse) _then) =
      __$AndroidReceiptResponseCopyWithImpl;
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
class __$AndroidReceiptResponseCopyWithImpl<$Res>
    implements _$AndroidReceiptResponseCopyWith<$Res> {
  __$AndroidReceiptResponseCopyWithImpl(this._self, this._then);

  final _AndroidReceiptResponse _self;
  final $Res Function(_AndroidReceiptResponse) _then;

  /// Create a copy of AndroidReceiptResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_AndroidReceiptResponse(
      acknowledgementState: null == acknowledgementState
          ? _self.acknowledgementState
          : acknowledgementState // ignore: cast_nullable_to_non_nullable
              as int,
      autoRenewing: null == autoRenewing
          ? _self.autoRenewing
          : autoRenewing // ignore: cast_nullable_to_non_nullable
              as bool,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      developerPayload: null == developerPayload
          ? _self.developerPayload
          : developerPayload // ignore: cast_nullable_to_non_nullable
              as String,
      expiryTimeMillis: null == expiryTimeMillis
          ? _self.expiryTimeMillis
          : expiryTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentState: null == paymentState
          ? _self.paymentState
          : paymentState // ignore: cast_nullable_to_non_nullable
              as int,
      priceAmountMicros: null == priceAmountMicros
          ? _self.priceAmountMicros
          : priceAmountMicros // ignore: cast_nullable_to_non_nullable
              as String,
      priceCurrencyCode: null == priceCurrencyCode
          ? _self.priceCurrencyCode
          : priceCurrencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseType: null == purchaseType
          ? _self.purchaseType
          : purchaseType // ignore: cast_nullable_to_non_nullable
              as int,
      startTimeMillis: null == startTimeMillis
          ? _self.startTimeMillis
          : startTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
