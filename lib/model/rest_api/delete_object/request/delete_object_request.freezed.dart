// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_object_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteObjectRequest _$DeleteObjectRequestFromJson(Map<String, dynamic> json) {
  return _DeleteObjectRequest.fromJson(json);
}

/// @nodoc
mixin _$DeleteObjectRequest {
  String get object => throw _privateConstructorUsedError;

  /// Serializes this DeleteObjectRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteObjectRequestCopyWith<DeleteObjectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteObjectRequestCopyWith<$Res> {
  factory $DeleteObjectRequestCopyWith(
          DeleteObjectRequest value, $Res Function(DeleteObjectRequest) then) =
      _$DeleteObjectRequestCopyWithImpl<$Res, DeleteObjectRequest>;
  @useResult
  $Res call({String object});
}

/// @nodoc
class _$DeleteObjectRequestCopyWithImpl<$Res, $Val extends DeleteObjectRequest>
    implements $DeleteObjectRequestCopyWith<$Res> {
  _$DeleteObjectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
  }) {
    return _then(_value.copyWith(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteObjectRequestImplCopyWith<$Res>
    implements $DeleteObjectRequestCopyWith<$Res> {
  factory _$$DeleteObjectRequestImplCopyWith(_$DeleteObjectRequestImpl value,
          $Res Function(_$DeleteObjectRequestImpl) then) =
      __$$DeleteObjectRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String object});
}

/// @nodoc
class __$$DeleteObjectRequestImplCopyWithImpl<$Res>
    extends _$DeleteObjectRequestCopyWithImpl<$Res, _$DeleteObjectRequestImpl>
    implements _$$DeleteObjectRequestImplCopyWith<$Res> {
  __$$DeleteObjectRequestImplCopyWithImpl(_$DeleteObjectRequestImpl _value,
      $Res Function(_$DeleteObjectRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
  }) {
    return _then(_$DeleteObjectRequestImpl(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteObjectRequestImpl extends _DeleteObjectRequest {
  const _$DeleteObjectRequestImpl({required this.object}) : super._();

  factory _$DeleteObjectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteObjectRequestImplFromJson(json);

  @override
  final String object;

  @override
  String toString() {
    return 'DeleteObjectRequest(object: $object)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteObjectRequestImpl &&
            (identical(other.object, object) || other.object == object));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, object);

  /// Create a copy of DeleteObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteObjectRequestImplCopyWith<_$DeleteObjectRequestImpl> get copyWith =>
      __$$DeleteObjectRequestImplCopyWithImpl<_$DeleteObjectRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteObjectRequestImplToJson(
      this,
    );
  }
}

abstract class _DeleteObjectRequest extends DeleteObjectRequest {
  const factory _DeleteObjectRequest({required final String object}) =
      _$DeleteObjectRequestImpl;
  const _DeleteObjectRequest._() : super._();

  factory _DeleteObjectRequest.fromJson(Map<String, dynamic> json) =
      _$DeleteObjectRequestImpl.fromJson;

  @override
  String get object;

  /// Create a copy of DeleteObjectRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteObjectRequestImplCopyWith<_$DeleteObjectRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
