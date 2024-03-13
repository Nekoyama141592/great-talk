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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceiptResponse _$ReceiptResponseFromJson(Map<String, dynamic> json) {
  return _ReceiptResponse.fromJson(json);
}

/// @nodoc
mixin _$ReceiptResponse {
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
  $Res call({Map<String, dynamic> latestReceipt});
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
    Object? latestReceipt = null,
  }) {
    return _then(_value.copyWith(
      latestReceipt: null == latestReceipt
          ? _value.latestReceipt
          : latestReceipt // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptResponseImplCopyWith<$Res>
    implements $ReceiptResponseCopyWith<$Res> {
  factory _$$ReceiptResponseImplCopyWith(_$ReceiptResponseImpl value,
          $Res Function(_$ReceiptResponseImpl) then) =
      __$$ReceiptResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> latestReceipt});
}

/// @nodoc
class __$$ReceiptResponseImplCopyWithImpl<$Res>
    extends _$ReceiptResponseCopyWithImpl<$Res, _$ReceiptResponseImpl>
    implements _$$ReceiptResponseImplCopyWith<$Res> {
  __$$ReceiptResponseImplCopyWithImpl(
      _$ReceiptResponseImpl _value, $Res Function(_$ReceiptResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestReceipt = null,
  }) {
    return _then(_$ReceiptResponseImpl(
      latestReceipt: null == latestReceipt
          ? _value._latestReceipt
          : latestReceipt // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptResponseImpl extends _ReceiptResponse {
  const _$ReceiptResponseImpl(
      {required final Map<String, dynamic> latestReceipt})
      : _latestReceipt = latestReceipt,
        super._();

  factory _$ReceiptResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptResponseImplFromJson(json);

  final Map<String, dynamic> _latestReceipt;
  @override
  Map<String, dynamic> get latestReceipt {
    if (_latestReceipt is EqualUnmodifiableMapView) return _latestReceipt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_latestReceipt);
  }

  @override
  String toString() {
    return 'ReceiptResponse(latestReceipt: $latestReceipt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._latestReceipt, _latestReceipt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_latestReceipt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptResponseImplCopyWith<_$ReceiptResponseImpl> get copyWith =>
      __$$ReceiptResponseImplCopyWithImpl<_$ReceiptResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptResponseImplToJson(
      this,
    );
  }
}

abstract class _ReceiptResponse extends ReceiptResponse {
  const factory _ReceiptResponse(
          {required final Map<String, dynamic> latestReceipt}) =
      _$ReceiptResponseImpl;
  const _ReceiptResponse._() : super._();

  factory _ReceiptResponse.fromJson(Map<String, dynamic> json) =
      _$ReceiptResponseImpl.fromJson;

  @override
  Map<String, dynamic> get latestReceipt;
  @override
  @JsonKey(ignore: true)
  _$$ReceiptResponseImplCopyWith<_$ReceiptResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
