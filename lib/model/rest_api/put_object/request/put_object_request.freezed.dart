// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'put_object_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PutObjectRequest _$PutObjectRequestFromJson(Map<String, dynamic> json) {
  return _PutObjectRequest.fromJson(json);
}

/// @nodoc
mixin _$PutObjectRequest {
  String get base64Image => throw _privateConstructorUsedError;
  String get object => throw _privateConstructorUsedError;

  /// Serializes this PutObjectRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PutObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PutObjectRequestCopyWith<PutObjectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PutObjectRequestCopyWith<$Res> {
  factory $PutObjectRequestCopyWith(
          PutObjectRequest value, $Res Function(PutObjectRequest) then) =
      _$PutObjectRequestCopyWithImpl<$Res, PutObjectRequest>;
  @useResult
  $Res call({String base64Image, String object});
}

/// @nodoc
class _$PutObjectRequestCopyWithImpl<$Res, $Val extends PutObjectRequest>
    implements $PutObjectRequestCopyWith<$Res> {
  _$PutObjectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PutObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64Image = null,
    Object? object = null,
  }) {
    return _then(_value.copyWith(
      base64Image: null == base64Image
          ? _value.base64Image
          : base64Image // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PutObjectRequestImplCopyWith<$Res>
    implements $PutObjectRequestCopyWith<$Res> {
  factory _$$PutObjectRequestImplCopyWith(_$PutObjectRequestImpl value,
          $Res Function(_$PutObjectRequestImpl) then) =
      __$$PutObjectRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String base64Image, String object});
}

/// @nodoc
class __$$PutObjectRequestImplCopyWithImpl<$Res>
    extends _$PutObjectRequestCopyWithImpl<$Res, _$PutObjectRequestImpl>
    implements _$$PutObjectRequestImplCopyWith<$Res> {
  __$$PutObjectRequestImplCopyWithImpl(_$PutObjectRequestImpl _value,
      $Res Function(_$PutObjectRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PutObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64Image = null,
    Object? object = null,
  }) {
    return _then(_$PutObjectRequestImpl(
      base64Image: null == base64Image
          ? _value.base64Image
          : base64Image // ignore: cast_nullable_to_non_nullable
              as String,
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PutObjectRequestImpl extends _PutObjectRequest {
  const _$PutObjectRequestImpl(
      {required this.base64Image, required this.object})
      : super._();

  factory _$PutObjectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PutObjectRequestImplFromJson(json);

  @override
  final String base64Image;
  @override
  final String object;

  @override
  String toString() {
    return 'PutObjectRequest(base64Image: $base64Image, object: $object)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PutObjectRequestImpl &&
            (identical(other.base64Image, base64Image) ||
                other.base64Image == base64Image) &&
            (identical(other.object, object) || other.object == object));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, base64Image, object);

  /// Create a copy of PutObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PutObjectRequestImplCopyWith<_$PutObjectRequestImpl> get copyWith =>
      __$$PutObjectRequestImplCopyWithImpl<_$PutObjectRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PutObjectRequestImplToJson(
      this,
    );
  }
}

abstract class _PutObjectRequest extends PutObjectRequest {
  const factory _PutObjectRequest(
      {required final String base64Image,
      required final String object}) = _$PutObjectRequestImpl;
  const _PutObjectRequest._() : super._();

  factory _PutObjectRequest.fromJson(Map<String, dynamic> json) =
      _$PutObjectRequestImpl.fromJson;

  @override
  String get base64Image;
  @override
  String get object;

  /// Create a copy of PutObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PutObjectRequestImplCopyWith<_$PutObjectRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
