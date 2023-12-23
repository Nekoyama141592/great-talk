// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CachedReceipt _$CachedReceiptFromJson(Map<String, dynamic> json) {
  return _CachedReceipt.fromJson(json);
}

/// @nodoc
mixin _$CachedReceipt {
  String get expiryTimeMillis => throw _privateConstructorUsedError;
  String get orderId => throw _privateConstructorUsedError;
  String get originalTransactionId => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get startTimeMillis => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CachedReceiptCopyWith<CachedReceipt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CachedReceiptCopyWith<$Res> {
  factory $CachedReceiptCopyWith(
          CachedReceipt value, $Res Function(CachedReceipt) then) =
      _$CachedReceiptCopyWithImpl<$Res, CachedReceipt>;
  @useResult
  $Res call(
      {String expiryTimeMillis,
      String orderId,
      String originalTransactionId,
      String productId,
      String startTimeMillis});
}

/// @nodoc
class _$CachedReceiptCopyWithImpl<$Res, $Val extends CachedReceipt>
    implements $CachedReceiptCopyWith<$Res> {
  _$CachedReceiptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expiryTimeMillis = null,
    Object? orderId = null,
    Object? originalTransactionId = null,
    Object? productId = null,
    Object? startTimeMillis = null,
  }) {
    return _then(_value.copyWith(
      expiryTimeMillis: null == expiryTimeMillis
          ? _value.expiryTimeMillis
          : expiryTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      originalTransactionId: null == originalTransactionId
          ? _value.originalTransactionId
          : originalTransactionId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      startTimeMillis: null == startTimeMillis
          ? _value.startTimeMillis
          : startTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CachedReceiptCopyWith<$Res>
    implements $CachedReceiptCopyWith<$Res> {
  factory _$$_CachedReceiptCopyWith(
          _$_CachedReceipt value, $Res Function(_$_CachedReceipt) then) =
      __$$_CachedReceiptCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String expiryTimeMillis,
      String orderId,
      String originalTransactionId,
      String productId,
      String startTimeMillis});
}

/// @nodoc
class __$$_CachedReceiptCopyWithImpl<$Res>
    extends _$CachedReceiptCopyWithImpl<$Res, _$_CachedReceipt>
    implements _$$_CachedReceiptCopyWith<$Res> {
  __$$_CachedReceiptCopyWithImpl(
      _$_CachedReceipt _value, $Res Function(_$_CachedReceipt) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expiryTimeMillis = null,
    Object? orderId = null,
    Object? originalTransactionId = null,
    Object? productId = null,
    Object? startTimeMillis = null,
  }) {
    return _then(_$_CachedReceipt(
      expiryTimeMillis: null == expiryTimeMillis
          ? _value.expiryTimeMillis
          : expiryTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      originalTransactionId: null == originalTransactionId
          ? _value.originalTransactionId
          : originalTransactionId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      startTimeMillis: null == startTimeMillis
          ? _value.startTimeMillis
          : startTimeMillis // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CachedReceipt extends _CachedReceipt {
  const _$_CachedReceipt(
      {required this.expiryTimeMillis,
      required this.orderId,
      required this.originalTransactionId,
      required this.productId,
      required this.startTimeMillis})
      : super._();

  factory _$_CachedReceipt.fromJson(Map<String, dynamic> json) =>
      _$$_CachedReceiptFromJson(json);

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
  String toString() {
    return 'CachedReceipt(expiryTimeMillis: $expiryTimeMillis, orderId: $orderId, originalTransactionId: $originalTransactionId, productId: $productId, startTimeMillis: $startTimeMillis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CachedReceipt &&
            (identical(other.expiryTimeMillis, expiryTimeMillis) ||
                other.expiryTimeMillis == expiryTimeMillis) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.originalTransactionId, originalTransactionId) ||
                other.originalTransactionId == originalTransactionId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.startTimeMillis, startTimeMillis) ||
                other.startTimeMillis == startTimeMillis));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, expiryTimeMillis, orderId,
      originalTransactionId, productId, startTimeMillis);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CachedReceiptCopyWith<_$_CachedReceipt> get copyWith =>
      __$$_CachedReceiptCopyWithImpl<_$_CachedReceipt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CachedReceiptToJson(
      this,
    );
  }
}

abstract class _CachedReceipt extends CachedReceipt {
  const factory _CachedReceipt(
      {required final String expiryTimeMillis,
      required final String orderId,
      required final String originalTransactionId,
      required final String productId,
      required final String startTimeMillis}) = _$_CachedReceipt;
  const _CachedReceipt._() : super._();

  factory _CachedReceipt.fromJson(Map<String, dynamic> json) =
      _$_CachedReceipt.fromJson;

  @override
  String get expiryTimeMillis;
  @override
  String get orderId;
  @override
  String get originalTransactionId;
  @override
  String get productId;
  @override
  String get startTimeMillis;
  @override
  @JsonKey(ignore: true)
  _$$_CachedReceiptCopyWith<_$_CachedReceipt> get copyWith =>
      throw _privateConstructorUsedError;
}
