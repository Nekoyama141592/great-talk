// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceiptResponse {
  SDMap get latestReceipt;

  /// Create a copy of ReceiptResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceiptResponseCopyWith<ReceiptResponse> get copyWith =>
      _$ReceiptResponseCopyWithImpl<ReceiptResponse>(
          this as ReceiptResponse, _$identity);

  /// Serializes this ReceiptResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceiptResponse &&
            const DeepCollectionEquality()
                .equals(other.latestReceipt, latestReceipt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(latestReceipt));

  @override
  String toString() {
    return 'ReceiptResponse(latestReceipt: $latestReceipt)';
  }
}

/// @nodoc
abstract mixin class $ReceiptResponseCopyWith<$Res> {
  factory $ReceiptResponseCopyWith(
          ReceiptResponse value, $Res Function(ReceiptResponse) _then) =
      _$ReceiptResponseCopyWithImpl;
  @useResult
  $Res call({SDMap latestReceipt});
}

/// @nodoc
class _$ReceiptResponseCopyWithImpl<$Res>
    implements $ReceiptResponseCopyWith<$Res> {
  _$ReceiptResponseCopyWithImpl(this._self, this._then);

  final ReceiptResponse _self;
  final $Res Function(ReceiptResponse) _then;

  /// Create a copy of ReceiptResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestReceipt = null,
  }) {
    return _then(_self.copyWith(
      latestReceipt: null == latestReceipt
          ? _self.latestReceipt
          : latestReceipt // ignore: cast_nullable_to_non_nullable
              as SDMap,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReceiptResponse extends ReceiptResponse {
  const _ReceiptResponse({required final SDMap latestReceipt})
      : _latestReceipt = latestReceipt,
        super._();
  factory _ReceiptResponse.fromJson(Map<String, dynamic> json) =>
      _$ReceiptResponseFromJson(json);

  final SDMap _latestReceipt;
  @override
  SDMap get latestReceipt {
    if (_latestReceipt is EqualUnmodifiableMapView) return _latestReceipt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_latestReceipt);
  }

  /// Create a copy of ReceiptResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReceiptResponseCopyWith<_ReceiptResponse> get copyWith =>
      __$ReceiptResponseCopyWithImpl<_ReceiptResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReceiptResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReceiptResponse &&
            const DeepCollectionEquality()
                .equals(other._latestReceipt, _latestReceipt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_latestReceipt));

  @override
  String toString() {
    return 'ReceiptResponse(latestReceipt: $latestReceipt)';
  }
}

/// @nodoc
abstract mixin class _$ReceiptResponseCopyWith<$Res>
    implements $ReceiptResponseCopyWith<$Res> {
  factory _$ReceiptResponseCopyWith(
          _ReceiptResponse value, $Res Function(_ReceiptResponse) _then) =
      __$ReceiptResponseCopyWithImpl;
  @override
  @useResult
  $Res call({SDMap latestReceipt});
}

/// @nodoc
class __$ReceiptResponseCopyWithImpl<$Res>
    implements _$ReceiptResponseCopyWith<$Res> {
  __$ReceiptResponseCopyWithImpl(this._self, this._then);

  final _ReceiptResponse _self;
  final $Res Function(_ReceiptResponse) _then;

  /// Create a copy of ReceiptResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latestReceipt = null,
  }) {
    return _then(_ReceiptResponse(
      latestReceipt: null == latestReceipt
          ? _self._latestReceipt
          : latestReceipt // ignore: cast_nullable_to_non_nullable
              as SDMap,
    ));
  }
}

// dart format on
