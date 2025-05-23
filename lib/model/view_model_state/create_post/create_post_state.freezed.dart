// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_post_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePostState {
// タイトル
  String get title; // システムプロンプト
  String get systemPrompt; // 説明
  String get description; // Temperature
  double get temperature; // Top P
  double get topP; // Presence Penalty
  double get presencePenalty; // Frequency Penalty
  double get frequencyPenalty;
  String? get pickedImage;

  /// Create a copy of CreatePostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreatePostStateCopyWith<CreatePostState> get copyWith =>
      _$CreatePostStateCopyWithImpl<CreatePostState>(
          this as CreatePostState, _$identity);

  /// Serializes this CreatePostState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreatePostState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.systemPrompt, systemPrompt) ||
                other.systemPrompt == systemPrompt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.presencePenalty, presencePenalty) ||
                other.presencePenalty == presencePenalty) &&
            (identical(other.frequencyPenalty, frequencyPenalty) ||
                other.frequencyPenalty == frequencyPenalty) &&
            (identical(other.pickedImage, pickedImage) ||
                other.pickedImage == pickedImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, systemPrompt, description,
      temperature, topP, presencePenalty, frequencyPenalty, pickedImage);

  @override
  String toString() {
    return 'CreatePostState(title: $title, systemPrompt: $systemPrompt, description: $description, temperature: $temperature, topP: $topP, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty, pickedImage: $pickedImage)';
  }
}

/// @nodoc
abstract mixin class $CreatePostStateCopyWith<$Res> {
  factory $CreatePostStateCopyWith(
          CreatePostState value, $Res Function(CreatePostState) _then) =
      _$CreatePostStateCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      String systemPrompt,
      String description,
      double temperature,
      double topP,
      double presencePenalty,
      double frequencyPenalty,
      String? pickedImage});
}

/// @nodoc
class _$CreatePostStateCopyWithImpl<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  _$CreatePostStateCopyWithImpl(this._self, this._then);

  final CreatePostState _self;
  final $Res Function(CreatePostState) _then;

  /// Create a copy of CreatePostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? systemPrompt = null,
    Object? description = null,
    Object? temperature = null,
    Object? topP = null,
    Object? presencePenalty = null,
    Object? frequencyPenalty = null,
    Object? pickedImage = freezed,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      systemPrompt: null == systemPrompt
          ? _self.systemPrompt
          : systemPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      topP: null == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double,
      presencePenalty: null == presencePenalty
          ? _self.presencePenalty
          : presencePenalty // ignore: cast_nullable_to_non_nullable
              as double,
      frequencyPenalty: null == frequencyPenalty
          ? _self.frequencyPenalty
          : frequencyPenalty // ignore: cast_nullable_to_non_nullable
              as double,
      pickedImage: freezed == pickedImage
          ? _self.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CreatePostState implements CreatePostState {
  const _CreatePostState(
      {this.title = '',
      this.systemPrompt = FormConsts.defaultSystemPrompt,
      this.description = '',
      this.temperature = FormConsts.defaultTemperature,
      this.topP = FormConsts.defaultTopP,
      this.presencePenalty = FormConsts.defaultPresencePenalty,
      this.frequencyPenalty = FormConsts.defaultFrequencyPenalty,
      this.pickedImage});
  factory _CreatePostState.fromJson(Map<String, dynamic> json) =>
      _$CreatePostStateFromJson(json);

// タイトル
  @override
  @JsonKey()
  final String title;
// システムプロンプト
  @override
  @JsonKey()
  final String systemPrompt;
// 説明
  @override
  @JsonKey()
  final String description;
// Temperature
  @override
  @JsonKey()
  final double temperature;
// Top P
  @override
  @JsonKey()
  final double topP;
// Presence Penalty
  @override
  @JsonKey()
  final double presencePenalty;
// Frequency Penalty
  @override
  @JsonKey()
  final double frequencyPenalty;
  @override
  final String? pickedImage;

  /// Create a copy of CreatePostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreatePostStateCopyWith<_CreatePostState> get copyWith =>
      __$CreatePostStateCopyWithImpl<_CreatePostState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreatePostStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreatePostState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.systemPrompt, systemPrompt) ||
                other.systemPrompt == systemPrompt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.presencePenalty, presencePenalty) ||
                other.presencePenalty == presencePenalty) &&
            (identical(other.frequencyPenalty, frequencyPenalty) ||
                other.frequencyPenalty == frequencyPenalty) &&
            (identical(other.pickedImage, pickedImage) ||
                other.pickedImage == pickedImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, systemPrompt, description,
      temperature, topP, presencePenalty, frequencyPenalty, pickedImage);

  @override
  String toString() {
    return 'CreatePostState(title: $title, systemPrompt: $systemPrompt, description: $description, temperature: $temperature, topP: $topP, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty, pickedImage: $pickedImage)';
  }
}

/// @nodoc
abstract mixin class _$CreatePostStateCopyWith<$Res>
    implements $CreatePostStateCopyWith<$Res> {
  factory _$CreatePostStateCopyWith(
          _CreatePostState value, $Res Function(_CreatePostState) _then) =
      __$CreatePostStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      String systemPrompt,
      String description,
      double temperature,
      double topP,
      double presencePenalty,
      double frequencyPenalty,
      String? pickedImage});
}

/// @nodoc
class __$CreatePostStateCopyWithImpl<$Res>
    implements _$CreatePostStateCopyWith<$Res> {
  __$CreatePostStateCopyWithImpl(this._self, this._then);

  final _CreatePostState _self;
  final $Res Function(_CreatePostState) _then;

  /// Create a copy of CreatePostState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? systemPrompt = null,
    Object? description = null,
    Object? temperature = null,
    Object? topP = null,
    Object? presencePenalty = null,
    Object? frequencyPenalty = null,
    Object? pickedImage = freezed,
  }) {
    return _then(_CreatePostState(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      systemPrompt: null == systemPrompt
          ? _self.systemPrompt
          : systemPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      topP: null == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double,
      presencePenalty: null == presencePenalty
          ? _self.presencePenalty
          : presencePenalty // ignore: cast_nullable_to_non_nullable
              as double,
      frequencyPenalty: null == frequencyPenalty
          ? _self.frequencyPenalty
          : frequencyPenalty // ignore: cast_nullable_to_non_nullable
              as double,
      pickedImage: freezed == pickedImage
          ? _self.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
