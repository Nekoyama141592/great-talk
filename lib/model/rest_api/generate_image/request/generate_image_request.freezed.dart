// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_image_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenerateImageRequest _$GenerateImageRequestFromJson(Map<String, dynamic> json) {
  return _GenerateImageRequest.fromJson(json);
}

/// @nodoc
mixin _$GenerateImageRequest {
  String get prompt => throw _privateConstructorUsedError;

  /// Serializes this GenerateImageRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateImageRequestCopyWith<GenerateImageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateImageRequestCopyWith<$Res> {
  factory $GenerateImageRequestCopyWith(GenerateImageRequest value,
          $Res Function(GenerateImageRequest) then) =
      _$GenerateImageRequestCopyWithImpl<$Res, GenerateImageRequest>;
  @useResult
  $Res call({String prompt});
}

/// @nodoc
class _$GenerateImageRequestCopyWithImpl<$Res,
        $Val extends GenerateImageRequest>
    implements $GenerateImageRequestCopyWith<$Res> {
  _$GenerateImageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
  }) {
    return _then(_value.copyWith(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateImageRequestImplCopyWith<$Res>
    implements $GenerateImageRequestCopyWith<$Res> {
  factory _$$GenerateImageRequestImplCopyWith(_$GenerateImageRequestImpl value,
          $Res Function(_$GenerateImageRequestImpl) then) =
      __$$GenerateImageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String prompt});
}

/// @nodoc
class __$$GenerateImageRequestImplCopyWithImpl<$Res>
    extends _$GenerateImageRequestCopyWithImpl<$Res, _$GenerateImageRequestImpl>
    implements _$$GenerateImageRequestImplCopyWith<$Res> {
  __$$GenerateImageRequestImplCopyWithImpl(_$GenerateImageRequestImpl _value,
      $Res Function(_$GenerateImageRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerateImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
  }) {
    return _then(_$GenerateImageRequestImpl(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateImageRequestImpl extends _GenerateImageRequest {
  const _$GenerateImageRequestImpl({required this.prompt}) : super._();

  factory _$GenerateImageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateImageRequestImplFromJson(json);

  @override
  final String prompt;

  @override
  String toString() {
    return 'GenerateImageRequest(prompt: $prompt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateImageRequestImpl &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prompt);

  /// Create a copy of GenerateImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateImageRequestImplCopyWith<_$GenerateImageRequestImpl>
      get copyWith =>
          __$$GenerateImageRequestImplCopyWithImpl<_$GenerateImageRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateImageRequestImplToJson(
      this,
    );
  }
}

abstract class _GenerateImageRequest extends GenerateImageRequest {
  const factory _GenerateImageRequest({required final String prompt}) =
      _$GenerateImageRequestImpl;
  const _GenerateImageRequest._() : super._();

  factory _GenerateImageRequest.fromJson(Map<String, dynamic> json) =
      _$GenerateImageRequestImpl.fromJson;

  @override
  String get prompt;

  /// Create a copy of GenerateImageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateImageRequestImplCopyWith<_$GenerateImageRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
