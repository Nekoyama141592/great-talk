// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_count_today.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatCountToday {
  int get basic;
  int get premium;

  /// Create a copy of ChatCountToday
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatCountTodayCopyWith<ChatCountToday> get copyWith =>
      _$ChatCountTodayCopyWithImpl<ChatCountToday>(
          this as ChatCountToday, _$identity);

  /// Serializes this ChatCountToday to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatCountToday &&
            (identical(other.basic, basic) || other.basic == basic) &&
            (identical(other.premium, premium) || other.premium == premium));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, basic, premium);

  @override
  String toString() {
    return 'ChatCountToday(basic: $basic, premium: $premium)';
  }
}

/// @nodoc
abstract mixin class $ChatCountTodayCopyWith<$Res> {
  factory $ChatCountTodayCopyWith(
          ChatCountToday value, $Res Function(ChatCountToday) _then) =
      _$ChatCountTodayCopyWithImpl;
  @useResult
  $Res call({int basic, int premium});
}

/// @nodoc
class _$ChatCountTodayCopyWithImpl<$Res>
    implements $ChatCountTodayCopyWith<$Res> {
  _$ChatCountTodayCopyWithImpl(this._self, this._then);

  final ChatCountToday _self;
  final $Res Function(ChatCountToday) _then;

  /// Create a copy of ChatCountToday
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basic = null,
    Object? premium = null,
  }) {
    return _then(_self.copyWith(
      basic: null == basic
          ? _self.basic
          : basic // ignore: cast_nullable_to_non_nullable
              as int,
      premium: null == premium
          ? _self.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatCountToday extends ChatCountToday {
  const _ChatCountToday({this.basic = 0, this.premium = 0}) : super._();
  factory _ChatCountToday.fromJson(Map<String, dynamic> json) =>
      _$ChatCountTodayFromJson(json);

  @override
  @JsonKey()
  final int basic;
  @override
  @JsonKey()
  final int premium;

  /// Create a copy of ChatCountToday
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatCountTodayCopyWith<_ChatCountToday> get copyWith =>
      __$ChatCountTodayCopyWithImpl<_ChatCountToday>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatCountTodayToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatCountToday &&
            (identical(other.basic, basic) || other.basic == basic) &&
            (identical(other.premium, premium) || other.premium == premium));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, basic, premium);

  @override
  String toString() {
    return 'ChatCountToday(basic: $basic, premium: $premium)';
  }
}

/// @nodoc
abstract mixin class _$ChatCountTodayCopyWith<$Res>
    implements $ChatCountTodayCopyWith<$Res> {
  factory _$ChatCountTodayCopyWith(
          _ChatCountToday value, $Res Function(_ChatCountToday) _then) =
      __$ChatCountTodayCopyWithImpl;
  @override
  @useResult
  $Res call({int basic, int premium});
}

/// @nodoc
class __$ChatCountTodayCopyWithImpl<$Res>
    implements _$ChatCountTodayCopyWith<$Res> {
  __$ChatCountTodayCopyWithImpl(this._self, this._then);

  final _ChatCountToday _self;
  final $Res Function(_ChatCountToday) _then;

  /// Create a copy of ChatCountToday
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? basic = null,
    Object? premium = null,
  }) {
    return _then(_ChatCountToday(
      basic: null == basic
          ? _self.basic
          : basic // ignore: cast_nullable_to_non_nullable
              as int,
      premium: null == premium
          ? _self.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
