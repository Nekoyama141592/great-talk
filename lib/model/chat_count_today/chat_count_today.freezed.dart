// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_count_today.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatCountToday _$ChatCountTodayFromJson(Map<String, dynamic> json) {
  return _ChatCountToday.fromJson(json);
}

/// @nodoc
mixin _$ChatCountToday {
  int get basic => throw _privateConstructorUsedError;
  int get premium => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCountTodayCopyWith<ChatCountToday> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCountTodayCopyWith<$Res> {
  factory $ChatCountTodayCopyWith(
          ChatCountToday value, $Res Function(ChatCountToday) then) =
      _$ChatCountTodayCopyWithImpl<$Res, ChatCountToday>;
  @useResult
  $Res call({int basic, int premium});
}

/// @nodoc
class _$ChatCountTodayCopyWithImpl<$Res, $Val extends ChatCountToday>
    implements $ChatCountTodayCopyWith<$Res> {
  _$ChatCountTodayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basic = null,
    Object? premium = null,
  }) {
    return _then(_value.copyWith(
      basic: null == basic
          ? _value.basic
          : basic // ignore: cast_nullable_to_non_nullable
              as int,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatCountTodayImplCopyWith<$Res>
    implements $ChatCountTodayCopyWith<$Res> {
  factory _$$ChatCountTodayImplCopyWith(_$ChatCountTodayImpl value,
          $Res Function(_$ChatCountTodayImpl) then) =
      __$$ChatCountTodayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int basic, int premium});
}

/// @nodoc
class __$$ChatCountTodayImplCopyWithImpl<$Res>
    extends _$ChatCountTodayCopyWithImpl<$Res, _$ChatCountTodayImpl>
    implements _$$ChatCountTodayImplCopyWith<$Res> {
  __$$ChatCountTodayImplCopyWithImpl(
      _$ChatCountTodayImpl _value, $Res Function(_$ChatCountTodayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basic = null,
    Object? premium = null,
  }) {
    return _then(_$ChatCountTodayImpl(
      basic: null == basic
          ? _value.basic
          : basic // ignore: cast_nullable_to_non_nullable
              as int,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatCountTodayImpl extends _ChatCountToday {
  const _$ChatCountTodayImpl({this.basic = 0, this.premium = 0}) : super._();

  factory _$ChatCountTodayImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatCountTodayImplFromJson(json);

  @override
  @JsonKey()
  final int basic;
  @override
  @JsonKey()
  final int premium;

  @override
  String toString() {
    return 'ChatCountToday(basic: $basic, premium: $premium)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatCountTodayImpl &&
            (identical(other.basic, basic) || other.basic == basic) &&
            (identical(other.premium, premium) || other.premium == premium));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, basic, premium);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatCountTodayImplCopyWith<_$ChatCountTodayImpl> get copyWith =>
      __$$ChatCountTodayImplCopyWithImpl<_$ChatCountTodayImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatCountTodayImplToJson(
      this,
    );
  }
}

abstract class _ChatCountToday extends ChatCountToday {
  const factory _ChatCountToday({final int basic, final int premium}) =
      _$ChatCountTodayImpl;
  const _ChatCountToday._() : super._();

  factory _ChatCountToday.fromJson(Map<String, dynamic> json) =
      _$ChatCountTodayImpl.fromJson;

  @override
  int get basic;
  @override
  int get premium;
  @override
  @JsonKey(ignore: true)
  _$$ChatCountTodayImplCopyWith<_$ChatCountTodayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
