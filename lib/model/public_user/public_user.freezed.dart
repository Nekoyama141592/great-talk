// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PublicUser {
  String get accountName;
  SDMap get bio;
  int get blockCount;
  dynamic get createdAt;
  String get ethAddress;
  int get followerCount;
  int get followingCount;
  bool get isNFTicon;
  bool get isOfficial;
  bool get isSuspended;
  List<SDMap> get links;
  int get muteCount;
  int get postCount;
  dynamic get ref;
  int get reportCount;
  double get score;
  SDMap get searchToken;
  String get uid;
  dynamic get updatedAt;
  SDMap get image;
  SDMap get userName;
  List<SDMap> get walletAddresses;

  /// Create a copy of PublicUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PublicUserCopyWith<PublicUser> get copyWith =>
      _$PublicUserCopyWithImpl<PublicUser>(this as PublicUser, _$identity);

  /// Serializes this PublicUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PublicUser &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            const DeepCollectionEquality().equals(other.bio, bio) &&
            (identical(other.blockCount, blockCount) ||
                other.blockCount == blockCount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.ethAddress, ethAddress) ||
                other.ethAddress == ethAddress) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.isNFTicon, isNFTicon) ||
                other.isNFTicon == isNFTicon) &&
            (identical(other.isOfficial, isOfficial) ||
                other.isOfficial == isOfficial) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            const DeepCollectionEquality().equals(other.links, links) &&
            (identical(other.muteCount, muteCount) ||
                other.muteCount == muteCount) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            (identical(other.reportCount, reportCount) ||
                other.reportCount == reportCount) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality()
                .equals(other.searchToken, searchToken) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality()
                .equals(other.walletAddresses, walletAddresses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        accountName,
        const DeepCollectionEquality().hash(bio),
        blockCount,
        const DeepCollectionEquality().hash(createdAt),
        ethAddress,
        followerCount,
        followingCount,
        isNFTicon,
        isOfficial,
        isSuspended,
        const DeepCollectionEquality().hash(links),
        muteCount,
        postCount,
        const DeepCollectionEquality().hash(ref),
        reportCount,
        score,
        const DeepCollectionEquality().hash(searchToken),
        uid,
        const DeepCollectionEquality().hash(updatedAt),
        const DeepCollectionEquality().hash(image),
        const DeepCollectionEquality().hash(userName),
        const DeepCollectionEquality().hash(walletAddresses)
      ]);

  @override
  String toString() {
    return 'PublicUser(accountName: $accountName, bio: $bio, blockCount: $blockCount, createdAt: $createdAt, ethAddress: $ethAddress, followerCount: $followerCount, followingCount: $followingCount, isNFTicon: $isNFTicon, isOfficial: $isOfficial, isSuspended: $isSuspended, links: $links, muteCount: $muteCount, postCount: $postCount, ref: $ref, reportCount: $reportCount, score: $score, searchToken: $searchToken, uid: $uid, updatedAt: $updatedAt, image: $image, userName: $userName, walletAddresses: $walletAddresses)';
  }
}

/// @nodoc
abstract mixin class $PublicUserCopyWith<$Res> {
  factory $PublicUserCopyWith(
          PublicUser value, $Res Function(PublicUser) _then) =
      _$PublicUserCopyWithImpl;
  @useResult
  $Res call(
      {String accountName,
      SDMap bio,
      int blockCount,
      dynamic createdAt,
      String ethAddress,
      int followerCount,
      int followingCount,
      bool isNFTicon,
      bool isOfficial,
      bool isSuspended,
      List<SDMap> links,
      int muteCount,
      int postCount,
      dynamic ref,
      int reportCount,
      double score,
      SDMap searchToken,
      String uid,
      dynamic updatedAt,
      SDMap image,
      SDMap userName,
      List<SDMap> walletAddresses});
}

/// @nodoc
class _$PublicUserCopyWithImpl<$Res> implements $PublicUserCopyWith<$Res> {
  _$PublicUserCopyWithImpl(this._self, this._then);

  final PublicUser _self;
  final $Res Function(PublicUser) _then;

  /// Create a copy of PublicUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = null,
    Object? bio = null,
    Object? blockCount = null,
    Object? createdAt = freezed,
    Object? ethAddress = null,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? isNFTicon = null,
    Object? isOfficial = null,
    Object? isSuspended = null,
    Object? links = null,
    Object? muteCount = null,
    Object? postCount = null,
    Object? ref = freezed,
    Object? reportCount = null,
    Object? score = null,
    Object? searchToken = null,
    Object? uid = null,
    Object? updatedAt = freezed,
    Object? image = null,
    Object? userName = null,
    Object? walletAddresses = null,
  }) {
    return _then(_self.copyWith(
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _self.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as SDMap,
      blockCount: null == blockCount
          ? _self.blockCount
          : blockCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ethAddress: null == ethAddress
          ? _self.ethAddress
          : ethAddress // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: null == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _self.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      isNFTicon: null == isNFTicon
          ? _self.isNFTicon
          : isNFTicon // ignore: cast_nullable_to_non_nullable
              as bool,
      isOfficial: null == isOfficial
          ? _self.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _self.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      links: null == links
          ? _self.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<SDMap>,
      muteCount: null == muteCount
          ? _self.muteCount
          : muteCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _self.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      ref: freezed == ref
          ? _self.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reportCount: null == reportCount
          ? _self.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      searchToken: null == searchToken
          ? _self.searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as SDMap,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as SDMap,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as SDMap,
      walletAddresses: null == walletAddresses
          ? _self.walletAddresses
          : walletAddresses // ignore: cast_nullable_to_non_nullable
              as List<SDMap>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PublicUser extends PublicUser {
  _PublicUser(
      {this.accountName = "",
      required final SDMap bio,
      this.blockCount = 0,
      required this.createdAt,
      this.ethAddress = "",
      this.followerCount = 0,
      this.followingCount = 0,
      this.isNFTicon = false,
      this.isOfficial = false,
      this.isSuspended = false,
      final List<SDMap> links = const [],
      this.muteCount = 0,
      this.postCount = 0,
      required this.ref,
      this.reportCount = 0,
      this.score = 0.0,
      final SDMap searchToken = const {},
      required this.uid,
      required this.updatedAt,
      required final SDMap image,
      required final SDMap userName,
      final List<SDMap> walletAddresses = const []})
      : _bio = bio,
        _links = links,
        _searchToken = searchToken,
        _image = image,
        _userName = userName,
        _walletAddresses = walletAddresses,
        super._();
  factory _PublicUser.fromJson(Map<String, dynamic> json) =>
      _$PublicUserFromJson(json);

  @override
  @JsonKey()
  final String accountName;
  final SDMap _bio;
  @override
  SDMap get bio {
    if (_bio is EqualUnmodifiableMapView) return _bio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_bio);
  }

  @override
  @JsonKey()
  final int blockCount;
  @override
  final dynamic createdAt;
  @override
  @JsonKey()
  final String ethAddress;
  @override
  @JsonKey()
  final int followerCount;
  @override
  @JsonKey()
  final int followingCount;
  @override
  @JsonKey()
  final bool isNFTicon;
  @override
  @JsonKey()
  final bool isOfficial;
  @override
  @JsonKey()
  final bool isSuspended;
  final List<SDMap> _links;
  @override
  @JsonKey()
  List<SDMap> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  @JsonKey()
  final int muteCount;
  @override
  @JsonKey()
  final int postCount;
  @override
  final dynamic ref;
  @override
  @JsonKey()
  final int reportCount;
  @override
  @JsonKey()
  final double score;
  final SDMap _searchToken;
  @override
  @JsonKey()
  SDMap get searchToken {
    if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_searchToken);
  }

  @override
  final String uid;
  @override
  final dynamic updatedAt;
  final SDMap _image;
  @override
  SDMap get image {
    if (_image is EqualUnmodifiableMapView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_image);
  }

  final SDMap _userName;
  @override
  SDMap get userName {
    if (_userName is EqualUnmodifiableMapView) return _userName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userName);
  }

  final List<SDMap> _walletAddresses;
  @override
  @JsonKey()
  List<SDMap> get walletAddresses {
    if (_walletAddresses is EqualUnmodifiableListView) return _walletAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walletAddresses);
  }

  /// Create a copy of PublicUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PublicUserCopyWith<_PublicUser> get copyWith =>
      __$PublicUserCopyWithImpl<_PublicUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PublicUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PublicUser &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            const DeepCollectionEquality().equals(other._bio, _bio) &&
            (identical(other.blockCount, blockCount) ||
                other.blockCount == blockCount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.ethAddress, ethAddress) ||
                other.ethAddress == ethAddress) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.isNFTicon, isNFTicon) ||
                other.isNFTicon == isNFTicon) &&
            (identical(other.isOfficial, isOfficial) ||
                other.isOfficial == isOfficial) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            (identical(other.muteCount, muteCount) ||
                other.muteCount == muteCount) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            (identical(other.reportCount, reportCount) ||
                other.reportCount == reportCount) &&
            (identical(other.score, score) || other.score == score) &&
            const DeepCollectionEquality()
                .equals(other._searchToken, _searchToken) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            const DeepCollectionEquality().equals(other._userName, _userName) &&
            const DeepCollectionEquality()
                .equals(other._walletAddresses, _walletAddresses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        accountName,
        const DeepCollectionEquality().hash(_bio),
        blockCount,
        const DeepCollectionEquality().hash(createdAt),
        ethAddress,
        followerCount,
        followingCount,
        isNFTicon,
        isOfficial,
        isSuspended,
        const DeepCollectionEquality().hash(_links),
        muteCount,
        postCount,
        const DeepCollectionEquality().hash(ref),
        reportCount,
        score,
        const DeepCollectionEquality().hash(_searchToken),
        uid,
        const DeepCollectionEquality().hash(updatedAt),
        const DeepCollectionEquality().hash(_image),
        const DeepCollectionEquality().hash(_userName),
        const DeepCollectionEquality().hash(_walletAddresses)
      ]);

  @override
  String toString() {
    return 'PublicUser(accountName: $accountName, bio: $bio, blockCount: $blockCount, createdAt: $createdAt, ethAddress: $ethAddress, followerCount: $followerCount, followingCount: $followingCount, isNFTicon: $isNFTicon, isOfficial: $isOfficial, isSuspended: $isSuspended, links: $links, muteCount: $muteCount, postCount: $postCount, ref: $ref, reportCount: $reportCount, score: $score, searchToken: $searchToken, uid: $uid, updatedAt: $updatedAt, image: $image, userName: $userName, walletAddresses: $walletAddresses)';
  }
}

/// @nodoc
abstract mixin class _$PublicUserCopyWith<$Res>
    implements $PublicUserCopyWith<$Res> {
  factory _$PublicUserCopyWith(
          _PublicUser value, $Res Function(_PublicUser) _then) =
      __$PublicUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String accountName,
      SDMap bio,
      int blockCount,
      dynamic createdAt,
      String ethAddress,
      int followerCount,
      int followingCount,
      bool isNFTicon,
      bool isOfficial,
      bool isSuspended,
      List<SDMap> links,
      int muteCount,
      int postCount,
      dynamic ref,
      int reportCount,
      double score,
      SDMap searchToken,
      String uid,
      dynamic updatedAt,
      SDMap image,
      SDMap userName,
      List<SDMap> walletAddresses});
}

/// @nodoc
class __$PublicUserCopyWithImpl<$Res> implements _$PublicUserCopyWith<$Res> {
  __$PublicUserCopyWithImpl(this._self, this._then);

  final _PublicUser _self;
  final $Res Function(_PublicUser) _then;

  /// Create a copy of PublicUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accountName = null,
    Object? bio = null,
    Object? blockCount = null,
    Object? createdAt = freezed,
    Object? ethAddress = null,
    Object? followerCount = null,
    Object? followingCount = null,
    Object? isNFTicon = null,
    Object? isOfficial = null,
    Object? isSuspended = null,
    Object? links = null,
    Object? muteCount = null,
    Object? postCount = null,
    Object? ref = freezed,
    Object? reportCount = null,
    Object? score = null,
    Object? searchToken = null,
    Object? uid = null,
    Object? updatedAt = freezed,
    Object? image = null,
    Object? userName = null,
    Object? walletAddresses = null,
  }) {
    return _then(_PublicUser(
      accountName: null == accountName
          ? _self.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _self._bio
          : bio // ignore: cast_nullable_to_non_nullable
              as SDMap,
      blockCount: null == blockCount
          ? _self.blockCount
          : blockCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ethAddress: null == ethAddress
          ? _self.ethAddress
          : ethAddress // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: null == followerCount
          ? _self.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _self.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      isNFTicon: null == isNFTicon
          ? _self.isNFTicon
          : isNFTicon // ignore: cast_nullable_to_non_nullable
              as bool,
      isOfficial: null == isOfficial
          ? _self.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _self.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      links: null == links
          ? _self._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<SDMap>,
      muteCount: null == muteCount
          ? _self.muteCount
          : muteCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _self.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      ref: freezed == ref
          ? _self.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reportCount: null == reportCount
          ? _self.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _self.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      searchToken: null == searchToken
          ? _self._searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as SDMap,
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      image: null == image
          ? _self._image
          : image // ignore: cast_nullable_to_non_nullable
              as SDMap,
      userName: null == userName
          ? _self._userName
          : userName // ignore: cast_nullable_to_non_nullable
              as SDMap,
      walletAddresses: null == walletAddresses
          ? _self._walletAddresses
          : walletAddresses // ignore: cast_nullable_to_non_nullable
              as List<SDMap>,
    ));
  }
}

// dart format on
