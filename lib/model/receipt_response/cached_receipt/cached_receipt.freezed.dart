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
  String get uid => throw _privateConstructorUsedError;

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
      String startTimeMillis,
      String uid});
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
    Object? uid = null,
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CachedReceiptImplCopyWith<$Res>
    implements $CachedReceiptCopyWith<$Res> {
  factory _$$CachedReceiptImplCopyWith(
          _$CachedReceiptImpl value, $Res Function(_$CachedReceiptImpl) then) =
      __$$CachedReceiptImplCopyWithImpl<$Res>;
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
class __$$CachedReceiptImplCopyWithImpl<$Res>
    extends _$CachedReceiptCopyWithImpl<$Res, _$CachedReceiptImpl>
    implements _$$CachedReceiptImplCopyWith<$Res> {
  __$$CachedReceiptImplCopyWithImpl(
      _$CachedReceiptImpl _value, $Res Function(_$CachedReceiptImpl) _then)
      : super(_value, _then);

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
    return _then(_$CachedReceiptImpl(
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CachedReceiptImpl extends _CachedReceipt {
  const _$CachedReceiptImpl(
      {required this.expiryTimeMillis,
      required this.orderId,
      required this.originalTransactionId,
      required this.productId,
      required this.startTimeMillis,
      required this.uid})
      : super._();

  factory _$CachedReceiptImpl.fromJson(Map<String, dynamic> json) =>
      _$$CachedReceiptImplFromJson(json);

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

  @override
  String toString() {
    return 'CachedReceipt(expiryTimeMillis: $expiryTimeMillis, orderId: $orderId, originalTransactionId: $originalTransactionId, productId: $productId, startTimeMillis: $startTimeMillis, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CachedReceiptImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, expiryTimeMillis, orderId,
      originalTransactionId, productId, startTimeMillis, uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CachedReceiptImplCopyWith<_$CachedReceiptImpl> get copyWith =>
      __$$CachedReceiptImplCopyWithImpl<_$CachedReceiptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CachedReceiptImplToJson(
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
      required final String startTimeMillis,
      required final String uid}) = _$CachedReceiptImpl;
  const _CachedReceipt._() : super._();

  factory _CachedReceipt.fromJson(Map<String, dynamic> json) =
      _$CachedReceiptImpl.fromJson;

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
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$CachedReceiptImplCopyWith<_$CachedReceiptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
