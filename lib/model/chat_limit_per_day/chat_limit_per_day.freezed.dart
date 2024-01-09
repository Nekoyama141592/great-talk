// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_limit_per_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatLimitPerDay _$ChatLimitPerDayFromJson(Map<String, dynamic> json) {
  return _ChatLimitPerDay.fromJson(json);
}

/// @nodoc
mixin _$ChatLimitPerDay {
  int get basic => throw _privateConstructorUsedError;
  int get free => throw _privateConstructorUsedError;
  int get premium => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatLimitPerDayCopyWith<ChatLimitPerDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatLimitPerDayCopyWith<$Res> {
  factory $ChatLimitPerDayCopyWith(
          ChatLimitPerDay value, $Res Function(ChatLimitPerDay) then) =
      _$ChatLimitPerDayCopyWithImpl<$Res, ChatLimitPerDay>;
  @useResult
  $Res call({int basic, int free, int premium});
}

/// @nodoc
class _$ChatLimitPerDayCopyWithImpl<$Res, $Val extends ChatLimitPerDay>
    implements $ChatLimitPerDayCopyWith<$Res> {
  _$ChatLimitPerDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basic = null,
    Object? free = null,
    Object? premium = null,
  }) {
    return _then(_value.copyWith(
      basic: null == basic
          ? _value.basic
          : basic // ignore: cast_nullable_to_non_nullable
              as int,
      free: null == free
          ? _value.free
          : free // ignore: cast_nullable_to_non_nullable
              as int,
      premium: null == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatLimitPerDayImplCopyWith<$Res>
    implements $ChatLimitPerDayCopyWith<$Res> {
  factory _$$ChatLimitPerDayImplCopyWith(_$ChatLimitPerDayImpl value,
          $Res Function(_$ChatLimitPerDayImpl) then) =
      __$$ChatLimitPerDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int basic, int free, int premium});
}

/// @nodoc
class __$$ChatLimitPerDayImplCopyWithImpl<$Res>
    extends _$ChatLimitPerDayCopyWithImpl<$Res, _$ChatLimitPerDayImpl>
    implements _$$ChatLimitPerDayImplCopyWith<$Res> {
  __$$ChatLimitPerDayImplCopyWithImpl(
      _$ChatLimitPerDayImpl _value, $Res Function(_$ChatLimitPerDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basic = null,
    Object? free = null,
    Object? premium = null,
  }) {
    return _then(_$ChatLimitPerDayImpl(
      basic: null == basic
          ? _value.basic
          : basic // ignore: cast_nullable_to_non_nullable
              as int,
      free: null == free
          ? _value.free
          : free // ignore: cast_nullable_to_non_nullable
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
class _$ChatLimitPerDayImpl extends _ChatLimitPerDay {
  const _$ChatLimitPerDayImpl(
      {this.basic = RemoteConfigConstants.basicLimitPerDay,
      this.free = RemoteConfigConstants.freeLimitPerDay,
      this.premium = RemoteConfigConstants.premiumLimitPerDay})
      : super._();

  factory _$ChatLimitPerDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatLimitPerDayImplFromJson(json);

  @override
  @JsonKey()
  final int basic;
  @override
  @JsonKey()
  final int free;
  @override
  @JsonKey()
  final int premium;

  @override
  String toString() {
    return 'ChatLimitPerDay(basic: $basic, free: $free, premium: $premium)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatLimitPerDayImpl &&
            (identical(other.basic, basic) || other.basic == basic) &&
            (identical(other.free, free) || other.free == free) &&
            (identical(other.premium, premium) || other.premium == premium));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, basic, free, premium);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatLimitPerDayImplCopyWith<_$ChatLimitPerDayImpl> get copyWith =>
      __$$ChatLimitPerDayImplCopyWithImpl<_$ChatLimitPerDayImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatLimitPerDayImplToJson(
      this,
    );
  }
}

abstract class _ChatLimitPerDay extends ChatLimitPerDay {
  const factory _ChatLimitPerDay(
      {final int basic,
      final int free,
      final int premium}) = _$ChatLimitPerDayImpl;
  const _ChatLimitPerDay._() : super._();

  factory _ChatLimitPerDay.fromJson(Map<String, dynamic> json) =
      _$ChatLimitPerDayImpl.fromJson;

  @override
  int get basic;
  @override
  int get free;
  @override
  int get premium;
  @override
  @JsonKey(ignore: true)
  _$$ChatLimitPerDayImplCopyWith<_$ChatLimitPerDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
