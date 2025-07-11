// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublicUserModel {

 String get accountName;@DetectedTextConverter() DetectedText get bio; int get blockCount; dynamic get createdAt; String get ethAddress; int get followerCount; int get followingCount; bool get isNFTicon; bool get isOfficial; bool get isSuspended; List<Map<String, dynamic>> get links; int get muteCount; int get postCount; int get reportCount; double get score; Map<String, dynamic> get searchToken; String get uid; dynamic get updatedAt;@ModeratedImageConverter() ModeratedImage get image;@DetectedTextConverter() DetectedText get userName; List<Map<String, dynamic>> get walletAddresses;
/// Create a copy of PublicUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicUserModelCopyWith<PublicUserModel> get copyWith => _$PublicUserModelCopyWithImpl<PublicUserModel>(this as PublicUserModel, _$identity);

  /// Serializes this PublicUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicUserModel&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.blockCount, blockCount) || other.blockCount == blockCount)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.ethAddress, ethAddress) || other.ethAddress == ethAddress)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.isNFTicon, isNFTicon) || other.isNFTicon == isNFTicon)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isSuspended, isSuspended) || other.isSuspended == isSuspended)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.muteCount, muteCount) || other.muteCount == muteCount)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.searchToken, searchToken)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt)&&(identical(other.image, image) || other.image == image)&&(identical(other.userName, userName) || other.userName == userName)&&const DeepCollectionEquality().equals(other.walletAddresses, walletAddresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,accountName,bio,blockCount,const DeepCollectionEquality().hash(createdAt),ethAddress,followerCount,followingCount,isNFTicon,isOfficial,isSuspended,const DeepCollectionEquality().hash(links),muteCount,postCount,reportCount,score,const DeepCollectionEquality().hash(searchToken),uid,const DeepCollectionEquality().hash(updatedAt),image,userName,const DeepCollectionEquality().hash(walletAddresses)]);

@override
String toString() {
  return 'PublicUserModel(accountName: $accountName, bio: $bio, blockCount: $blockCount, createdAt: $createdAt, ethAddress: $ethAddress, followerCount: $followerCount, followingCount: $followingCount, isNFTicon: $isNFTicon, isOfficial: $isOfficial, isSuspended: $isSuspended, links: $links, muteCount: $muteCount, postCount: $postCount, reportCount: $reportCount, score: $score, searchToken: $searchToken, uid: $uid, updatedAt: $updatedAt, image: $image, userName: $userName, walletAddresses: $walletAddresses)';
}


}

/// @nodoc
abstract mixin class $PublicUserModelCopyWith<$Res>  {
  factory $PublicUserModelCopyWith(PublicUserModel value, $Res Function(PublicUserModel) _then) = _$PublicUserModelCopyWithImpl;
@useResult
$Res call({
 String accountName,@DetectedTextConverter() DetectedText bio, int blockCount, dynamic createdAt, String ethAddress, int followerCount, int followingCount, bool isNFTicon, bool isOfficial, bool isSuspended, List<Map<String, dynamic>> links, int muteCount, int postCount, int reportCount, double score, Map<String, dynamic> searchToken, String uid, dynamic updatedAt,@ModeratedImageConverter() ModeratedImage image,@DetectedTextConverter() DetectedText userName, List<Map<String, dynamic>> walletAddresses
});


$DetectedTextCopyWith<$Res> get bio;$ModeratedImageCopyWith<$Res> get image;$DetectedTextCopyWith<$Res> get userName;

}
/// @nodoc
class _$PublicUserModelCopyWithImpl<$Res>
    implements $PublicUserModelCopyWith<$Res> {
  _$PublicUserModelCopyWithImpl(this._self, this._then);

  final PublicUserModel _self;
  final $Res Function(PublicUserModel) _then;

/// Create a copy of PublicUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountName = null,Object? bio = null,Object? blockCount = null,Object? createdAt = freezed,Object? ethAddress = null,Object? followerCount = null,Object? followingCount = null,Object? isNFTicon = null,Object? isOfficial = null,Object? isSuspended = null,Object? links = null,Object? muteCount = null,Object? postCount = null,Object? reportCount = null,Object? score = null,Object? searchToken = null,Object? uid = null,Object? updatedAt = freezed,Object? image = null,Object? userName = null,Object? walletAddresses = null,}) {
  return _then(_self.copyWith(
accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as DetectedText,blockCount: null == blockCount ? _self.blockCount : blockCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,ethAddress: null == ethAddress ? _self.ethAddress : ethAddress // ignore: cast_nullable_to_non_nullable
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
as dynamic,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ModeratedImage,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as DetectedText,walletAddresses: null == walletAddresses ? _self.walletAddresses : walletAddresses // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}
/// Create a copy of PublicUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get bio {
  
  return $DetectedTextCopyWith<$Res>(_self.bio, (value) {
    return _then(_self.copyWith(bio: value));
  });
}/// Create a copy of PublicUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModeratedImageCopyWith<$Res> get image {
  
  return $ModeratedImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of PublicUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get userName {
  
  return $DetectedTextCopyWith<$Res>(_self.userName, (value) {
    return _then(_self.copyWith(userName: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _PublicUserModel extends PublicUserModel {
   _PublicUserModel({this.accountName = "", @DetectedTextConverter() required this.bio, this.blockCount = 0, required this.createdAt, this.ethAddress = "", this.followerCount = 0, this.followingCount = 0, this.isNFTicon = false, this.isOfficial = false, this.isSuspended = false, final  List<Map<String, dynamic>> links = const [], this.muteCount = 0, this.postCount = 0, this.reportCount = 0, this.score = 0.0, final  Map<String, dynamic> searchToken = const {}, required this.uid, required this.updatedAt, @ModeratedImageConverter() required this.image, @DetectedTextConverter() required this.userName, final  List<Map<String, dynamic>> walletAddresses = const []}): _links = links,_searchToken = searchToken,_walletAddresses = walletAddresses,super._();
  factory _PublicUserModel.fromJson(Map<String, dynamic> json) => _$PublicUserModelFromJson(json);

@override@JsonKey() final  String accountName;
@override@DetectedTextConverter() final  DetectedText bio;
@override@JsonKey() final  int blockCount;
@override final  dynamic createdAt;
@override@JsonKey() final  String ethAddress;
@override@JsonKey() final  int followerCount;
@override@JsonKey() final  int followingCount;
@override@JsonKey() final  bool isNFTicon;
@override@JsonKey() final  bool isOfficial;
@override@JsonKey() final  bool isSuspended;
 final  List<Map<String, dynamic>> _links;
@override@JsonKey() List<Map<String, dynamic>> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override@JsonKey() final  int muteCount;
@override@JsonKey() final  int postCount;
@override@JsonKey() final  int reportCount;
@override@JsonKey() final  double score;
 final  Map<String, dynamic> _searchToken;
@override@JsonKey() Map<String, dynamic> get searchToken {
  if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_searchToken);
}

@override final  String uid;
@override final  dynamic updatedAt;
@override@ModeratedImageConverter() final  ModeratedImage image;
@override@DetectedTextConverter() final  DetectedText userName;
 final  List<Map<String, dynamic>> _walletAddresses;
@override@JsonKey() List<Map<String, dynamic>> get walletAddresses {
  if (_walletAddresses is EqualUnmodifiableListView) return _walletAddresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_walletAddresses);
}


/// Create a copy of PublicUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicUserModelCopyWith<_PublicUserModel> get copyWith => __$PublicUserModelCopyWithImpl<_PublicUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicUserModel&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.blockCount, blockCount) || other.blockCount == blockCount)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&(identical(other.ethAddress, ethAddress) || other.ethAddress == ethAddress)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.followingCount, followingCount) || other.followingCount == followingCount)&&(identical(other.isNFTicon, isNFTicon) || other.isNFTicon == isNFTicon)&&(identical(other.isOfficial, isOfficial) || other.isOfficial == isOfficial)&&(identical(other.isSuspended, isSuspended) || other.isSuspended == isSuspended)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.muteCount, muteCount) || other.muteCount == muteCount)&&(identical(other.postCount, postCount) || other.postCount == postCount)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._searchToken, _searchToken)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt)&&(identical(other.image, image) || other.image == image)&&(identical(other.userName, userName) || other.userName == userName)&&const DeepCollectionEquality().equals(other._walletAddresses, _walletAddresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,accountName,bio,blockCount,const DeepCollectionEquality().hash(createdAt),ethAddress,followerCount,followingCount,isNFTicon,isOfficial,isSuspended,const DeepCollectionEquality().hash(_links),muteCount,postCount,reportCount,score,const DeepCollectionEquality().hash(_searchToken),uid,const DeepCollectionEquality().hash(updatedAt),image,userName,const DeepCollectionEquality().hash(_walletAddresses)]);

@override
String toString() {
  return 'PublicUserModel(accountName: $accountName, bio: $bio, blockCount: $blockCount, createdAt: $createdAt, ethAddress: $ethAddress, followerCount: $followerCount, followingCount: $followingCount, isNFTicon: $isNFTicon, isOfficial: $isOfficial, isSuspended: $isSuspended, links: $links, muteCount: $muteCount, postCount: $postCount, reportCount: $reportCount, score: $score, searchToken: $searchToken, uid: $uid, updatedAt: $updatedAt, image: $image, userName: $userName, walletAddresses: $walletAddresses)';
}


}

/// @nodoc
abstract mixin class _$PublicUserModelCopyWith<$Res> implements $PublicUserModelCopyWith<$Res> {
  factory _$PublicUserModelCopyWith(_PublicUserModel value, $Res Function(_PublicUserModel) _then) = __$PublicUserModelCopyWithImpl;
@override @useResult
$Res call({
 String accountName,@DetectedTextConverter() DetectedText bio, int blockCount, dynamic createdAt, String ethAddress, int followerCount, int followingCount, bool isNFTicon, bool isOfficial, bool isSuspended, List<Map<String, dynamic>> links, int muteCount, int postCount, int reportCount, double score, Map<String, dynamic> searchToken, String uid, dynamic updatedAt,@ModeratedImageConverter() ModeratedImage image,@DetectedTextConverter() DetectedText userName, List<Map<String, dynamic>> walletAddresses
});


@override $DetectedTextCopyWith<$Res> get bio;@override $ModeratedImageCopyWith<$Res> get image;@override $DetectedTextCopyWith<$Res> get userName;

}
/// @nodoc
class __$PublicUserModelCopyWithImpl<$Res>
    implements _$PublicUserModelCopyWith<$Res> {
  __$PublicUserModelCopyWithImpl(this._self, this._then);

  final _PublicUserModel _self;
  final $Res Function(_PublicUserModel) _then;

/// Create a copy of PublicUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountName = null,Object? bio = null,Object? blockCount = null,Object? createdAt = freezed,Object? ethAddress = null,Object? followerCount = null,Object? followingCount = null,Object? isNFTicon = null,Object? isOfficial = null,Object? isSuspended = null,Object? links = null,Object? muteCount = null,Object? postCount = null,Object? reportCount = null,Object? score = null,Object? searchToken = null,Object? uid = null,Object? updatedAt = freezed,Object? image = null,Object? userName = null,Object? walletAddresses = null,}) {
  return _then(_PublicUserModel(
accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as DetectedText,blockCount: null == blockCount ? _self.blockCount : blockCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,ethAddress: null == ethAddress ? _self.ethAddress : ethAddress // ignore: cast_nullable_to_non_nullable
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
as dynamic,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ModeratedImage,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as DetectedText,walletAddresses: null == walletAddresses ? _self._walletAddresses : walletAddresses // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

/// Create a copy of PublicUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get bio {
  
  return $DetectedTextCopyWith<$Res>(_self.bio, (value) {
    return _then(_self.copyWith(bio: value));
  });
}/// Create a copy of PublicUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModeratedImageCopyWith<$Res> get image {
  
  return $ModeratedImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of PublicUserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get userName {
  
  return $DetectedTextCopyWith<$Res>(_self.userName, (value) {
    return _then(_self.copyWith(userName: value));
  });
}
}

// dart format on
