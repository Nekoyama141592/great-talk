// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_limit_per_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatLimitPerDay {

 int get basic; int get free; int get premium;
/// Create a copy of ChatLimitPerDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatLimitPerDayCopyWith<ChatLimitPerDay> get copyWith => _$ChatLimitPerDayCopyWithImpl<ChatLimitPerDay>(this as ChatLimitPerDay, _$identity);

  /// Serializes this ChatLimitPerDay to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatLimitPerDay&&(identical(other.basic, basic) || other.basic == basic)&&(identical(other.free, free) || other.free == free)&&(identical(other.premium, premium) || other.premium == premium));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,basic,free,premium);

@override
String toString() {
  return 'ChatLimitPerDay(basic: $basic, free: $free, premium: $premium)';
}


}

/// @nodoc
abstract mixin class $ChatLimitPerDayCopyWith<$Res>  {
  factory $ChatLimitPerDayCopyWith(ChatLimitPerDay value, $Res Function(ChatLimitPerDay) _then) = _$ChatLimitPerDayCopyWithImpl;
@useResult
$Res call({
 int basic, int free, int premium
});




}
/// @nodoc
class _$ChatLimitPerDayCopyWithImpl<$Res>
    implements $ChatLimitPerDayCopyWith<$Res> {
  _$ChatLimitPerDayCopyWithImpl(this._self, this._then);

  final ChatLimitPerDay _self;
  final $Res Function(ChatLimitPerDay) _then;

/// Create a copy of ChatLimitPerDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? basic = null,Object? free = null,Object? premium = null,}) {
  return _then(_self.copyWith(
basic: null == basic ? _self.basic : basic // ignore: cast_nullable_to_non_nullable
as int,free: null == free ? _self.free : free // ignore: cast_nullable_to_non_nullable
as int,premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ChatLimitPerDay extends ChatLimitPerDay {
  const _ChatLimitPerDay({this.basic = RemoteConfigConstants.basicLimitPerDay, this.free = RemoteConfigConstants.freeLimitPerDay, this.premium = RemoteConfigConstants.premiumLimitPerDay}): super._();
  factory _ChatLimitPerDay.fromJson(Map<String, dynamic> json) => _$ChatLimitPerDayFromJson(json);

@override@JsonKey() final  int basic;
@override@JsonKey() final  int free;
@override@JsonKey() final  int premium;

/// Create a copy of ChatLimitPerDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatLimitPerDayCopyWith<_ChatLimitPerDay> get copyWith => __$ChatLimitPerDayCopyWithImpl<_ChatLimitPerDay>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatLimitPerDayToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatLimitPerDay&&(identical(other.basic, basic) || other.basic == basic)&&(identical(other.free, free) || other.free == free)&&(identical(other.premium, premium) || other.premium == premium));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,basic,free,premium);

@override
String toString() {
  return 'ChatLimitPerDay(basic: $basic, free: $free, premium: $premium)';
}


}

/// @nodoc
abstract mixin class _$ChatLimitPerDayCopyWith<$Res> implements $ChatLimitPerDayCopyWith<$Res> {
  factory _$ChatLimitPerDayCopyWith(_ChatLimitPerDay value, $Res Function(_ChatLimitPerDay) _then) = __$ChatLimitPerDayCopyWithImpl;
@override @useResult
$Res call({
 int basic, int free, int premium
});




}
/// @nodoc
class __$ChatLimitPerDayCopyWithImpl<$Res>
    implements _$ChatLimitPerDayCopyWith<$Res> {
  __$ChatLimitPerDayCopyWithImpl(this._self, this._then);

  final _ChatLimitPerDay _self;
  final $Res Function(_ChatLimitPerDay) _then;

/// Create a copy of ChatLimitPerDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? basic = null,Object? free = null,Object? premium = null,}) {
  return _then(_ChatLimitPerDay(
basic: null == basic ? _self.basic : basic // ignore: cast_nullable_to_non_nullable
as int,free: null == free ? _self.free : free // ignore: cast_nullable_to_non_nullable
as int,premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
