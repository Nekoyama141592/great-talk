// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_ios_receipt_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerifyIOSReceiptRequest _$VerifyIOSReceiptRequestFromJson(
    Map<String, dynamic> json) {
  return _VerifyIOSReceiptRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifyIOSReceiptRequest {
  String get serverVerificationData => throw _privateConstructorUsedError;

  /// Serializes this VerifyIOSReceiptRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VerifyIOSReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyIOSReceiptRequestCopyWith<VerifyIOSReceiptRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyIOSReceiptRequestCopyWith<$Res> {
  factory $VerifyIOSReceiptRequestCopyWith(VerifyIOSReceiptRequest value,
          $Res Function(VerifyIOSReceiptRequest) then) =
      _$VerifyIOSReceiptRequestCopyWithImpl<$Res, VerifyIOSReceiptRequest>;
  @useResult
  $Res call({String serverVerificationData});
}

/// @nodoc
class _$VerifyIOSReceiptRequestCopyWithImpl<$Res,
        $Val extends VerifyIOSReceiptRequest>
    implements $VerifyIOSReceiptRequestCopyWith<$Res> {
  _$VerifyIOSReceiptRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyIOSReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverVerificationData = null,
  }) {
    return _then(_value.copyWith(
      serverVerificationData: null == serverVerificationData
          ? _value.serverVerificationData
          : serverVerificationData // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyIOSReceiptRequestImplCopyWith<$Res>
    implements $VerifyIOSReceiptRequestCopyWith<$Res> {
  factory _$$VerifyIOSReceiptRequestImplCopyWith(
          _$VerifyIOSReceiptRequestImpl value,
          $Res Function(_$VerifyIOSReceiptRequestImpl) then) =
      __$$VerifyIOSReceiptRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String serverVerificationData});
}

/// @nodoc
class __$$VerifyIOSReceiptRequestImplCopyWithImpl<$Res>
    extends _$VerifyIOSReceiptRequestCopyWithImpl<$Res,
        _$VerifyIOSReceiptRequestImpl>
    implements _$$VerifyIOSReceiptRequestImplCopyWith<$Res> {
  __$$VerifyIOSReceiptRequestImplCopyWithImpl(
      _$VerifyIOSReceiptRequestImpl _value,
      $Res Function(_$VerifyIOSReceiptRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyIOSReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serverVerificationData = null,
  }) {
    return _then(_$VerifyIOSReceiptRequestImpl(
      serverVerificationData: null == serverVerificationData
          ? _value.serverVerificationData
          : serverVerificationData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifyIOSReceiptRequestImpl extends _VerifyIOSReceiptRequest {
  const _$VerifyIOSReceiptRequestImpl({required this.serverVerificationData})
      : super._();

  factory _$VerifyIOSReceiptRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifyIOSReceiptRequestImplFromJson(json);

  @override
  final String serverVerificationData;

  @override
  String toString() {
    return 'VerifyIOSReceiptRequest(serverVerificationData: $serverVerificationData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyIOSReceiptRequestImpl &&
            (identical(other.serverVerificationData, serverVerificationData) ||
                other.serverVerificationData == serverVerificationData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, serverVerificationData);

  /// Create a copy of VerifyIOSReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyIOSReceiptRequestImplCopyWith<_$VerifyIOSReceiptRequestImpl>
      get copyWith => __$$VerifyIOSReceiptRequestImplCopyWithImpl<
          _$VerifyIOSReceiptRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifyIOSReceiptRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifyIOSReceiptRequest extends VerifyIOSReceiptRequest {
  const factory _VerifyIOSReceiptRequest(
          {required final String serverVerificationData}) =
      _$VerifyIOSReceiptRequestImpl;
  const _VerifyIOSReceiptRequest._() : super._();

  factory _VerifyIOSReceiptRequest.fromJson(Map<String, dynamic> json) =
      _$VerifyIOSReceiptRequestImpl.fromJson;

  @override
  String get serverVerificationData;

  /// Create a copy of VerifyIOSReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyIOSReceiptRequestImplCopyWith<_$VerifyIOSReceiptRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
