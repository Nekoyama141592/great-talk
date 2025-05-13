// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_text_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenerateTextResponse _$GenerateTextResponseFromJson(Map<String, dynamic> json) {
  return _GenerateTextResponse.fromJson(json);
}

/// @nodoc
mixin _$GenerateTextResponse {
  List<Map<String, dynamic>> get choices => throw _privateConstructorUsedError;

  /// Serializes this GenerateTextResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateTextResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateTextResponseCopyWith<GenerateTextResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateTextResponseCopyWith<$Res> {
  factory $GenerateTextResponseCopyWith(GenerateTextResponse value,
          $Res Function(GenerateTextResponse) then) =
      _$GenerateTextResponseCopyWithImpl<$Res, GenerateTextResponse>;
  @useResult
  $Res call({List<Map<String, dynamic>> choices});
}

/// @nodoc
class _$GenerateTextResponseCopyWithImpl<$Res,
        $Val extends GenerateTextResponse>
    implements $GenerateTextResponseCopyWith<$Res> {
  _$GenerateTextResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateTextResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? choices = null,
  }) {
    return _then(_value.copyWith(
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateTextResponseImplCopyWith<$Res>
    implements $GenerateTextResponseCopyWith<$Res> {
  factory _$$GenerateTextResponseImplCopyWith(_$GenerateTextResponseImpl value,
          $Res Function(_$GenerateTextResponseImpl) then) =
      __$$GenerateTextResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> choices});
}

/// @nodoc
class __$$GenerateTextResponseImplCopyWithImpl<$Res>
    extends _$GenerateTextResponseCopyWithImpl<$Res, _$GenerateTextResponseImpl>
    implements _$$GenerateTextResponseImplCopyWith<$Res> {
  __$$GenerateTextResponseImplCopyWithImpl(_$GenerateTextResponseImpl _value,
      $Res Function(_$GenerateTextResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerateTextResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? choices = null,
  }) {
    return _then(_$GenerateTextResponseImpl(
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateTextResponseImpl implements _GenerateTextResponse {
  const _$GenerateTextResponseImpl(
      {required final List<Map<String, dynamic>> choices})
      : _choices = choices;

  factory _$GenerateTextResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateTextResponseImplFromJson(json);

  final List<Map<String, dynamic>> _choices;
  @override
  List<Map<String, dynamic>> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'GenerateTextResponse(choices: $choices)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateTextResponseImpl &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_choices));

  /// Create a copy of GenerateTextResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateTextResponseImplCopyWith<_$GenerateTextResponseImpl>
      get copyWith =>
          __$$GenerateTextResponseImplCopyWithImpl<_$GenerateTextResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateTextResponseImplToJson(
      this,
    );
  }
}

abstract class _GenerateTextResponse implements GenerateTextResponse {
  const factory _GenerateTextResponse(
          {required final List<Map<String, dynamic>> choices}) =
      _$GenerateTextResponseImpl;

  factory _GenerateTextResponse.fromJson(Map<String, dynamic> json) =
      _$GenerateTextResponseImpl.fromJson;

  @override
  List<Map<String, dynamic>> get choices;

  /// Create a copy of GenerateTextResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateTextResponseImplCopyWith<_$GenerateTextResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
