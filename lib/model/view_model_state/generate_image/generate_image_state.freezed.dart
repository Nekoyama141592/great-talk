// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenerateImageState _$GenerateImageStateFromJson(Map<String, dynamic> json) {
  return _GenerateImageState.fromJson(json);
}

/// @nodoc
mixin _$GenerateImageState {
  String get prompt => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;
  String? get base64 => throw _privateConstructorUsedError;

  /// Serializes this GenerateImageState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateImageStateCopyWith<GenerateImageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateImageStateCopyWith<$Res> {
  factory $GenerateImageStateCopyWith(
          GenerateImageState value, $Res Function(GenerateImageState) then) =
      _$GenerateImageStateCopyWithImpl<$Res, GenerateImageState>;
  @useResult
  $Res call({String prompt, String size, String? base64});
}

/// @nodoc
class _$GenerateImageStateCopyWithImpl<$Res, $Val extends GenerateImageState>
    implements $GenerateImageStateCopyWith<$Res> {
  _$GenerateImageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? size = null,
    Object? base64 = freezed,
  }) {
    return _then(_value.copyWith(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      base64: freezed == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateImageStateImplCopyWith<$Res>
    implements $GenerateImageStateCopyWith<$Res> {
  factory _$$GenerateImageStateImplCopyWith(_$GenerateImageStateImpl value,
          $Res Function(_$GenerateImageStateImpl) then) =
      __$$GenerateImageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String prompt, String size, String? base64});
}

/// @nodoc
class __$$GenerateImageStateImplCopyWithImpl<$Res>
    extends _$GenerateImageStateCopyWithImpl<$Res, _$GenerateImageStateImpl>
    implements _$$GenerateImageStateImplCopyWith<$Res> {
  __$$GenerateImageStateImplCopyWithImpl(_$GenerateImageStateImpl _value,
      $Res Function(_$GenerateImageStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerateImageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? size = null,
    Object? base64 = freezed,
  }) {
    return _then(_$GenerateImageStateImpl(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      base64: freezed == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateImageStateImpl implements _GenerateImageState {
  const _$GenerateImageStateImpl(
      {this.prompt = '', this.size = '', this.base64});

  factory _$GenerateImageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateImageStateImplFromJson(json);

  @override
  @JsonKey()
  final String prompt;
  @override
  @JsonKey()
  final String size;
  @override
  final String? base64;

  @override
  String toString() {
    return 'GenerateImageState(prompt: $prompt, size: $size, base64: $base64)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateImageStateImpl &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.base64, base64) || other.base64 == base64));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, prompt, size, base64);

  /// Create a copy of GenerateImageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateImageStateImplCopyWith<_$GenerateImageStateImpl> get copyWith =>
      __$$GenerateImageStateImplCopyWithImpl<_$GenerateImageStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateImageStateImplToJson(
      this,
    );
  }
}

abstract class _GenerateImageState implements GenerateImageState {
  const factory _GenerateImageState(
      {final String prompt,
      final String size,
      final String? base64}) = _$GenerateImageStateImpl;

  factory _GenerateImageState.fromJson(Map<String, dynamic> json) =
      _$GenerateImageStateImpl.fromJson;

  @override
  String get prompt;
  @override
  String get size;
  @override
  String? get base64;

  /// Create a copy of GenerateImageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateImageStateImplCopyWith<_$GenerateImageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
