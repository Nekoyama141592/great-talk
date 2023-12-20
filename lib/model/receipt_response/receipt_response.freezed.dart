// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptResponse _$ReceiptResponseFromJson(Map<String, dynamic> json) {
  return _ReceiptResponse.fromJson(json);
}

/// @nodoc
mixin _$ReceiptResponse {
  int get responseCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic> get latestReceipt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptResponseCopyWith<ReceiptResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptResponseCopyWith<$Res> {
  factory $ReceiptResponseCopyWith(
          ReceiptResponse value, $Res Function(ReceiptResponse) then) =
      _$ReceiptResponseCopyWithImpl<$Res, ReceiptResponse>;
  @useResult
  $Res call(
      {int responseCode, String message, Map<String, dynamic> latestReceipt});
}

/// @nodoc
class _$ReceiptResponseCopyWithImpl<$Res, $Val extends ReceiptResponse>
    implements $ReceiptResponseCopyWith<$Res> {
  _$ReceiptResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? message = null,
    Object? latestReceipt = null,
  }) {
    return _then(_value.copyWith(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      latestReceipt: null == latestReceipt
          ? _value.latestReceipt
          : latestReceipt // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceiptResponseCopyWith<$Res>
    implements $ReceiptResponseCopyWith<$Res> {
  factory _$$_ReceiptResponseCopyWith(
          _$_ReceiptResponse value, $Res Function(_$_ReceiptResponse) then) =
      __$$_ReceiptResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int responseCode, String message, Map<String, dynamic> latestReceipt});
}

/// @nodoc
class __$$_ReceiptResponseCopyWithImpl<$Res>
    extends _$ReceiptResponseCopyWithImpl<$Res, _$_ReceiptResponse>
    implements _$$_ReceiptResponseCopyWith<$Res> {
  __$$_ReceiptResponseCopyWithImpl(
      _$_ReceiptResponse _value, $Res Function(_$_ReceiptResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? message = null,
    Object? latestReceipt = null,
  }) {
    return _then(_$_ReceiptResponse(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      latestReceipt: null == latestReceipt
          ? _value._latestReceipt
          : latestReceipt // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceiptResponse extends _ReceiptResponse {
  const _$_ReceiptResponse(
      {required this.responseCode,
      required this.message,
      required final Map<String, dynamic> latestReceipt})
      : _latestReceipt = latestReceipt,
        super._();

  factory _$_ReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiptResponseFromJson(json);

  @override
  final int responseCode;
  @override
  final String message;
  final Map<String, dynamic> _latestReceipt;
  @override
  Map<String, dynamic> get latestReceipt {
    if (_latestReceipt is EqualUnmodifiableMapView) return _latestReceipt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_latestReceipt);
  }

  @override
  String toString() {
    return 'ReceiptResponse(responseCode: $responseCode, message: $message, latestReceipt: $latestReceipt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiptResponse &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._latestReceipt, _latestReceipt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message,
      const DeepCollectionEquality().hash(_latestReceipt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceiptResponseCopyWith<_$_ReceiptResponse> get copyWith =>
      __$$_ReceiptResponseCopyWithImpl<_$_ReceiptResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiptResponseToJson(
      this,
    );
  }
}

abstract class _ReceiptResponse extends ReceiptResponse {
  const factory _ReceiptResponse(
      {required final int responseCode,
      required final String message,
      required final Map<String, dynamic> latestReceipt}) = _$_ReceiptResponse;
  const _ReceiptResponse._() : super._();

  factory _ReceiptResponse.fromJson(Map<String, dynamic> json) =
      _$_ReceiptResponse.fromJson;

  @override
  int get responseCode;
  @override
  String get message;
  @override
  Map<String, dynamic> get latestReceipt;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiptResponseCopyWith<_$_ReceiptResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
