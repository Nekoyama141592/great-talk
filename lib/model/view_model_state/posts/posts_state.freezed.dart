// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostsState {

 List<UserPost> get userPosts;
/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsStateCopyWith<PostsState> get copyWith => _$PostsStateCopyWithImpl<PostsState>(this as PostsState, _$identity);

  /// Serializes this PostsState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsState&&const DeepCollectionEquality().equals(other.userPosts, userPosts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(userPosts));

@override
String toString() {
  return 'PostsState(userPosts: $userPosts)';
}


}

/// @nodoc
abstract mixin class $PostsStateCopyWith<$Res>  {
  factory $PostsStateCopyWith(PostsState value, $Res Function(PostsState) _then) = _$PostsStateCopyWithImpl;
@useResult
$Res call({
 List<UserPost> userPosts
});




}
/// @nodoc
class _$PostsStateCopyWithImpl<$Res>
    implements $PostsStateCopyWith<$Res> {
  _$PostsStateCopyWithImpl(this._self, this._then);

  final PostsState _self;
  final $Res Function(PostsState) _then;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userPosts = null,}) {
  return _then(_self.copyWith(
userPosts: null == userPosts ? _self.userPosts : userPosts // ignore: cast_nullable_to_non_nullable
as List<UserPost>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PostsState extends PostsState {
  const _PostsState({final  List<UserPost> userPosts = const []}): _userPosts = userPosts,super._();
  factory _PostsState.fromJson(Map<String, dynamic> json) => _$PostsStateFromJson(json);

 final  List<UserPost> _userPosts;
@override@JsonKey() List<UserPost> get userPosts {
  if (_userPosts is EqualUnmodifiableListView) return _userPosts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userPosts);
}


/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostsStateCopyWith<_PostsState> get copyWith => __$PostsStateCopyWithImpl<_PostsState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostsStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostsState&&const DeepCollectionEquality().equals(other._userPosts, _userPosts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_userPosts));

@override
String toString() {
  return 'PostsState(userPosts: $userPosts)';
}


}

/// @nodoc
abstract mixin class _$PostsStateCopyWith<$Res> implements $PostsStateCopyWith<$Res> {
  factory _$PostsStateCopyWith(_PostsState value, $Res Function(_PostsState) _then) = __$PostsStateCopyWithImpl;
@override @useResult
$Res call({
 List<UserPost> userPosts
});




}
/// @nodoc
class __$PostsStateCopyWithImpl<$Res>
    implements _$PostsStateCopyWith<$Res> {
  __$PostsStateCopyWithImpl(this._self, this._then);

  final _PostsState _self;
  final $Res Function(_PostsState) _then;

/// Create a copy of PostsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userPosts = null,}) {
  return _then(_PostsState(
userPosts: null == userPosts ? _self._userPosts : userPosts // ignore: cast_nullable_to_non_nullable
as List<UserPost>,
  ));
}


}

// dart format on
