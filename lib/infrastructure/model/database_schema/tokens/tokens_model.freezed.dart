// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tokens_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tokens {

 List<FollowingTokenModel> get followingTokens; List<LikePostTokenModel> get likePostTokens; List<MutePostTokenModel> get mutePostTokens; List<MuteUserTokenModel> get muteUserTokens;
/// Create a copy of Tokens
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokensCopyWith<Tokens> get copyWith => _$TokensCopyWithImpl<Tokens>(this as Tokens, _$identity);

  /// Serializes this Tokens to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tokens&&const DeepCollectionEquality().equals(other.followingTokens, followingTokens)&&const DeepCollectionEquality().equals(other.likePostTokens, likePostTokens)&&const DeepCollectionEquality().equals(other.mutePostTokens, mutePostTokens)&&const DeepCollectionEquality().equals(other.muteUserTokens, muteUserTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(followingTokens),const DeepCollectionEquality().hash(likePostTokens),const DeepCollectionEquality().hash(mutePostTokens),const DeepCollectionEquality().hash(muteUserTokens));

@override
String toString() {
  return 'Tokens(followingTokens: $followingTokens, likePostTokens: $likePostTokens, mutePostTokens: $mutePostTokens, muteUserTokens: $muteUserTokens)';
}


}

/// @nodoc
abstract mixin class $TokensCopyWith<$Res>  {
  factory $TokensCopyWith(Tokens value, $Res Function(Tokens) _then) = _$TokensCopyWithImpl;
@useResult
$Res call({
 List<FollowingTokenModel> followingTokens, List<LikePostTokenModel> likePostTokens, List<MutePostTokenModel> mutePostTokens, List<MuteUserTokenModel> muteUserTokens
});




}
/// @nodoc
class _$TokensCopyWithImpl<$Res>
    implements $TokensCopyWith<$Res> {
  _$TokensCopyWithImpl(this._self, this._then);

  final Tokens _self;
  final $Res Function(Tokens) _then;

/// Create a copy of Tokens
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? followingTokens = null,Object? likePostTokens = null,Object? mutePostTokens = null,Object? muteUserTokens = null,}) {
  return _then(_self.copyWith(
followingTokens: null == followingTokens ? _self.followingTokens : followingTokens // ignore: cast_nullable_to_non_nullable
as List<FollowingTokenModel>,likePostTokens: null == likePostTokens ? _self.likePostTokens : likePostTokens // ignore: cast_nullable_to_non_nullable
as List<LikePostTokenModel>,mutePostTokens: null == mutePostTokens ? _self.mutePostTokens : mutePostTokens // ignore: cast_nullable_to_non_nullable
as List<MutePostTokenModel>,muteUserTokens: null == muteUserTokens ? _self.muteUserTokens : muteUserTokens // ignore: cast_nullable_to_non_nullable
as List<MuteUserTokenModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Tokens extends Tokens {
  const _Tokens({final  List<FollowingTokenModel> followingTokens = const <FollowingTokenModel>[], final  List<LikePostTokenModel> likePostTokens = const <LikePostTokenModel>[], final  List<MutePostTokenModel> mutePostTokens = const <MutePostTokenModel>[], final  List<MuteUserTokenModel> muteUserTokens = const <MuteUserTokenModel>[]}): _followingTokens = followingTokens,_likePostTokens = likePostTokens,_mutePostTokens = mutePostTokens,_muteUserTokens = muteUserTokens,super._();
  factory _Tokens.fromJson(Map<String, dynamic> json) => _$TokensFromJson(json);

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


/// Create a copy of Tokens
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokensCopyWith<_Tokens> get copyWith => __$TokensCopyWithImpl<_Tokens>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokensToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tokens&&const DeepCollectionEquality().equals(other._followingTokens, _followingTokens)&&const DeepCollectionEquality().equals(other._likePostTokens, _likePostTokens)&&const DeepCollectionEquality().equals(other._mutePostTokens, _mutePostTokens)&&const DeepCollectionEquality().equals(other._muteUserTokens, _muteUserTokens));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_followingTokens),const DeepCollectionEquality().hash(_likePostTokens),const DeepCollectionEquality().hash(_mutePostTokens),const DeepCollectionEquality().hash(_muteUserTokens));

@override
String toString() {
  return 'Tokens(followingTokens: $followingTokens, likePostTokens: $likePostTokens, mutePostTokens: $mutePostTokens, muteUserTokens: $muteUserTokens)';
}


}

/// @nodoc
abstract mixin class _$TokensCopyWith<$Res> implements $TokensCopyWith<$Res> {
  factory _$TokensCopyWith(_Tokens value, $Res Function(_Tokens) _then) = __$TokensCopyWithImpl;
@override @useResult
$Res call({
 List<FollowingTokenModel> followingTokens, List<LikePostTokenModel> likePostTokens, List<MutePostTokenModel> mutePostTokens, List<MuteUserTokenModel> muteUserTokens
});




}
/// @nodoc
class __$TokensCopyWithImpl<$Res>
    implements _$TokensCopyWith<$Res> {
  __$TokensCopyWithImpl(this._self, this._then);

  final _Tokens _self;
  final $Res Function(_Tokens) _then;

/// Create a copy of Tokens
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? followingTokens = null,Object? likePostTokens = null,Object? mutePostTokens = null,Object? muteUserTokens = null,}) {
  return _then(_Tokens(
followingTokens: null == followingTokens ? _self._followingTokens : followingTokens // ignore: cast_nullable_to_non_nullable
as List<FollowingTokenModel>,likePostTokens: null == likePostTokens ? _self._likePostTokens : likePostTokens // ignore: cast_nullable_to_non_nullable
as List<LikePostTokenModel>,mutePostTokens: null == mutePostTokens ? _self._mutePostTokens : mutePostTokens // ignore: cast_nullable_to_non_nullable
as List<MutePostTokenModel>,muteUserTokens: null == muteUserTokens ? _self._muteUserTokens : muteUserTokens // ignore: cast_nullable_to_non_nullable
as List<MuteUserTokenModel>,
  ));
}


}

// dart format on
