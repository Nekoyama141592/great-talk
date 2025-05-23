// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_text_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GenerateTextRequest {
  String get model;
  List<Map<String, dynamic>> get messages;
  List<Map<String, dynamic>>? get tools;
  Map<String, dynamic>? get tool_choice;

  /// Create a copy of GenerateTextRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GenerateTextRequestCopyWith<GenerateTextRequest> get copyWith =>
      _$GenerateTextRequestCopyWithImpl<GenerateTextRequest>(
          this as GenerateTextRequest, _$identity);

  /// Serializes this GenerateTextRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GenerateTextRequest &&
            (identical(other.model, model) || other.model == model) &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality().equals(other.tools, tools) &&
            const DeepCollectionEquality()
                .equals(other.tool_choice, tool_choice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      model,
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(tools),
      const DeepCollectionEquality().hash(tool_choice));

  @override
  String toString() {
    return 'GenerateTextRequest(model: $model, messages: $messages, tools: $tools, tool_choice: $tool_choice)';
  }
}

/// @nodoc
abstract mixin class $GenerateTextRequestCopyWith<$Res> {
  factory $GenerateTextRequestCopyWith(
          GenerateTextRequest value, $Res Function(GenerateTextRequest) _then) =
      _$GenerateTextRequestCopyWithImpl;
  @useResult
  $Res call(
      {String model,
      List<Map<String, dynamic>> messages,
      List<Map<String, dynamic>>? tools,
      Map<String, dynamic>? tool_choice});
}

/// @nodoc
class _$GenerateTextRequestCopyWithImpl<$Res>
    implements $GenerateTextRequestCopyWith<$Res> {
  _$GenerateTextRequestCopyWithImpl(this._self, this._then);

  final GenerateTextRequest _self;
  final $Res Function(GenerateTextRequest) _then;

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
    return _then(_self.copyWith(
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      tools: freezed == tools
          ? _self.tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      tool_choice: freezed == tool_choice
          ? _self.tool_choice
          : tool_choice // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GenerateTextRequest implements GenerateTextRequest {
  const _GenerateTextRequest(
      {required this.model,
      required final List<Map<String, dynamic>> messages,
      final List<Map<String, dynamic>>? tools,
      final Map<String, dynamic>? tool_choice})
      : _messages = messages,
        _tools = tools,
        _tool_choice = tool_choice;
  factory _GenerateTextRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateTextRequestFromJson(json);

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

  /// Create a copy of GenerateTextRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GenerateTextRequestCopyWith<_GenerateTextRequest> get copyWith =>
      __$GenerateTextRequestCopyWithImpl<_GenerateTextRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GenerateTextRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenerateTextRequest &&
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

  @override
  String toString() {
    return 'GenerateTextRequest(model: $model, messages: $messages, tools: $tools, tool_choice: $tool_choice)';
  }
}

/// @nodoc
abstract mixin class _$GenerateTextRequestCopyWith<$Res>
    implements $GenerateTextRequestCopyWith<$Res> {
  factory _$GenerateTextRequestCopyWith(_GenerateTextRequest value,
          $Res Function(_GenerateTextRequest) _then) =
      __$GenerateTextRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String model,
      List<Map<String, dynamic>> messages,
      List<Map<String, dynamic>>? tools,
      Map<String, dynamic>? tool_choice});
}

/// @nodoc
class __$GenerateTextRequestCopyWithImpl<$Res>
    implements _$GenerateTextRequestCopyWith<$Res> {
  __$GenerateTextRequestCopyWithImpl(this._self, this._then);

  final _GenerateTextRequest _self;
  final $Res Function(_GenerateTextRequest) _then;

  /// Create a copy of GenerateTextRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? model = null,
    Object? messages = null,
    Object? tools = freezed,
    Object? tool_choice = freezed,
  }) {
    return _then(_GenerateTextRequest(
      model: null == model
          ? _self.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _self._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      tools: freezed == tools
          ? _self._tools
          : tools // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      tool_choice: freezed == tool_choice
          ? _self._tool_choice
          : tool_choice // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
