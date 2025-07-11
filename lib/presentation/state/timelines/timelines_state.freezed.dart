// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timelines_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimelinesState {

 List<UserPost> get userPosts; List<TimelineModel> get timelines;
/// Create a copy of TimelinesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimelinesStateCopyWith<TimelinesState> get copyWith => _$TimelinesStateCopyWithImpl<TimelinesState>(this as TimelinesState, _$identity);

  /// Serializes this TimelinesState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimelinesState&&const DeepCollectionEquality().equals(other.userPosts, userPosts)&&const DeepCollectionEquality().equals(other.timelines, timelines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(userPosts),const DeepCollectionEquality().hash(timelines));

@override
String toString() {
  return 'TimelinesState(userPosts: $userPosts, timelines: $timelines)';
}


}

/// @nodoc
abstract mixin class $TimelinesStateCopyWith<$Res>  {
  factory $TimelinesStateCopyWith(TimelinesState value, $Res Function(TimelinesState) _then) = _$TimelinesStateCopyWithImpl;
@useResult
$Res call({
 List<UserPost> userPosts, List<TimelineModel> timelines
});




}
/// @nodoc
class _$TimelinesStateCopyWithImpl<$Res>
    implements $TimelinesStateCopyWith<$Res> {
  _$TimelinesStateCopyWithImpl(this._self, this._then);

  final TimelinesState _self;
  final $Res Function(TimelinesState) _then;

/// Create a copy of TimelinesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userPosts = null,Object? timelines = null,}) {
  return _then(_self.copyWith(
userPosts: null == userPosts ? _self.userPosts : userPosts // ignore: cast_nullable_to_non_nullable
as List<UserPost>,timelines: null == timelines ? _self.timelines : timelines // ignore: cast_nullable_to_non_nullable
as List<TimelineModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TimelinesState extends TimelinesState {
  const _TimelinesState({final  List<UserPost> userPosts = const [], final  List<TimelineModel> timelines = const []}): _userPosts = userPosts,_timelines = timelines,super._();
  factory _TimelinesState.fromJson(Map<String, dynamic> json) => _$TimelinesStateFromJson(json);

 final  List<UserPost> _userPosts;
@override@JsonKey() List<UserPost> get userPosts {
  if (_userPosts is EqualUnmodifiableListView) return _userPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userPosts);
}

 final  List<TimelineModel> _timelines;
@override@JsonKey() List<TimelineModel> get timelines {
  if (_timelines is EqualUnmodifiableListView) return _timelines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timelines);
}


/// Create a copy of TimelinesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimelinesStateCopyWith<_TimelinesState> get copyWith => __$TimelinesStateCopyWithImpl<_TimelinesState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimelinesStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimelinesState&&const DeepCollectionEquality().equals(other._userPosts, _userPosts)&&const DeepCollectionEquality().equals(other._timelines, _timelines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_userPosts),const DeepCollectionEquality().hash(_timelines));

@override
String toString() {
  return 'TimelinesState(userPosts: $userPosts, timelines: $timelines)';
}


}

/// @nodoc
abstract mixin class _$TimelinesStateCopyWith<$Res> implements $TimelinesStateCopyWith<$Res> {
  factory _$TimelinesStateCopyWith(_TimelinesState value, $Res Function(_TimelinesState) _then) = __$TimelinesStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserPost> userPosts, List<TimelineModel> timelines
});




}
/// @nodoc
class __$TimelinesStateCopyWithImpl<$Res>
    implements _$TimelinesStateCopyWith<$Res> {
  __$TimelinesStateCopyWithImpl(this._self, this._then);

  final _TimelinesState _self;
  final $Res Function(_TimelinesState) _then;

/// Create a copy of TimelinesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userPosts = null,Object? timelines = null,}) {
  return _then(_TimelinesState(
userPosts: null == userPosts ? _self._userPosts : userPosts // ignore: cast_nullable_to_non_nullable
as List<UserPost>,timelines: null == timelines ? _self._timelines : timelines // ignore: cast_nullable_to_non_nullable
as List<TimelineModel>,
  ));
}


}

// dart format on
