// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ios_receipt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IOSReceiptResponse _$IOSReceiptResponseFromJson(Map<String, dynamic> json) {
  return _IOSReceiptResponse.fromJson(json);
}

/// @nodoc
mixin _$IOSReceiptResponse {
  int get responseCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  Map<String, dynamic>? get latestReceipt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IOSReceiptResponseCopyWith<IOSReceiptResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IOSReceiptResponseCopyWith<$Res> {
  factory $IOSReceiptResponseCopyWith(
          IOSReceiptResponse value, $Res Function(IOSReceiptResponse) then) =
      _$IOSReceiptResponseCopyWithImpl<$Res, IOSReceiptResponse>;
  @useResult
  $Res call(
      {int responseCode, String message, Map<String, dynamic>? latestReceipt});
}

/// @nodoc
class _$IOSReceiptResponseCopyWithImpl<$Res, $Val extends IOSReceiptResponse>
    implements $IOSReceiptResponseCopyWith<$Res> {
  _$IOSReceiptResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? message = null,
    Object? latestReceipt = freezed,
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
      latestReceipt: freezed == latestReceipt
          ? _value.latestReceipt
          : latestReceipt // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IOSReceiptResponseCopyWith<$Res>
    implements $IOSReceiptResponseCopyWith<$Res> {
  factory _$$_IOSReceiptResponseCopyWith(_$_IOSReceiptResponse value,
          $Res Function(_$_IOSReceiptResponse) then) =
      __$$_IOSReceiptResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int responseCode, String message, Map<String, dynamic>? latestReceipt});
}

/// @nodoc
class __$$_IOSReceiptResponseCopyWithImpl<$Res>
    extends _$IOSReceiptResponseCopyWithImpl<$Res, _$_IOSReceiptResponse>
    implements _$$_IOSReceiptResponseCopyWith<$Res> {
  __$$_IOSReceiptResponseCopyWithImpl(
      _$_IOSReceiptResponse _value, $Res Function(_$_IOSReceiptResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? message = null,
    Object? latestReceipt = freezed,
  }) {
    return _then(_$_IOSReceiptResponse(
      responseCode: null == responseCode
          ? _value.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      latestReceipt: freezed == latestReceipt
          ? _value._latestReceipt
          : latestReceipt // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IOSReceiptResponse extends _IOSReceiptResponse {
  const _$_IOSReceiptResponse(
      {required this.responseCode,
      required this.message,
      final Map<String, dynamic>? latestReceipt})
      : _latestReceipt = latestReceipt,
        super._();

  factory _$_IOSReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$$_IOSReceiptResponseFromJson(json);

  @override
  final int responseCode;
  @override
  final String message;
  final Map<String, dynamic>? _latestReceipt;
  @override
  Map<String, dynamic>? get latestReceipt {
    final value = _latestReceipt;
    if (value == null) return null;
    if (_latestReceipt is EqualUnmodifiableMapView) return _latestReceipt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'IOSReceiptResponse(responseCode: $responseCode, message: $message, latestReceipt: $latestReceipt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IOSReceiptResponse &&
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
  _$$_IOSReceiptResponseCopyWith<_$_IOSReceiptResponse> get copyWith =>
      __$$_IOSReceiptResponseCopyWithImpl<_$_IOSReceiptResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IOSReceiptResponseToJson(
      this,
    );
  }
}

abstract class _IOSReceiptResponse extends IOSReceiptResponse {
  const factory _IOSReceiptResponse(
      {required final int responseCode,
      required final String message,
      final Map<String, dynamic>? latestReceipt}) = _$_IOSReceiptResponse;
  const _IOSReceiptResponse._() : super._();

  factory _IOSReceiptResponse.fromJson(Map<String, dynamic> json) =
      _$_IOSReceiptResponse.fromJson;

  @override
  int get responseCode;
  @override
  String get message;
  @override
  Map<String, dynamic>? get latestReceipt;
  @override
  @JsonKey(ignore: true)
  _$$_IOSReceiptResponseCopyWith<_$_IOSReceiptResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
