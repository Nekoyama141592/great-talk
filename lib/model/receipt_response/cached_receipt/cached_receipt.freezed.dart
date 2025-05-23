// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CachedReceipt {
  String get expiryTimeMillis;
  String get orderId;
  String get originalTransactionId;
  String get productId;
  String get startTimeMillis;
  String get uid;

  /// Create a copy of CachedReceipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CachedReceiptCopyWith<CachedReceipt> get copyWith =>
      _$CachedReceiptCopyWithImpl<CachedReceipt>(
          this as CachedReceipt, _$identity);

  /// Serializes this CachedReceipt to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CachedReceipt &&
            (identical(other.expiryTimeMillis, expiryTimeMillis) ||
                other.expiryTimeMillis == expiryTimeMillis) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.originalTransactionId, originalTransactionId) ||
                other.originalTransactionId == originalTransactionId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.startTimeMillis, startTimeMillis) ||
                other.startTimeMillis == startTimeMillis) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, expiryTimeMillis, orderId,
      originalTransactionId, productId, startTimeMillis, uid);

  @override
  String toString() {
    return 'CachedReceipt(expiryTimeMillis: $expiryTimeMillis, orderId: $orderId, originalTransactionId: $originalTransactionId, productId: $productId, startTimeMillis: $startTimeMillis, uid: $uid)';
  }
}

/// @nodoc
abstract mixin class $CachedReceiptCopyWith<$Res> {
  factory $CachedReceiptCopyWith(
          CachedReceipt value, $Res Function(CachedReceipt) _then) =
      _$CachedReceiptCopyWithImpl;
  @useResult
  $Res call(
      {String expiryTimeMillis,
      String orderId,
      String originalTransactionId,
      String productId,
      String startTimeMillis,
      String uid});
}

/// @nodoc
class _$CachedReceiptCopyWithImpl<$Res>
    implements $CachedReceiptCopyWith<$Res> {
  _$CachedReceiptCopyWithImpl(this._self, this._then);

  final CachedReceipt _self;
  final $Res Function(CachedReceipt) _then;

  /// Create a copy of CachedReceipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expiryTimeMillis = null,
    Object? orderId = null,
    Object? originalTransactionId = null,
    Object? productId = null,
    Object? startTimeMillis = null,
    Object? uid = null,
  }) {
    return _then(_self.copyWith(
      expiryTimeMillis: null == expiryTimeMillis
          ? _self.expiryTimeMillis
          : expiryTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      originalTransactionId: null == originalTransactionId
          ? _self.originalTransactionId
          : originalTransactionId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
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
class _CachedReceipt extends CachedReceipt {
  const _CachedReceipt(
      {required this.expiryTimeMillis,
      required this.orderId,
      required this.originalTransactionId,
      required this.productId,
      required this.startTimeMillis,
      required this.uid})
      : super._();
  factory _CachedReceipt.fromJson(Map<String, dynamic> json) =>
      _$CachedReceiptFromJson(json);

  @override
  final String expiryTimeMillis;
  @override
  final String orderId;
  @override
  final String originalTransactionId;
  @override
  final String productId;
  @override
  final String startTimeMillis;
  @override
  final String uid;

  /// Create a copy of CachedReceipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CachedReceiptCopyWith<_CachedReceipt> get copyWith =>
      __$CachedReceiptCopyWithImpl<_CachedReceipt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CachedReceiptToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CachedReceipt &&
            (identical(other.expiryTimeMillis, expiryTimeMillis) ||
                other.expiryTimeMillis == expiryTimeMillis) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.originalTransactionId, originalTransactionId) ||
                other.originalTransactionId == originalTransactionId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.startTimeMillis, startTimeMillis) ||
                other.startTimeMillis == startTimeMillis) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, expiryTimeMillis, orderId,
      originalTransactionId, productId, startTimeMillis, uid);

  @override
  String toString() {
    return 'CachedReceipt(expiryTimeMillis: $expiryTimeMillis, orderId: $orderId, originalTransactionId: $originalTransactionId, productId: $productId, startTimeMillis: $startTimeMillis, uid: $uid)';
  }
}

/// @nodoc
abstract mixin class _$CachedReceiptCopyWith<$Res>
    implements $CachedReceiptCopyWith<$Res> {
  factory _$CachedReceiptCopyWith(
          _CachedReceipt value, $Res Function(_CachedReceipt) _then) =
      __$CachedReceiptCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String expiryTimeMillis,
      String orderId,
      String originalTransactionId,
      String productId,
      String startTimeMillis,
      String uid});
}

/// @nodoc
class __$CachedReceiptCopyWithImpl<$Res>
    implements _$CachedReceiptCopyWith<$Res> {
  __$CachedReceiptCopyWithImpl(this._self, this._then);

  final _CachedReceipt _self;
  final $Res Function(_CachedReceipt) _then;

  /// Create a copy of CachedReceipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? expiryTimeMillis = null,
    Object? orderId = null,
    Object? originalTransactionId = null,
    Object? productId = null,
    Object? startTimeMillis = null,
    Object? uid = null,
  }) {
    return _then(_CachedReceipt(
      expiryTimeMillis: null == expiryTimeMillis
          ? _self.expiryTimeMillis
          : expiryTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      originalTransactionId: null == originalTransactionId
          ? _self.originalTransactionId
          : originalTransactionId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
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
