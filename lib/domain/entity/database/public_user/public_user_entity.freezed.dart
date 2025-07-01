// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublicUserEntity {

 String get accountName; Map<String, dynamic> get bio; int get blockCount;@TimestampConverter() DateTime? get createdAt; String get ethAddress; int get followerCount; int get followingCount; bool get isNFTicon; bool get isOfficial; bool get isSuspended; List<Map<String, dynamic>> get links; int get muteCount; int get postCount; int get reportCount; double get score; Map<String, dynamic> get searchToken; String get uid;@TimestampConverter() DateTime? get updatedAt; Map<String, dynamic> get image; Map<String, dynamic> get userName; List<Map<String, dynamic>> get walletAddresses;
/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicUserEntityCopyWith<PublicUserEntity> get copyWith => _$PublicUserEntityCopyWithImpl<PublicUserEntity>(this as PublicUserEntity, _$identity);

  /// Serializes this PublicUserEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicUserEntity&&(identical(other.accountName, accountName) || other.accountName == accountName)&&const DeepCollectionEquality().equals(other.bio, bio)&&(identical(other.blockCount, blockCount) || other.blockCount == blockCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.ethAddress, ethAddress) || other.ethAddress == ethAddress)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.isNFTicon, isNFTicon) || other.isNFTicon == isNFTicon)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isSuspended, isSuspended) || other.isSuspended == isSuspended)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.muteCount, muteCount) || other.muteCount == muteCount)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.searchToken, searchToken)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.image, image)&&const DeepCollectionEquality().equals(other.userName, userName)&&const DeepCollectionEquality().equals(other.walletAddresses, walletAddresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,accountName,const DeepCollectionEquality().hash(bio),blockCount,createdAt,ethAddress,followerCount,followingCount,isNFTicon,isOfficial,isSuspended,const DeepCollectionEquality().hash(links),muteCount,postCount,reportCount,score,const DeepCollectionEquality().hash(searchToken),uid,updatedAt,const DeepCollectionEquality().hash(image),const DeepCollectionEquality().hash(userName),const DeepCollectionEquality().hash(walletAddresses)]);

@override
String toString() {
  return 'PublicUserEntity(accountName: $accountName, bio: $bio, blockCount: $blockCount, createdAt: $createdAt, ethAddress: $ethAddress, followerCount: $followerCount, followingCount: $followingCount, isNFTicon: $isNFTicon, isOfficial: $isOfficial, isSuspended: $isSuspended, links: $links, muteCount: $muteCount, postCount: $postCount, reportCount: $reportCount, score: $score, searchToken: $searchToken, uid: $uid, updatedAt: $updatedAt, image: $image, userName: $userName, walletAddresses: $walletAddresses)';
}


}

/// @nodoc
abstract mixin class $PublicUserEntityCopyWith<$Res>  {
  factory $PublicUserEntityCopyWith(PublicUserEntity value, $Res Function(PublicUserEntity) _then) = _$PublicUserEntityCopyWithImpl;
@useResult
$Res call({
 String accountName, Map<String, dynamic> bio, int blockCount,@TimestampConverter() DateTime? createdAt, String ethAddress, int followerCount, int followingCount, bool isNFTicon, bool isOfficial, bool isSuspended, List<Map<String, dynamic>> links, int muteCount, int postCount, int reportCount, double score, Map<String, dynamic> searchToken, String uid,@TimestampConverter() DateTime? updatedAt, Map<String, dynamic> image, Map<String, dynamic> userName, List<Map<String, dynamic>> walletAddresses
});




}
/// @nodoc
class _$PublicUserEntityCopyWithImpl<$Res>
    implements $PublicUserEntityCopyWith<$Res> {
  _$PublicUserEntityCopyWithImpl(this._self, this._then);

  final PublicUserEntity _self;
  final $Res Function(PublicUserEntity) _then;

/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountName = null,Object? bio = null,Object? blockCount = null,Object? createdAt = freezed,Object? ethAddress = null,Object? followerCount = null,Object? followingCount = null,Object? isNFTicon = null,Object? isOfficial = null,Object? isSuspended = null,Object? links = null,Object? muteCount = null,Object? postCount = null,Object? reportCount = null,Object? score = null,Object? searchToken = null,Object? uid = null,Object? updatedAt = freezed,Object? image = null,Object? userName = null,Object? walletAddresses = null,}) {
  return _then(_self.copyWith(
accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,blockCount: null == blockCount ? _self.blockCount : blockCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,ethAddress: null == ethAddress ? _self.ethAddress : ethAddress // ignore: cast_nullable_to_non_nullable
as String,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,isNFTicon: null == isNFTicon ? _self.isNFTicon : isNFTicon // ignore: cast_nullable_to_non_nullable
as bool,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,isSuspended: null == isSuspended ? _self.isSuspended : isSuspended // ignore: cast_nullable_to_non_nullable
as bool,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,muteCount: null == muteCount ? _self.muteCount : muteCount // ignore: cast_nullable_to_non_nullable
as int,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,reportCount: null == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,searchToken: null == searchToken ? _self.searchToken : searchToken // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,walletAddresses: null == walletAddresses ? _self.walletAddresses : walletAddresses // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PublicUserEntity extends PublicUserEntity {
   _PublicUserEntity({required this.accountName, required final  Map<String, dynamic> bio, required this.blockCount, @TimestampConverter() this.createdAt, required this.ethAddress, required this.followerCount, required this.followingCount, required this.isNFTicon, required this.isOfficial, required this.isSuspended, required final  List<Map<String, dynamic>> links, required this.muteCount, required this.postCount, required this.reportCount, required this.score, required final  Map<String, dynamic> searchToken, required this.uid, @TimestampConverter() this.updatedAt, required final  Map<String, dynamic> image, required final  Map<String, dynamic> userName, required final  List<Map<String, dynamic>> walletAddresses}): _bio = bio,_links = links,_searchToken = searchToken,_image = image,_userName = userName,_walletAddresses = walletAddresses,super._();
  factory _PublicUserEntity.fromJson(Map<String, dynamic> json) => _$PublicUserEntityFromJson(json);

@override final  String accountName;
 final  Map<String, dynamic> _bio;
@override Map<String, dynamic> get bio {
  if (_bio is EqualUnmodifiableMapView) return _bio;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_bio);
}

@override final  int blockCount;
@override@TimestampConverter() final  DateTime? createdAt;
@override final  String ethAddress;
@override final  int followerCount;
@override final  int followingCount;
@override final  bool isNFTicon;
@override final  bool isOfficial;
@override final  bool isSuspended;
 final  List<Map<String, dynamic>> _links;
@override List<Map<String, dynamic>> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override final  int muteCount;
@override final  int postCount;
@override final  int reportCount;
@override final  double score;
 final  Map<String, dynamic> _searchToken;
@override Map<String, dynamic> get searchToken {
  if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_searchToken);
}

@override final  String uid;
@override@TimestampConverter() final  DateTime? updatedAt;
 final  Map<String, dynamic> _image;
@override Map<String, dynamic> get image {
  if (_image is EqualUnmodifiableMapView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_image);
}

 final  Map<String, dynamic> _userName;
@override Map<String, dynamic> get userName {
  if (_userName is EqualUnmodifiableMapView) return _userName;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_userName);
}

 final  List<Map<String, dynamic>> _walletAddresses;
@override List<Map<String, dynamic>> get walletAddresses {
  if (_walletAddresses is EqualUnmodifiableListView) return _walletAddresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_walletAddresses);
}


/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicUserEntityCopyWith<_PublicUserEntity> get copyWith => __$PublicUserEntityCopyWithImpl<_PublicUserEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicUserEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicUserEntity&&(identical(other.accountName, accountName) || other.accountName == accountName)&&const DeepCollectionEquality().equals(other._bio, _bio)&&(identical(other.blockCount, blockCount) || other.blockCount == blockCount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.ethAddress, ethAddress) || other.ethAddress == ethAddress)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.isNFTicon, isNFTicon) || other.isNFTicon == isNFTicon)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isSuspended, isSuspended) || other.isSuspended == isSuspended)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.muteCount, muteCount) || other.muteCount == muteCount)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._searchToken, _searchToken)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._image, _image)&&const DeepCollectionEquality().equals(other._userName, _userName)&&const DeepCollectionEquality().equals(other._walletAddresses, _walletAddresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,accountName,const DeepCollectionEquality().hash(_bio),blockCount,createdAt,ethAddress,followerCount,followingCount,isNFTicon,isOfficial,isSuspended,const DeepCollectionEquality().hash(_links),muteCount,postCount,reportCount,score,const DeepCollectionEquality().hash(_searchToken),uid,updatedAt,const DeepCollectionEquality().hash(_image),const DeepCollectionEquality().hash(_userName),const DeepCollectionEquality().hash(_walletAddresses)]);

@override
String toString() {
  return 'PublicUserEntity(accountName: $accountName, bio: $bio, blockCount: $blockCount, createdAt: $createdAt, ethAddress: $ethAddress, followerCount: $followerCount, followingCount: $followingCount, isNFTicon: $isNFTicon, isOfficial: $isOfficial, isSuspended: $isSuspended, links: $links, muteCount: $muteCount, postCount: $postCount, reportCount: $reportCount, score: $score, searchToken: $searchToken, uid: $uid, updatedAt: $updatedAt, image: $image, userName: $userName, walletAddresses: $walletAddresses)';
}


}

/// @nodoc
abstract mixin class _$PublicUserEntityCopyWith<$Res> implements $PublicUserEntityCopyWith<$Res> {
  factory _$PublicUserEntityCopyWith(_PublicUserEntity value, $Res Function(_PublicUserEntity) _then) = __$PublicUserEntityCopyWithImpl;
@override @useResult
$Res call({
 String accountName, Map<String, dynamic> bio, int blockCount,@TimestampConverter() DateTime? createdAt, String ethAddress, int followerCount, int followingCount, bool isNFTicon, bool isOfficial, bool isSuspended, List<Map<String, dynamic>> links, int muteCount, int postCount, int reportCount, double score, Map<String, dynamic> searchToken, String uid,@TimestampConverter() DateTime? updatedAt, Map<String, dynamic> image, Map<String, dynamic> userName, List<Map<String, dynamic>> walletAddresses
});




}
/// @nodoc
class __$PublicUserEntityCopyWithImpl<$Res>
    implements _$PublicUserEntityCopyWith<$Res> {
  __$PublicUserEntityCopyWithImpl(this._self, this._then);

  final _PublicUserEntity _self;
  final $Res Function(_PublicUserEntity) _then;

/// Create a copy of PublicUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountName = null,Object? bio = null,Object? blockCount = null,Object? createdAt = freezed,Object? ethAddress = null,Object? followerCount = null,Object? followingCount = null,Object? isNFTicon = null,Object? isOfficial = null,Object? isSuspended = null,Object? links = null,Object? muteCount = null,Object? postCount = null,Object? reportCount = null,Object? score = null,Object? searchToken = null,Object? uid = null,Object? updatedAt = freezed,Object? image = null,Object? userName = null,Object? walletAddresses = null,}) {
  return _then(_PublicUserEntity(
accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self._bio : bio // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,blockCount: null == blockCount ? _self.blockCount : blockCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,ethAddress: null == ethAddress ? _self.ethAddress : ethAddress // ignore: cast_nullable_to_non_nullable
as String,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,followingCount: null == followingCount ? _self.followingCount : followingCount // ignore: cast_nullable_to_non_nullable
as int,isNFTicon: null == isNFTicon ? _self.isNFTicon : isNFTicon // ignore: cast_nullable_to_non_nullable
as bool,isOfficial: null == isOfficial ? _self.isOfficial : isOfficial // ignore: cast_nullable_to_non_nullable
as bool,isSuspended: null == isSuspended ? _self.isSuspended : isSuspended // ignore: cast_nullable_to_non_nullable
as bool,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,muteCount: null == muteCount ? _self.muteCount : muteCount // ignore: cast_nullable_to_non_nullable
as int,postCount: null == postCount ? _self.postCount : postCount // ignore: cast_nullable_to_non_nullable
as int,reportCount: null == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,searchToken: null == searchToken ? _self._searchToken : searchToken // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,image: null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,userName: null == userName ? _self._userName : userName // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,walletAddresses: null == walletAddresses ? _self._walletAddresses : walletAddresses // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
