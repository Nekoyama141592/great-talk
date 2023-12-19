// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ios_latest_receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IOSLatestReceipt _$IOSLatestReceiptFromJson(Map<String, dynamic> json) {
  return _IOSLatestReceipt.fromJson(json);
}

/// @nodoc
mixin _$IOSLatestReceipt {
  String get product_id => throw _privateConstructorUsedError;
  String get expires_date_ms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IOSLatestReceiptCopyWith<IOSLatestReceipt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IOSLatestReceiptCopyWith<$Res> {
  factory $IOSLatestReceiptCopyWith(
          IOSLatestReceipt value, $Res Function(IOSLatestReceipt) then) =
      _$IOSLatestReceiptCopyWithImpl<$Res, IOSLatestReceipt>;
  @useResult
  $Res call({String product_id, String expires_date_ms});
}

/// @nodoc
class _$IOSLatestReceiptCopyWithImpl<$Res, $Val extends IOSLatestReceipt>
    implements $IOSLatestReceiptCopyWith<$Res> {
  _$IOSLatestReceiptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product_id = null,
    Object? expires_date_ms = null,
  }) {
    return _then(_value.copyWith(
      product_id: null == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as String,
      expires_date_ms: null == expires_date_ms
          ? _value.expires_date_ms
          : expires_date_ms // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IOSLatestReceiptCopyWith<$Res>
    implements $IOSLatestReceiptCopyWith<$Res> {
  factory _$$_IOSLatestReceiptCopyWith(
          _$_IOSLatestReceipt value, $Res Function(_$_IOSLatestReceipt) then) =
      __$$_IOSLatestReceiptCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String product_id, String expires_date_ms});
}

/// @nodoc
class __$$_IOSLatestReceiptCopyWithImpl<$Res>
    extends _$IOSLatestReceiptCopyWithImpl<$Res, _$_IOSLatestReceipt>
    implements _$$_IOSLatestReceiptCopyWith<$Res> {
  __$$_IOSLatestReceiptCopyWithImpl(
      _$_IOSLatestReceipt _value, $Res Function(_$_IOSLatestReceipt) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product_id = null,
    Object? expires_date_ms = null,
  }) {
    return _then(_$_IOSLatestReceipt(
      product_id: null == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as String,
      expires_date_ms: null == expires_date_ms
          ? _value.expires_date_ms
          : expires_date_ms // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IOSLatestReceipt extends _IOSLatestReceipt {
  const _$_IOSLatestReceipt(
      {required this.product_id, required this.expires_date_ms})
      : super._();

  factory _$_IOSLatestReceipt.fromJson(Map<String, dynamic> json) =>
      _$$_IOSLatestReceiptFromJson(json);

  @override
  final String product_id;
  @override
  final String expires_date_ms;

  @override
  String toString() {
    return 'IOSLatestReceipt(product_id: $product_id, expires_date_ms: $expires_date_ms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IOSLatestReceipt &&
            (identical(other.product_id, product_id) ||
                other.product_id == product_id) &&
            (identical(other.expires_date_ms, expires_date_ms) ||
                other.expires_date_ms == expires_date_ms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, product_id, expires_date_ms);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IOSLatestReceiptCopyWith<_$_IOSLatestReceipt> get copyWith =>
      __$$_IOSLatestReceiptCopyWithImpl<_$_IOSLatestReceipt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IOSLatestReceiptToJson(
      this,
    );
  }
}

abstract class _IOSLatestReceipt extends IOSLatestReceipt {
  const factory _IOSLatestReceipt(
      {required final String product_id,
      required final String expires_date_ms}) = _$_IOSLatestReceipt;
  const _IOSLatestReceipt._() : super._();

  factory _IOSLatestReceipt.fromJson(Map<String, dynamic> json) =
      _$_IOSLatestReceipt.fromJson;

  @override
  String get product_id;
  @override
  String get expires_date_ms;
  @override
  @JsonKey(ignore: true)
  _$$_IOSLatestReceiptCopyWith<_$_IOSLatestReceipt> get copyWith =>
      throw _privateConstructorUsedError;
}
