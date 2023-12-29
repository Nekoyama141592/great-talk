// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenerateImageResponse _$GenerateImageResponseFromJson(
    Map<String, dynamic> json) {
  return _GenerateImageResponse.fromJson(json);
}

/// @nodoc
mixin _$GenerateImageResponse {
  List<GenerateImageData?>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenerateImageResponseCopyWith<GenerateImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateImageResponseCopyWith<$Res> {
  factory $GenerateImageResponseCopyWith(GenerateImageResponse value,
          $Res Function(GenerateImageResponse) then) =
      _$GenerateImageResponseCopyWithImpl<$Res, GenerateImageResponse>;
  @useResult
  $Res call({List<GenerateImageData?>? data});
}

/// @nodoc
class _$GenerateImageResponseCopyWithImpl<$Res,
        $Val extends GenerateImageResponse>
    implements $GenerateImageResponseCopyWith<$Res> {
  _$GenerateImageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GenerateImageData?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateImageResponseImplCopyWith<$Res>
    implements $GenerateImageResponseCopyWith<$Res> {
  factory _$$GenerateImageResponseImplCopyWith(
          _$GenerateImageResponseImpl value,
          $Res Function(_$GenerateImageResponseImpl) then) =
      __$$GenerateImageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GenerateImageData?>? data});
}

/// @nodoc
class __$$GenerateImageResponseImplCopyWithImpl<$Res>
    extends _$GenerateImageResponseCopyWithImpl<$Res,
        _$GenerateImageResponseImpl>
    implements _$$GenerateImageResponseImplCopyWith<$Res> {
  __$$GenerateImageResponseImplCopyWithImpl(_$GenerateImageResponseImpl _value,
      $Res Function(_$GenerateImageResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$GenerateImageResponseImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<GenerateImageData?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateImageResponseImpl implements _GenerateImageResponse {
  const _$GenerateImageResponseImpl({final List<GenerateImageData?>? data})
      : _data = data;

  factory _$GenerateImageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateImageResponseImplFromJson(json);

  final List<GenerateImageData?>? _data;
  @override
  List<GenerateImageData?>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GenerateImageResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateImageResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateImageResponseImplCopyWith<_$GenerateImageResponseImpl>
      get copyWith => __$$GenerateImageResponseImplCopyWithImpl<
          _$GenerateImageResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateImageResponseImplToJson(
      this,
    );
  }
}

abstract class _GenerateImageResponse implements GenerateImageResponse {
  const factory _GenerateImageResponse({final List<GenerateImageData?>? data}) =
      _$GenerateImageResponseImpl;

  factory _GenerateImageResponse.fromJson(Map<String, dynamic> json) =
      _$GenerateImageResponseImpl.fromJson;

  @override
  List<GenerateImageData?>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GenerateImageResponseImplCopyWith<_$GenerateImageResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
