// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_complete_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomCompleteText {
  String get systemPrompt;
  double? get temperature;
  double? get topP;
  double? get presencePenalty;
  double? get frequencyPenalty;

  /// Create a copy of CustomCompleteText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomCompleteTextCopyWith<CustomCompleteText> get copyWith =>
      _$CustomCompleteTextCopyWithImpl<CustomCompleteText>(
          this as CustomCompleteText, _$identity);

  /// Serializes this CustomCompleteText to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomCompleteText &&
            (identical(other.systemPrompt, systemPrompt) ||
                other.systemPrompt == systemPrompt) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.presencePenalty, presencePenalty) ||
                other.presencePenalty == presencePenalty) &&
            (identical(other.frequencyPenalty, frequencyPenalty) ||
                other.frequencyPenalty == frequencyPenalty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, systemPrompt, temperature, topP,
      presencePenalty, frequencyPenalty);

  @override
  String toString() {
    return 'CustomCompleteText(systemPrompt: $systemPrompt, temperature: $temperature, topP: $topP, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty)';
  }
}

/// @nodoc
abstract mixin class $CustomCompleteTextCopyWith<$Res> {
  factory $CustomCompleteTextCopyWith(
          CustomCompleteText value, $Res Function(CustomCompleteText) _then) =
      _$CustomCompleteTextCopyWithImpl;
  @useResult
  $Res call(
      {String systemPrompt,
      double? temperature,
      double? topP,
      double? presencePenalty,
      double? frequencyPenalty});
}

/// @nodoc
class _$CustomCompleteTextCopyWithImpl<$Res>
    implements $CustomCompleteTextCopyWith<$Res> {
  _$CustomCompleteTextCopyWithImpl(this._self, this._then);

  final CustomCompleteText _self;
  final $Res Function(CustomCompleteText) _then;

  /// Create a copy of CustomCompleteText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? systemPrompt = null,
    Object? temperature = freezed,
    Object? topP = freezed,
    Object? presencePenalty = freezed,
    Object? frequencyPenalty = freezed,
  }) {
    return _then(_self.copyWith(
      systemPrompt: null == systemPrompt
          ? _self.systemPrompt
          : systemPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      presencePenalty: freezed == presencePenalty
          ? _self.presencePenalty
          : presencePenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      frequencyPenalty: freezed == frequencyPenalty
          ? _self.frequencyPenalty
          : frequencyPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CustomCompleteText extends CustomCompleteText {
  const _CustomCompleteText(
      {required this.systemPrompt,
      this.temperature,
      this.topP,
      this.presencePenalty,
      this.frequencyPenalty})
      : super._();
  factory _CustomCompleteText.fromJson(Map<String, dynamic> json) =>
      _$CustomCompleteTextFromJson(json);

  @override
  final String systemPrompt;
  @override
  final double? temperature;
  @override
  final double? topP;
  @override
  final double? presencePenalty;
  @override
  final double? frequencyPenalty;

  /// Create a copy of CustomCompleteText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomCompleteTextCopyWith<_CustomCompleteText> get copyWith =>
      __$CustomCompleteTextCopyWithImpl<_CustomCompleteText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomCompleteTextToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomCompleteText &&
            (identical(other.systemPrompt, systemPrompt) ||
                other.systemPrompt == systemPrompt) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.topP, topP) || other.topP == topP) &&
            (identical(other.presencePenalty, presencePenalty) ||
                other.presencePenalty == presencePenalty) &&
            (identical(other.frequencyPenalty, frequencyPenalty) ||
                other.frequencyPenalty == frequencyPenalty));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, systemPrompt, temperature, topP,
      presencePenalty, frequencyPenalty);

  @override
  String toString() {
    return 'CustomCompleteText(systemPrompt: $systemPrompt, temperature: $temperature, topP: $topP, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty)';
  }
}

/// @nodoc
abstract mixin class _$CustomCompleteTextCopyWith<$Res>
    implements $CustomCompleteTextCopyWith<$Res> {
  factory _$CustomCompleteTextCopyWith(
          _CustomCompleteText value, $Res Function(_CustomCompleteText) _then) =
      __$CustomCompleteTextCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String systemPrompt,
      double? temperature,
      double? topP,
      double? presencePenalty,
      double? frequencyPenalty});
}

/// @nodoc
class __$CustomCompleteTextCopyWithImpl<$Res>
    implements _$CustomCompleteTextCopyWith<$Res> {
  __$CustomCompleteTextCopyWithImpl(this._self, this._then);

  final _CustomCompleteText _self;
  final $Res Function(_CustomCompleteText) _then;

  /// Create a copy of CustomCompleteText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? systemPrompt = null,
    Object? temperature = freezed,
    Object? topP = freezed,
    Object? presencePenalty = freezed,
    Object? frequencyPenalty = freezed,
  }) {
    return _then(_CustomCompleteText(
      systemPrompt: null == systemPrompt
          ? _self.systemPrompt
          : systemPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: freezed == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _self.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      presencePenalty: freezed == presencePenalty
          ? _self.presencePenalty
          : presencePenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      frequencyPenalty: freezed == frequencyPenalty
          ? _self.frequencyPenalty
          : frequencyPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
