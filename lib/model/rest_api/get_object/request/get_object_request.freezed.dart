// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_object_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetObjectRequest _$GetObjectRequestFromJson(Map<String, dynamic> json) {
  return _GetObjectRequest.fromJson(json);
}

/// @nodoc
mixin _$GetObjectRequest {
  String get object => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetObjectRequestCopyWith<GetObjectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetObjectRequestCopyWith<$Res> {
  factory $GetObjectRequestCopyWith(
          GetObjectRequest value, $Res Function(GetObjectRequest) then) =
      _$GetObjectRequestCopyWithImpl<$Res, GetObjectRequest>;
  @useResult
  $Res call({String object});
}

/// @nodoc
class _$GetObjectRequestCopyWithImpl<$Res, $Val extends GetObjectRequest>
    implements $GetObjectRequestCopyWith<$Res> {
  _$GetObjectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$GetObjectRequestImplCopyWith<$Res>
    implements $GetObjectRequestCopyWith<$Res> {
  factory _$$GetObjectRequestImplCopyWith(_$GetObjectRequestImpl value,
          $Res Function(_$GetObjectRequestImpl) then) =
      __$$GetObjectRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String object});
}

/// @nodoc
class __$$GetObjectRequestImplCopyWithImpl<$Res>
    extends _$GetObjectRequestCopyWithImpl<$Res, _$GetObjectRequestImpl>
    implements _$$GetObjectRequestImplCopyWith<$Res> {
  __$$GetObjectRequestImplCopyWithImpl(_$GetObjectRequestImpl _value,
      $Res Function(_$GetObjectRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
  }) {
    return _then(_$GetObjectRequestImpl(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetObjectRequestImpl extends _GetObjectRequest {
  const _$GetObjectRequestImpl({required this.object}) : super._();

  factory _$GetObjectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetObjectRequestImplFromJson(json);

  @override
  final String object;

  @override
  String toString() {
    return 'GetObjectRequest(object: $object)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetObjectRequestImpl &&
            (identical(other.object, object) || other.object == object));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, object);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetObjectRequestImplCopyWith<_$GetObjectRequestImpl> get copyWith =>
      __$$GetObjectRequestImplCopyWithImpl<_$GetObjectRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetObjectRequestImplToJson(
      this,
    );
  }
}

abstract class _GetObjectRequest extends GetObjectRequest {
  const factory _GetObjectRequest({required final String object}) =
      _$GetObjectRequestImpl;
  const _GetObjectRequest._() : super._();

  factory _GetObjectRequest.fromJson(Map<String, dynamic> json) =
      _$GetObjectRequestImpl.fromJson;

  @override
  String get object;
  @override
  @JsonKey(ignore: true)
  _$$GetObjectRequestImplCopyWith<_$GetObjectRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
