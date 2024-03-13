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
  String get model => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;
  int get n => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateImageRequestCopyWith<GenerateImageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateImageRequestCopyWith<$Res> {
  factory $GenerateImageRequestCopyWith(GenerateImageRequest value,
          $Res Function(GenerateImageRequest) then) =
      _$GenerateImageRequestCopyWithImpl<$Res, GenerateImageRequest>;
  @useResult
  $Res call({String model, String prompt, int n, String size, String user});
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? prompt = null,
    Object? n = null,
    Object? size = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      n: null == n
          ? _value.n
          : n // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
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
  $Res call({String model, String prompt, int n, String size, String user});
}

/// @nodoc
class __$$GenerateImageRequestImplCopyWithImpl<$Res>
    extends _$GenerateImageRequestCopyWithImpl<$Res, _$GenerateImageRequestImpl>
    implements _$$GenerateImageRequestImplCopyWith<$Res> {
  __$$GenerateImageRequestImplCopyWithImpl(_$GenerateImageRequestImpl _value,
      $Res Function(_$GenerateImageRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? prompt = null,
    Object? n = null,
    Object? size = null,
    Object? user = null,
  }) {
    return _then(_$GenerateImageRequestImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      n: null == n
          ? _value.n
          : n // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateImageRequestImpl implements _GenerateImageRequest {
  const _$GenerateImageRequestImpl(
      {this.model = OpenAIConstants.imageModel,
      required this.prompt,
      this.n = 1,
      required this.size,
      required this.user});

  factory _$GenerateImageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateImageRequestImplFromJson(json);

  @override
  @JsonKey()
  final String model;
  @override
  final String prompt;
  @override
  @JsonKey()
  final int n;
  @override
  final String size;
  @override
  final String user;

  @override
  String toString() {
    return 'GenerateImageRequest(model: $model, prompt: $prompt, n: $n, size: $size, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateImageRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.n, n) || other.n == n) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, model, prompt, n, size, user);

  @JsonKey(ignore: true)
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

abstract class _GenerateImageRequest implements GenerateImageRequest {
  const factory _GenerateImageRequest(
      {final String model,
      required final String prompt,
      final int n,
      required final String size,
      required final String user}) = _$GenerateImageRequestImpl;

  factory _GenerateImageRequest.fromJson(Map<String, dynamic> json) =
      _$GenerateImageRequestImpl.fromJson;

  @override
  String get model;
  @override
  String get prompt;
  @override
  int get n;
  @override
  String get size;
  @override
  String get user;
  @override
  @JsonKey(ignore: true)
  _$$GenerateImageRequestImplCopyWith<_$GenerateImageRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
