// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'moderation_label.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModerationLabel _$ModerationLabelFromJson(Map<String, dynamic> json) {
  return _ModerationLabel.fromJson(json);
}

/// @nodoc
mixin _$ModerationLabel {
  num get Confidence => throw _privateConstructorUsedError;
  String get Name => throw _privateConstructorUsedError;
  String get ParentName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModerationLabelCopyWith<ModerationLabel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModerationLabelCopyWith<$Res> {
  factory $ModerationLabelCopyWith(
          ModerationLabel value, $Res Function(ModerationLabel) then) =
      _$ModerationLabelCopyWithImpl<$Res, ModerationLabel>;
  @useResult
  $Res call({num Confidence, String Name, String ParentName});
}

/// @nodoc
class _$ModerationLabelCopyWithImpl<$Res, $Val extends ModerationLabel>
    implements $ModerationLabelCopyWith<$Res> {
  _$ModerationLabelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Confidence = null,
    Object? Name = null,
    Object? ParentName = null,
  }) {
    return _then(_value.copyWith(
      Confidence: null == Confidence
          ? _value.Confidence
          : Confidence // ignore: cast_nullable_to_non_nullable
              as num,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      ParentName: null == ParentName
          ? _value.ParentName
          : ParentName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ModerationLabelCopyWith<$Res>
    implements $ModerationLabelCopyWith<$Res> {
  factory _$$_ModerationLabelCopyWith(
          _$_ModerationLabel value, $Res Function(_$_ModerationLabel) then) =
      __$$_ModerationLabelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num Confidence, String Name, String ParentName});
}

/// @nodoc
class __$$_ModerationLabelCopyWithImpl<$Res>
    extends _$ModerationLabelCopyWithImpl<$Res, _$_ModerationLabel>
    implements _$$_ModerationLabelCopyWith<$Res> {
  __$$_ModerationLabelCopyWithImpl(
      _$_ModerationLabel _value, $Res Function(_$_ModerationLabel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? Confidence = null,
    Object? Name = null,
    Object? ParentName = null,
  }) {
    return _then(_$_ModerationLabel(
      Confidence: null == Confidence
          ? _value.Confidence
          : Confidence // ignore: cast_nullable_to_non_nullable
              as num,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      ParentName: null == ParentName
          ? _value.ParentName
          : ParentName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModerationLabel implements _ModerationLabel {
  const _$_ModerationLabel(
      {required this.Confidence, required this.Name, required this.ParentName});

  factory _$_ModerationLabel.fromJson(Map<String, dynamic> json) =>
      _$$_ModerationLabelFromJson(json);

  @override
  final num Confidence;
  @override
  final String Name;
  @override
  final String ParentName;

  @override
  String toString() {
    return 'ModerationLabel(Confidence: $Confidence, Name: $Name, ParentName: $ParentName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModerationLabel &&
            (identical(other.Confidence, Confidence) ||
                other.Confidence == Confidence) &&
            (identical(other.Name, Name) || other.Name == Name) &&
            (identical(other.ParentName, ParentName) ||
                other.ParentName == ParentName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, Confidence, Name, ParentName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModerationLabelCopyWith<_$_ModerationLabel> get copyWith =>
      __$$_ModerationLabelCopyWithImpl<_$_ModerationLabel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModerationLabelToJson(
      this,
    );
  }
}

abstract class _ModerationLabel implements ModerationLabel {
  const factory _ModerationLabel(
      {required final num Confidence,
      required final String Name,
      required final String ParentName}) = _$_ModerationLabel;

  factory _ModerationLabel.fromJson(Map<String, dynamic> json) =
      _$_ModerationLabel.fromJson;

  @override
  num get Confidence;
  @override
  String get Name;
  @override
  String get ParentName;
  @override
  @JsonKey(ignore: true)
  _$$_ModerationLabelCopyWith<_$_ModerationLabel> get copyWith =>
      throw _privateConstructorUsedError;
}
