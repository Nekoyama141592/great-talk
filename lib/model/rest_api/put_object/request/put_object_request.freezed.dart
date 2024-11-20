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
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PutObjectRequestCopyWith<PutObjectRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PutObjectRequestCopyWith<$Res> {
  factory $PutObjectRequestCopyWith(
          PutObjectRequest value, $Res Function(PutObjectRequest) then) =
      _$PutObjectRequestCopyWithImpl<$Res, PutObjectRequest>;
  @useResult
  $Res call({String image});
}

/// @nodoc
class _$PutObjectRequestCopyWithImpl<$Res, $Val extends PutObjectRequest>
    implements $PutObjectRequestCopyWith<$Res> {
  _$PutObjectRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
  $Res call({String image});
}

/// @nodoc
class __$$PutObjectRequestImplCopyWithImpl<$Res>
    extends _$PutObjectRequestCopyWithImpl<$Res, _$PutObjectRequestImpl>
    implements _$$PutObjectRequestImplCopyWith<$Res> {
  __$$PutObjectRequestImplCopyWithImpl(_$PutObjectRequestImpl _value,
      $Res Function(_$PutObjectRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$PutObjectRequestImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PutObjectRequestImpl extends _PutObjectRequest {
  const _$PutObjectRequestImpl({required this.image}) : super._();

  factory _$PutObjectRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PutObjectRequestImplFromJson(json);

  @override
  final String image;

  @override
  String toString() {
    return 'PutObjectRequest(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PutObjectRequestImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
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
  const factory _PutObjectRequest({required final String image}) =
      _$PutObjectRequestImpl;
  const _PutObjectRequest._() : super._();

  factory _PutObjectRequest.fromJson(Map<String, dynamic> json) =
      _$PutObjectRequestImpl.fromJson;

  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$PutObjectRequestImplCopyWith<_$PutObjectRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
