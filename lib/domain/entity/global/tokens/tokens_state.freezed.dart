// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokens_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokensState {

 List<FollowingTokenModel> get followingTokens; List<LikePostTokenModel> get likePostTokens; List<MutePostTokenModel> get mutePostTokens; List<MuteUserTokenModel> get muteUserTokens; List<String> get deletePostIds;
/// Create a copy of TokensState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokensStateCopyWith<TokensState> get copyWith => _$TokensStateCopyWithImpl<TokensState>(this as TokensState, _$identity);

  /// Serializes this TokensState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokensState&&const DeepCollectionEquality().equals(other.followingTokens, followingTokens)&&const DeepCollectionEquality().equals(other.likePostTokens, likePostTokens)&&const DeepCollectionEquality().equals(other.mutePostTokens, mutePostTokens)&&const DeepCollectionEquality().equals(other.muteUserTokens, muteUserTokens)&&const DeepCollectionEquality().equals(other.deletePostIds, deletePostIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(followingTokens),const DeepCollectionEquality().hash(likePostTokens),const DeepCollectionEquality().hash(mutePostTokens),const DeepCollectionEquality().hash(muteUserTokens),const DeepCollectionEquality().hash(deletePostIds));

@override
String toString() {
  return 'TokensState(followingTokens: $followingTokens, likePostTokens: $likePostTokens, mutePostTokens: $mutePostTokens, muteUserTokens: $muteUserTokens, deletePostIds: $deletePostIds)';
}


}

/// @nodoc
abstract mixin class $TokensStateCopyWith<$Res>  {
  factory $TokensStateCopyWith(TokensState value, $Res Function(TokensState) _then) = _$TokensStateCopyWithImpl;
@useResult
$Res call({
 List<FollowingTokenModel> followingTokens, List<LikePostTokenModel> likePostTokens, List<MutePostTokenModel> mutePostTokens, List<MuteUserTokenModel> muteUserTokens, List<String> deletePostIds
});




}
/// @nodoc
class _$TokensStateCopyWithImpl<$Res>
    implements $TokensStateCopyWith<$Res> {
  _$TokensStateCopyWithImpl(this._self, this._then);

  final TokensState _self;
  final $Res Function(TokensState) _then;

/// Create a copy of TokensState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? followingTokens = null,Object? likePostTokens = null,Object? mutePostTokens = null,Object? muteUserTokens = null,Object? deletePostIds = null,}) {
  return _then(_self.copyWith(
followingTokens: null == followingTokens ? _self.followingTokens : followingTokens // ignore: cast_nullable_to_non_nullable
as List<FollowingTokenModel>,likePostTokens: null == likePostTokens ? _self.likePostTokens : likePostTokens // ignore: cast_nullable_to_non_nullable
as List<LikePostTokenModel>,mutePostTokens: null == mutePostTokens ? _self.mutePostTokens : mutePostTokens // ignore: cast_nullable_to_non_nullable
as List<MutePostTokenModel>,muteUserTokens: null == muteUserTokens ? _self.muteUserTokens : muteUserTokens // ignore: cast_nullable_to_non_nullable
as List<MuteUserTokenModel>,deletePostIds: null == deletePostIds ? _self.deletePostIds : deletePostIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TokensState extends TokensState {
  const _TokensState({final  List<FollowingTokenModel> followingTokens = const <FollowingTokenModel>[], final  List<LikePostTokenModel> likePostTokens = const <LikePostTokenModel>[], final  List<MutePostTokenModel> mutePostTokens = const <MutePostTokenModel>[], final  List<MuteUserTokenModel> muteUserTokens = const <MuteUserTokenModel>[], final  List<String> deletePostIds = const <String>[]}): _followingTokens = followingTokens,_likePostTokens = likePostTokens,_mutePostTokens = mutePostTokens,_muteUserTokens = muteUserTokens,_deletePostIds = deletePostIds,super._();
  factory _TokensState.fromJson(Map<String, dynamic> json) => _$TokensStateFromJson(json);

 final  List<FollowingTokenModel> _followingTokens;
@override@JsonKey() List<FollowingTokenModel> get followingTokens {
  if (_followingTokens is EqualUnmodifiableListView) return _followingTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_followingTokens);
}

 final  List<LikePostTokenModel> _likePostTokens;
@override@JsonKey() List<LikePostTokenModel> get likePostTokens {
  if (_likePostTokens is EqualUnmodifiableListView) return _likePostTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_likePostTokens);
}

 final  List<MutePostTokenModel> _mutePostTokens;
@override@JsonKey() List<MutePostTokenModel> get mutePostTokens {
  if (_mutePostTokens is EqualUnmodifiableListView) return _mutePostTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mutePostTokens);
}

 final  List<MuteUserTokenModel> _muteUserTokens;
@override@JsonKey() List<MuteUserTokenModel> get muteUserTokens {
  if (_muteUserTokens is EqualUnmodifiableListView) return _muteUserTokens;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_muteUserTokens);
}

 final  List<String> _deletePostIds;
@override@JsonKey() List<String> get deletePostIds {
  if (_deletePostIds is EqualUnmodifiableListView) return _deletePostIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deletePostIds);
}


/// Create a copy of TokensState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokensStateCopyWith<_TokensState> get copyWith => __$TokensStateCopyWithImpl<_TokensState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokensStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokensState&&const DeepCollectionEquality().equals(other._followingTokens, _followingTokens)&&const DeepCollectionEquality().equals(other._likePostTokens, _likePostTokens)&&const DeepCollectionEquality().equals(other._mutePostTokens, _mutePostTokens)&&const DeepCollectionEquality().equals(other._muteUserTokens, _muteUserTokens)&&const DeepCollectionEquality().equals(other._deletePostIds, _deletePostIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_followingTokens),const DeepCollectionEquality().hash(_likePostTokens),const DeepCollectionEquality().hash(_mutePostTokens),const DeepCollectionEquality().hash(_muteUserTokens),const DeepCollectionEquality().hash(_deletePostIds));

@override
String toString() {
  return 'TokensState(followingTokens: $followingTokens, likePostTokens: $likePostTokens, mutePostTokens: $mutePostTokens, muteUserTokens: $muteUserTokens, deletePostIds: $deletePostIds)';
}


}

/// @nodoc
abstract mixin class _$TokensStateCopyWith<$Res> implements $TokensStateCopyWith<$Res> {
  factory _$TokensStateCopyWith(_TokensState value, $Res Function(_TokensState) _then) = __$TokensStateCopyWithImpl;
@override @useResult
$Res call({
 List<FollowingTokenModel> followingTokens, List<LikePostTokenModel> likePostTokens, List<MutePostTokenModel> mutePostTokens, List<MuteUserTokenModel> muteUserTokens, List<String> deletePostIds
});




}
/// @nodoc
class __$TokensStateCopyWithImpl<$Res>
    implements _$TokensStateCopyWith<$Res> {
  __$TokensStateCopyWithImpl(this._self, this._then);

  final _TokensState _self;
  final $Res Function(_TokensState) _then;

/// Create a copy of TokensState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? followingTokens = null,Object? likePostTokens = null,Object? mutePostTokens = null,Object? muteUserTokens = null,Object? deletePostIds = null,}) {
  return _then(_TokensState(
followingTokens: null == followingTokens ? _self._followingTokens : followingTokens // ignore: cast_nullable_to_non_nullable
as List<FollowingTokenModel>,likePostTokens: null == likePostTokens ? _self._likePostTokens : likePostTokens // ignore: cast_nullable_to_non_nullable
as List<LikePostTokenModel>,mutePostTokens: null == mutePostTokens ? _self._mutePostTokens : mutePostTokens // ignore: cast_nullable_to_non_nullable
as List<MutePostTokenModel>,muteUserTokens: null == muteUserTokens ? _self._muteUserTokens : muteUserTokens // ignore: cast_nullable_to_non_nullable
as List<MuteUserTokenModel>,deletePostIds: null == deletePostIds ? _self._deletePostIds : deletePostIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
