// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceiptRequest {
  Map<String, dynamic> get data;
  String get uid;

  /// Create a copy of ReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceiptRequestCopyWith<ReceiptRequest> get copyWith =>
      _$ReceiptRequestCopyWithImpl<ReceiptRequest>(
          this as ReceiptRequest, _$identity);

  /// Serializes this ReceiptRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceiptRequest &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data), uid);

  @override
  String toString() {
    return 'ReceiptRequest(data: $data, uid: $uid)';
  }
}

/// @nodoc
abstract mixin class $ReceiptRequestCopyWith<$Res> {
  factory $ReceiptRequestCopyWith(
          ReceiptRequest value, $Res Function(ReceiptRequest) _then) =
      _$ReceiptRequestCopyWithImpl;
  @useResult
  $Res call({Map<String, dynamic> data, String uid});
}

/// @nodoc
class _$ReceiptRequestCopyWithImpl<$Res>
    implements $ReceiptRequestCopyWith<$Res> {
  _$ReceiptRequestCopyWithImpl(this._self, this._then);

  final ReceiptRequest _self;
  final $Res Function(ReceiptRequest) _then;

  /// Create a copy of ReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? uid = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReceiptRequest extends ReceiptRequest {
  const _ReceiptRequest(
      {required final Map<String, dynamic> data, required this.uid})
      : _data = data,
        super._();
  factory _ReceiptRequest.fromJson(Map<String, dynamic> json) =>
      _$ReceiptRequestFromJson(json);

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final String uid;

  /// Create a copy of ReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReceiptRequestCopyWith<_ReceiptRequest> get copyWith =>
      __$ReceiptRequestCopyWithImpl<_ReceiptRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReceiptRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReceiptRequest &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data), uid);

  @override
  String toString() {
    return 'ReceiptRequest(data: $data, uid: $uid)';
  }
}

/// @nodoc
abstract mixin class _$ReceiptRequestCopyWith<$Res>
    implements $ReceiptRequestCopyWith<$Res> {
  factory _$ReceiptRequestCopyWith(
          _ReceiptRequest value, $Res Function(_ReceiptRequest) _then) =
      __$ReceiptRequestCopyWithImpl;
  @override
  @useResult
  $Res call({Map<String, dynamic> data, String uid});
}

/// @nodoc
class __$ReceiptRequestCopyWithImpl<$Res>
    implements _$ReceiptRequestCopyWith<$Res> {
  __$ReceiptRequestCopyWithImpl(this._self, this._then);

  final _ReceiptRequest _self;
  final $Res Function(_ReceiptRequest) _then;

  /// Create a copy of ReceiptRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? uid = null,
  }) {
    return _then(_ReceiptRequest(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
