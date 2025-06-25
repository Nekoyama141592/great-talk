// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalSettingState {

 bool get isDarkTheme; bool get needFirstMessage;
/// Create a copy of LocalSettingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalSettingStateCopyWith<LocalSettingState> get copyWith => _$LocalSettingStateCopyWithImpl<LocalSettingState>(this as LocalSettingState, _$identity);

  /// Serializes this LocalSettingState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalSettingState&&(identical(other.isDarkTheme, isDarkTheme) || other.isDarkTheme == isDarkTheme)&&(identical(other.needFirstMessage, needFirstMessage) || other.needFirstMessage == needFirstMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDarkTheme,needFirstMessage);

@override
String toString() {
  return 'LocalSettingState(isDarkTheme: $isDarkTheme, needFirstMessage: $needFirstMessage)';
}


}

/// @nodoc
abstract mixin class $LocalSettingStateCopyWith<$Res>  {
  factory $LocalSettingStateCopyWith(LocalSettingState value, $Res Function(LocalSettingState) _then) = _$LocalSettingStateCopyWithImpl;
@useResult
$Res call({
 bool isDarkTheme, bool needFirstMessage
});




}
/// @nodoc
class _$LocalSettingStateCopyWithImpl<$Res>
    implements $LocalSettingStateCopyWith<$Res> {
  _$LocalSettingStateCopyWithImpl(this._self, this._then);

  final LocalSettingState _self;
  final $Res Function(LocalSettingState) _then;

/// Create a copy of LocalSettingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDarkTheme = null,Object? needFirstMessage = null,}) {
  return _then(_self.copyWith(
isDarkTheme: null == isDarkTheme ? _self.isDarkTheme : isDarkTheme // ignore: cast_nullable_to_non_nullable
as bool,needFirstMessage: null == needFirstMessage ? _self.needFirstMessage : needFirstMessage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LocalSettingState extends LocalSettingState {
  const _LocalSettingState({this.isDarkTheme = true, this.needFirstMessage = true}): super._();
  factory _LocalSettingState.fromJson(Map<String, dynamic> json) => _$LocalSettingStateFromJson(json);

@override@JsonKey() final  bool isDarkTheme;
@override@JsonKey() final  bool needFirstMessage;

/// Create a copy of LocalSettingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalSettingStateCopyWith<_LocalSettingState> get copyWith => __$LocalSettingStateCopyWithImpl<_LocalSettingState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalSettingStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalSettingState&&(identical(other.isDarkTheme, isDarkTheme) || other.isDarkTheme == isDarkTheme)&&(identical(other.needFirstMessage, needFirstMessage) || other.needFirstMessage == needFirstMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDarkTheme,needFirstMessage);

@override
String toString() {
  return 'LocalSettingState(isDarkTheme: $isDarkTheme, needFirstMessage: $needFirstMessage)';
}


}

/// @nodoc
abstract mixin class _$LocalSettingStateCopyWith<$Res> implements $LocalSettingStateCopyWith<$Res> {
  factory _$LocalSettingStateCopyWith(_LocalSettingState value, $Res Function(_LocalSettingState) _then) = __$LocalSettingStateCopyWithImpl;
@override @useResult
$Res call({
 bool isDarkTheme, bool needFirstMessage
});




}
/// @nodoc
class __$LocalSettingStateCopyWithImpl<$Res>
    implements _$LocalSettingStateCopyWith<$Res> {
  __$LocalSettingStateCopyWithImpl(this._self, this._then);

  final _LocalSettingState _self;
  final $Res Function(_LocalSettingState) _then;

/// Create a copy of LocalSettingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDarkTheme = null,Object? needFirstMessage = null,}) {
  return _then(_LocalSettingState(
isDarkTheme: null == isDarkTheme ? _self.isDarkTheme : isDarkTheme // ignore: cast_nullable_to_non_nullable
as bool,needFirstMessage: null == needFirstMessage ? _self.needFirstMessage : needFirstMessage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
