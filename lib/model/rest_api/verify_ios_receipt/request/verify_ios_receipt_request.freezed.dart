// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_ios_receipt_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VerifyIOSReceiptRequest {
  String get serverVerificationData;

  /// Create a copy of VerifyIOSReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VerifyIOSReceiptRequestCopyWith<VerifyIOSReceiptRequest> get copyWith =>
      _$VerifyIOSReceiptRequestCopyWithImpl<VerifyIOSReceiptRequest>(
          this as VerifyIOSReceiptRequest, _$identity);

  /// Serializes this VerifyIOSReceiptRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VerifyIOSReceiptRequest &&
            (identical(other.serverVerificationData, serverVerificationData) ||
                other.serverVerificationData == serverVerificationData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serverVerificationData);

  @override
  String toString() {
    return 'VerifyIOSReceiptRequest(serverVerificationData: $serverVerificationData)';
  }
}

/// @nodoc
abstract mixin class $VerifyIOSReceiptRequestCopyWith<$Res> {
  factory $VerifyIOSReceiptRequestCopyWith(VerifyIOSReceiptRequest value,
          $Res Function(VerifyIOSReceiptRequest) _then) =
      _$VerifyIOSReceiptRequestCopyWithImpl;
  @useResult
  $Res call({String serverVerificationData});
}

/// @nodoc
class _$VerifyIOSReceiptRequestCopyWithImpl<$Res>
    implements $VerifyIOSReceiptRequestCopyWith<$Res> {
  _$VerifyIOSReceiptRequestCopyWithImpl(this._self, this._then);

  final VerifyIOSReceiptRequest _self;
  final $Res Function(VerifyIOSReceiptRequest) _then;

  /// Create a copy of VerifyIOSReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverVerificationData = null,
  }) {
    return _then(_self.copyWith(
      serverVerificationData: null == serverVerificationData
          ? _self.serverVerificationData
          : serverVerificationData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _VerifyIOSReceiptRequest extends VerifyIOSReceiptRequest {
  const _VerifyIOSReceiptRequest({required this.serverVerificationData})
      : super._();
  factory _VerifyIOSReceiptRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyIOSReceiptRequestFromJson(json);

  @override
  final String serverVerificationData;

  /// Create a copy of VerifyIOSReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VerifyIOSReceiptRequestCopyWith<_VerifyIOSReceiptRequest> get copyWith =>
      __$VerifyIOSReceiptRequestCopyWithImpl<_VerifyIOSReceiptRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VerifyIOSReceiptRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VerifyIOSReceiptRequest &&
            (identical(other.serverVerificationData, serverVerificationData) ||
                other.serverVerificationData == serverVerificationData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serverVerificationData);

  @override
  String toString() {
    return 'VerifyIOSReceiptRequest(serverVerificationData: $serverVerificationData)';
  }
}

/// @nodoc
abstract mixin class _$VerifyIOSReceiptRequestCopyWith<$Res>
    implements $VerifyIOSReceiptRequestCopyWith<$Res> {
  factory _$VerifyIOSReceiptRequestCopyWith(_VerifyIOSReceiptRequest value,
          $Res Function(_VerifyIOSReceiptRequest) _then) =
      __$VerifyIOSReceiptRequestCopyWithImpl;
  @override
  @useResult
  $Res call({String serverVerificationData});
}

/// @nodoc
class __$VerifyIOSReceiptRequestCopyWithImpl<$Res>
    implements _$VerifyIOSReceiptRequestCopyWith<$Res> {
  __$VerifyIOSReceiptRequestCopyWithImpl(this._self, this._then);

  final _VerifyIOSReceiptRequest _self;
  final $Res Function(_VerifyIOSReceiptRequest) _then;

  /// Create a copy of VerifyIOSReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? serverVerificationData = null,
  }) {
    return _then(_VerifyIOSReceiptRequest(
      serverVerificationData: null == serverVerificationData
          ? _self.serverVerificationData
          : serverVerificationData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
