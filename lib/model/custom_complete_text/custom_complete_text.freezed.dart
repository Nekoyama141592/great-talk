// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_complete_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomCompleteText _$CustomCompleteTextFromJson(Map<String, dynamic> json) {
  return _CustomCompleteText.fromJson(json);
}

/// @nodoc
mixin _$CustomCompleteText {
  String get systemPrompt => throw _privateConstructorUsedError;
  double? get temperature => throw _privateConstructorUsedError;
  double? get topP => throw _privateConstructorUsedError;
  double? get presencePenalty => throw _privateConstructorUsedError;
  double? get frequencyPenalty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomCompleteTextCopyWith<CustomCompleteText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomCompleteTextCopyWith<$Res> {
  factory $CustomCompleteTextCopyWith(
          CustomCompleteText value, $Res Function(CustomCompleteText) then) =
      _$CustomCompleteTextCopyWithImpl<$Res, CustomCompleteText>;
  @useResult
  $Res call(
      {String systemPrompt,
      double? temperature,
      double? topP,
      double? presencePenalty,
      double? frequencyPenalty});
}

/// @nodoc
class _$CustomCompleteTextCopyWithImpl<$Res, $Val extends CustomCompleteText>
    implements $CustomCompleteTextCopyWith<$Res> {
  _$CustomCompleteTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? systemPrompt = null,
    Object? temperature = freezed,
    Object? topP = freezed,
    Object? presencePenalty = freezed,
    Object? frequencyPenalty = freezed,
  }) {
    return _then(_value.copyWith(
      systemPrompt: null == systemPrompt
          ? _value.systemPrompt
          : systemPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      presencePenalty: freezed == presencePenalty
          ? _value.presencePenalty
          : presencePenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      frequencyPenalty: freezed == frequencyPenalty
          ? _value.frequencyPenalty
          : frequencyPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomCompleteTextImplCopyWith<$Res>
    implements $CustomCompleteTextCopyWith<$Res> {
  factory _$$CustomCompleteTextImplCopyWith(_$CustomCompleteTextImpl value,
          $Res Function(_$CustomCompleteTextImpl) then) =
      __$$CustomCompleteTextImplCopyWithImpl<$Res>;
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
class __$$CustomCompleteTextImplCopyWithImpl<$Res>
    extends _$CustomCompleteTextCopyWithImpl<$Res, _$CustomCompleteTextImpl>
    implements _$$CustomCompleteTextImplCopyWith<$Res> {
  __$$CustomCompleteTextImplCopyWithImpl(_$CustomCompleteTextImpl _value,
      $Res Function(_$CustomCompleteTextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? systemPrompt = null,
    Object? temperature = freezed,
    Object? topP = freezed,
    Object? presencePenalty = freezed,
    Object? frequencyPenalty = freezed,
  }) {
    return _then(_$CustomCompleteTextImpl(
      systemPrompt: null == systemPrompt
          ? _value.systemPrompt
          : systemPrompt // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double?,
      topP: freezed == topP
          ? _value.topP
          : topP // ignore: cast_nullable_to_non_nullable
              as double?,
      presencePenalty: freezed == presencePenalty
          ? _value.presencePenalty
          : presencePenalty // ignore: cast_nullable_to_non_nullable
              as double?,
      frequencyPenalty: freezed == frequencyPenalty
          ? _value.frequencyPenalty
          : frequencyPenalty // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomCompleteTextImpl extends _CustomCompleteText {
  const _$CustomCompleteTextImpl(
      {required this.systemPrompt,
      this.temperature,
      this.topP,
      this.presencePenalty,
      this.frequencyPenalty})
      : super._();

  factory _$CustomCompleteTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomCompleteTextImplFromJson(json);

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

  @override
  String toString() {
    return 'CustomCompleteText(systemPrompt: $systemPrompt, temperature: $temperature, topP: $topP, presencePenalty: $presencePenalty, frequencyPenalty: $frequencyPenalty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomCompleteTextImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, systemPrompt, temperature, topP,
      presencePenalty, frequencyPenalty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomCompleteTextImplCopyWith<_$CustomCompleteTextImpl> get copyWith =>
      __$$CustomCompleteTextImplCopyWithImpl<_$CustomCompleteTextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomCompleteTextImplToJson(
      this,
    );
  }
}

abstract class _CustomCompleteText extends CustomCompleteText {
  const factory _CustomCompleteText(
      {required final String systemPrompt,
      final double? temperature,
      final double? topP,
      final double? presencePenalty,
      final double? frequencyPenalty}) = _$CustomCompleteTextImpl;
  const _CustomCompleteText._() : super._();

  factory _CustomCompleteText.fromJson(Map<String, dynamic> json) =
      _$CustomCompleteTextImpl.fromJson;

  @override
  String get systemPrompt;
  @override
  double? get temperature;
  @override
  double? get topP;
  @override
  double? get presencePenalty;
  @override
  double? get frequencyPenalty;
  @override
  @JsonKey(ignore: true)
  _$$CustomCompleteTextImplCopyWith<_$CustomCompleteTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
