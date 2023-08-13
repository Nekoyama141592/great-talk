// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detected_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetectedText _$DetectedTextFromJson(Map<String, dynamic> json) {
  return _DetectedText.fromJson(json);
}

/// @nodoc
mixin _$DetectedText {
  String get languageCode => throw _privateConstructorUsedError;
  int get negativeScore => throw _privateConstructorUsedError;
  int get positiveScore => throw _privateConstructorUsedError;
  String get sentiment => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetectedTextCopyWith<DetectedText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectedTextCopyWith<$Res> {
  factory $DetectedTextCopyWith(
          DetectedText value, $Res Function(DetectedText) then) =
      _$DetectedTextCopyWithImpl<$Res, DetectedText>;
  @useResult
  $Res call(
      {String languageCode,
      int negativeScore,
      int positiveScore,
      String sentiment,
      String value});
}

/// @nodoc
class _$DetectedTextCopyWithImpl<$Res, $Val extends DetectedText>
    implements $DetectedTextCopyWith<$Res> {
  _$DetectedTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? negativeScore = null,
    Object? positiveScore = null,
    Object? sentiment = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      negativeScore: null == negativeScore
          ? _value.negativeScore
          : negativeScore // ignore: cast_nullable_to_non_nullable
              as int,
      positiveScore: null == positiveScore
          ? _value.positiveScore
          : positiveScore // ignore: cast_nullable_to_non_nullable
              as int,
      sentiment: null == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetectedTextCopyWith<$Res>
    implements $DetectedTextCopyWith<$Res> {
  factory _$$_DetectedTextCopyWith(
          _$_DetectedText value, $Res Function(_$_DetectedText) then) =
      __$$_DetectedTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String languageCode,
      int negativeScore,
      int positiveScore,
      String sentiment,
      String value});
}

/// @nodoc
class __$$_DetectedTextCopyWithImpl<$Res>
    extends _$DetectedTextCopyWithImpl<$Res, _$_DetectedText>
    implements _$$_DetectedTextCopyWith<$Res> {
  __$$_DetectedTextCopyWithImpl(
      _$_DetectedText _value, $Res Function(_$_DetectedText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? negativeScore = null,
    Object? positiveScore = null,
    Object? sentiment = null,
    Object? value = null,
  }) {
    return _then(_$_DetectedText(
      languageCode: null == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      negativeScore: null == negativeScore
          ? _value.negativeScore
          : negativeScore // ignore: cast_nullable_to_non_nullable
              as int,
      positiveScore: null == positiveScore
          ? _value.positiveScore
          : positiveScore // ignore: cast_nullable_to_non_nullable
              as int,
      sentiment: null == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DetectedText implements _DetectedText {
  const _$_DetectedText(
      {required this.languageCode,
      required this.negativeScore,
      required this.positiveScore,
      required this.sentiment,
      required this.value});

  factory _$_DetectedText.fromJson(Map<String, dynamic> json) =>
      _$$_DetectedTextFromJson(json);

  @override
  final String languageCode;
  @override
  final int negativeScore;
  @override
  final int positiveScore;
  @override
  final String sentiment;
  @override
  final String value;

  @override
  String toString() {
    return 'DetectedText(languageCode: $languageCode, negativeScore: $negativeScore, positiveScore: $positiveScore, sentiment: $sentiment, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetectedText &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.negativeScore, negativeScore) ||
                other.negativeScore == negativeScore) &&
            (identical(other.positiveScore, positiveScore) ||
                other.positiveScore == positiveScore) &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, languageCode, negativeScore,
      positiveScore, sentiment, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetectedTextCopyWith<_$_DetectedText> get copyWith =>
      __$$_DetectedTextCopyWithImpl<_$_DetectedText>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetectedTextToJson(
      this,
    );
  }
}

abstract class _DetectedText implements DetectedText {
  const factory _DetectedText(
      {required final String languageCode,
      required final int negativeScore,
      required final int positiveScore,
      required final String sentiment,
      required final String value}) = _$_DetectedText;

  factory _DetectedText.fromJson(Map<String, dynamic> json) =
      _$_DetectedText.fromJson;

  @override
  String get languageCode;
  @override
  int get negativeScore;
  @override
  int get positiveScore;
  @override
  String get sentiment;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_DetectedTextCopyWith<_$_DetectedText> get copyWith =>
      throw _privateConstructorUsedError;
}
