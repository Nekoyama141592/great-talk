// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_text_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenerateTextRequest _$GenerateTextRequestFromJson(Map<String, dynamic> json) {
  return _GenerateTextRequest.fromJson(json);
}

/// @nodoc
mixin _$GenerateTextRequest {
  String get model => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get messages => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get tools => throw _privateConstructorUsedError;
  Map<String, dynamic>? get tool_choice => throw _privateConstructorUsedError;

  /// Serializes this GenerateTextRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateTextRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateTextRequestCopyWith<GenerateTextRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateTextRequestCopyWith<$Res> {
  factory $GenerateTextRequestCopyWith(
          GenerateTextRequest value, $Res Function(GenerateTextRequest) then) =
      _$GenerateTextRequestCopyWithImpl<$Res, GenerateTextRequest>;
  @useResult
  $Res call(
      {String model,
      List<Map<String, dynamic>> messages,
      List<Map<String, dynamic>>? tools,
      Map<String, dynamic>? tool_choice});
}

/// @nodoc
class _$GenerateTextRequestCopyWithImpl<$Res, $Val extends GenerateTextRequest>
    implements $GenerateTextRequestCopyWith<$Res> {
  _$GenerateTextRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateTextRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? tools = freezed,
    Object? tool_choice = freezed,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      tools: freezed == tools
          ? _value.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      tool_choice: freezed == tool_choice
          ? _value.tool_choice
          : tool_choice // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateTextRequestImplCopyWith<$Res>
    implements $GenerateTextRequestCopyWith<$Res> {
  factory _$$GenerateTextRequestImplCopyWith(_$GenerateTextRequestImpl value,
          $Res Function(_$GenerateTextRequestImpl) then) =
      __$$GenerateTextRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      List<Map<String, dynamic>> messages,
      List<Map<String, dynamic>>? tools,
      Map<String, dynamic>? tool_choice});
}

/// @nodoc
class __$$GenerateTextRequestImplCopyWithImpl<$Res>
    extends _$GenerateTextRequestCopyWithImpl<$Res, _$GenerateTextRequestImpl>
    implements _$$GenerateTextRequestImplCopyWith<$Res> {
  __$$GenerateTextRequestImplCopyWithImpl(_$GenerateTextRequestImpl _value,
      $Res Function(_$GenerateTextRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerateTextRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? tools = freezed,
    Object? tool_choice = freezed,
  }) {
    return _then(_$GenerateTextRequestImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      tools: freezed == tools
          ? _value._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      tool_choice: freezed == tool_choice
          ? _value._tool_choice
          : tool_choice // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateTextRequestImpl implements _GenerateTextRequest {
  const _$GenerateTextRequestImpl(
      {required this.model,
      required final List<Map<String, dynamic>> messages,
      final List<Map<String, dynamic>>? tools,
      final Map<String, dynamic>? tool_choice})
      : _messages = messages,
        _tools = tools,
        _tool_choice = tool_choice;

  factory _$GenerateTextRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateTextRequestImplFromJson(json);

  @override
  final String model;
  final List<Map<String, dynamic>> _messages;
  @override
  List<Map<String, dynamic>> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<Map<String, dynamic>>? _tools;
  @override
  List<Map<String, dynamic>>? get tools {
    final value = _tools;
    if (value == null) return null;
    if (_tools is EqualUnmodifiableListView) return _tools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<String, dynamic>? _tool_choice;
  @override
  Map<String, dynamic>? get tool_choice {
    final value = _tool_choice;
    if (value == null) return null;
    if (_tool_choice is EqualUnmodifiableMapView) return _tool_choice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'GenerateTextRequest(model: $model, messages: $messages, tools: $tools, tool_choice: $tool_choice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateTextRequestImpl &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality().equals(other._tools, _tools) &&
            const DeepCollectionEquality()
                .equals(other._tool_choice, _tool_choice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      model,
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_tools),
      const DeepCollectionEquality().hash(_tool_choice));

  /// Create a copy of GenerateTextRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateTextRequestImplCopyWith<_$GenerateTextRequestImpl> get copyWith =>
      __$$GenerateTextRequestImplCopyWithImpl<_$GenerateTextRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateTextRequestImplToJson(
      this,
    );
  }
}

abstract class _GenerateTextRequest implements GenerateTextRequest {
  const factory _GenerateTextRequest(
      {required final String model,
      required final List<Map<String, dynamic>> messages,
      final List<Map<String, dynamic>>? tools,
      final Map<String, dynamic>? tool_choice}) = _$GenerateTextRequestImpl;

  factory _GenerateTextRequest.fromJson(Map<String, dynamic> json) =
      _$GenerateTextRequestImpl.fromJson;

  @override
  String get model;
  @override
  List<Map<String, dynamic>> get messages;
  @override
  List<Map<String, dynamic>>? get tools;
  @override
  Map<String, dynamic>? get tool_choice;

  /// Create a copy of GenerateTextRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateTextRequestImplCopyWith<_$GenerateTextRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
