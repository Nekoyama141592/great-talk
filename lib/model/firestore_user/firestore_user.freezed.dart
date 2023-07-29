// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firestore_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FirestoreUser _$FirestoreUserFromJson(Map<String, dynamic> json) {
  return _FirestoreUser.fromJson(json);
}

/// @nodoc
mixin _$FirestoreUser {
  String get accountName => throw _privateConstructorUsedError;
  DetectedText get bio => throw _privateConstructorUsedError;
  int get blockCount => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get ethAddress => throw _privateConstructorUsedError;
  int get followerCount => throw _privateConstructorUsedError;
  int get followingCount => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;
  bool get isNFTicon => throw _privateConstructorUsedError;
  bool get isOfficial => throw _privateConstructorUsedError;
  bool get isSuspended => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get links =>
      throw _privateConstructorUsedError; // TODO: クラスにしろ
  int get muteCount => throw _privateConstructorUsedError;
  Map<String, dynamic> get nftIconInfo =>
      throw _privateConstructorUsedError; // TODO: クラスにしろ
  int get postCount => throw _privateConstructorUsedError;
  dynamic get ref => throw _privateConstructorUsedError;
  int get reportCount => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  Map<String, dynamic> get searchToken => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  dynamic get updatedAt => throw _privateConstructorUsedError;
  DetectedImage get userImage => throw _privateConstructorUsedError;
  DetectedText get userName => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get walletAddresses =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirestoreUserCopyWith<FirestoreUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreUserCopyWith<$Res> {
  factory $FirestoreUserCopyWith(
          FirestoreUser value, $Res Function(FirestoreUser) then) =
      _$FirestoreUserCopyWithImpl<$Res, FirestoreUser>;
  @useResult
  $Res call(
      {String accountName,
      DetectedText bio,
      int blockCount,
      dynamic createdAt,
      String ethAddress,
      int followerCount,
      int followingCount,
      bool isAdmin,
      bool isNFTicon,
      bool isOfficial,
      bool isSuspended,
      List<Map<String, dynamic>> links,
      int muteCount,
      Map<String, dynamic> nftIconInfo,
      int postCount,
      dynamic ref,
      int reportCount,
      double score,
      Map<String, dynamic> searchToken,
      String uid,
      dynamic updatedAt,
      DetectedImage userImage,
      DetectedText userName,
      List<Map<String, dynamic>> walletAddresses});

  $DetectedTextCopyWith<$Res> get bio;
  $DetectedImageCopyWith<$Res> get userImage;
  $DetectedTextCopyWith<$Res> get userName;
}

/// @nodoc
class _$FirestoreUserCopyWithImpl<$Res, $Val extends FirestoreUser>
    implements $FirestoreUserCopyWith<$Res> {
  _$FirestoreUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? isAdmin = null,
    Object? isNFTicon = null,
    Object? isOfficial = null,
    Object? isSuspended = null,
    Object? links = null,
    Object? muteCount = null,
    Object? nftIconInfo = null,
    Object? postCount = null,
    Object? ref = freezed,
    Object? reportCount = null,
    Object? score = null,
    Object? searchToken = null,
    Object? uid = null,
    Object? updatedAt = freezed,
    Object? userImage = null,
    Object? userName = null,
    Object? walletAddresses = null,
  }) {
    return _then(_value.copyWith(
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as DetectedText,
      blockCount: null == blockCount
          ? _value.blockCount
          : blockCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ethAddress: null == ethAddress
          ? _value.ethAddress
          : ethAddress // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isNFTicon: null == isNFTicon
          ? _value.isNFTicon
          : isNFTicon // ignore: cast_nullable_to_non_nullable
              as bool,
      isOfficial: null == isOfficial
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      muteCount: null == muteCount
          ? _value.muteCount
          : muteCount // ignore: cast_nullable_to_non_nullable
              as int,
      nftIconInfo: null == nftIconInfo
          ? _value.nftIconInfo
          : nftIconInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reportCount: null == reportCount
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      searchToken: null == searchToken
          ? _value.searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as DetectedImage,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as DetectedText,
      walletAddresses: null == walletAddresses
          ? _value.walletAddresses
          : walletAddresses // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetectedTextCopyWith<$Res> get bio {
    return $DetectedTextCopyWith<$Res>(_value.bio, (value) {
      return _then(_value.copyWith(bio: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DetectedImageCopyWith<$Res> get userImage {
    return $DetectedImageCopyWith<$Res>(_value.userImage, (value) {
      return _then(_value.copyWith(userImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DetectedTextCopyWith<$Res> get userName {
    return $DetectedTextCopyWith<$Res>(_value.userName, (value) {
      return _then(_value.copyWith(userName: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FirestoreUserCopyWith<$Res>
    implements $FirestoreUserCopyWith<$Res> {
  factory _$$_FirestoreUserCopyWith(
          _$_FirestoreUser value, $Res Function(_$_FirestoreUser) then) =
      __$$_FirestoreUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String accountName,
      DetectedText bio,
      int blockCount,
      dynamic createdAt,
      String ethAddress,
      int followerCount,
      int followingCount,
      bool isAdmin,
      bool isNFTicon,
      bool isOfficial,
      bool isSuspended,
      List<Map<String, dynamic>> links,
      int muteCount,
      Map<String, dynamic> nftIconInfo,
      int postCount,
      dynamic ref,
      int reportCount,
      double score,
      Map<String, dynamic> searchToken,
      String uid,
      dynamic updatedAt,
      DetectedImage userImage,
      DetectedText userName,
      List<Map<String, dynamic>> walletAddresses});

  @override
  $DetectedTextCopyWith<$Res> get bio;
  @override
  $DetectedImageCopyWith<$Res> get userImage;
  @override
  $DetectedTextCopyWith<$Res> get userName;
}

/// @nodoc
class __$$_FirestoreUserCopyWithImpl<$Res>
    extends _$FirestoreUserCopyWithImpl<$Res, _$_FirestoreUser>
    implements _$$_FirestoreUserCopyWith<$Res> {
  __$$_FirestoreUserCopyWithImpl(
      _$_FirestoreUser _value, $Res Function(_$_FirestoreUser) _then)
      : super(_value, _then);

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
    Object? isAdmin = null,
    Object? isNFTicon = null,
    Object? isOfficial = null,
    Object? isSuspended = null,
    Object? links = null,
    Object? muteCount = null,
    Object? nftIconInfo = null,
    Object? postCount = null,
    Object? ref = freezed,
    Object? reportCount = null,
    Object? score = null,
    Object? searchToken = null,
    Object? uid = null,
    Object? updatedAt = freezed,
    Object? userImage = null,
    Object? userName = null,
    Object? walletAddresses = null,
  }) {
    return _then(_$_FirestoreUser(
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as DetectedText,
      blockCount: null == blockCount
          ? _value.blockCount
          : blockCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ethAddress: null == ethAddress
          ? _value.ethAddress
          : ethAddress // ignore: cast_nullable_to_non_nullable
              as String,
      followerCount: null == followerCount
          ? _value.followerCount
          : followerCount // ignore: cast_nullable_to_non_nullable
              as int,
      followingCount: null == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      isNFTicon: null == isNFTicon
          ? _value.isNFTicon
          : isNFTicon // ignore: cast_nullable_to_non_nullable
              as bool,
      isOfficial: null == isOfficial
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      muteCount: null == muteCount
          ? _value.muteCount
          : muteCount // ignore: cast_nullable_to_non_nullable
              as int,
      nftIconInfo: null == nftIconInfo
          ? _value._nftIconInfo
          : nftIconInfo // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
      reportCount: null == reportCount
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      searchToken: null == searchToken
          ? _value._searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as DetectedImage,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as DetectedText,
      walletAddresses: null == walletAddresses
          ? _value._walletAddresses
          : walletAddresses // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FirestoreUser extends _FirestoreUser {
  _$_FirestoreUser(
      {required this.accountName,
      required this.bio,
      required this.blockCount,
      required this.createdAt,
      required this.ethAddress,
      required this.followerCount,
      required this.followingCount,
      required this.isAdmin,
      required this.isNFTicon,
      required this.isOfficial,
      required this.isSuspended,
      required final List<Map<String, dynamic>> links,
      required this.muteCount,
      required final Map<String, dynamic> nftIconInfo,
      required this.postCount,
      required this.ref,
      required this.reportCount,
      required this.score,
      required final Map<String, dynamic> searchToken,
      required this.uid,
      required this.updatedAt,
      required this.userImage,
      required this.userName,
      required final List<Map<String, dynamic>> walletAddresses})
      : _links = links,
        _nftIconInfo = nftIconInfo,
        _searchToken = searchToken,
        _walletAddresses = walletAddresses,
        super._();

  factory _$_FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$$_FirestoreUserFromJson(json);

  @override
  final String accountName;
  @override
  final DetectedText bio;
  @override
  final int blockCount;
  @override
  final dynamic createdAt;
  @override
  final String ethAddress;
  @override
  final int followerCount;
  @override
  final int followingCount;
  @override
  final bool isAdmin;
  @override
  final bool isNFTicon;
  @override
  final bool isOfficial;
  @override
  final bool isSuspended;
  final List<Map<String, dynamic>> _links;
  @override
  List<Map<String, dynamic>> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

// TODO: クラスにしろ
  @override
  final int muteCount;
  final Map<String, dynamic> _nftIconInfo;
  @override
  Map<String, dynamic> get nftIconInfo {
    if (_nftIconInfo is EqualUnmodifiableMapView) return _nftIconInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_nftIconInfo);
  }

// TODO: クラスにしろ
  @override
  final int postCount;
  @override
  final dynamic ref;
  @override
  final int reportCount;
  @override
  final double score;
  final Map<String, dynamic> _searchToken;
  @override
  Map<String, dynamic> get searchToken {
    if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_searchToken);
  }

  @override
  final String uid;
  @override
  final dynamic updatedAt;
  @override
  final DetectedImage userImage;
  @override
  final DetectedText userName;
  final List<Map<String, dynamic>> _walletAddresses;
  @override
  List<Map<String, dynamic>> get walletAddresses {
    if (_walletAddresses is EqualUnmodifiableListView) return _walletAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walletAddresses);
  }

  @override
  String toString() {
    return 'FirestoreUser(accountName: $accountName, bio: $bio, blockCount: $blockCount, createdAt: $createdAt, ethAddress: $ethAddress, followerCount: $followerCount, followingCount: $followingCount, isAdmin: $isAdmin, isNFTicon: $isNFTicon, isOfficial: $isOfficial, isSuspended: $isSuspended, links: $links, muteCount: $muteCount, nftIconInfo: $nftIconInfo, postCount: $postCount, ref: $ref, reportCount: $reportCount, score: $score, searchToken: $searchToken, uid: $uid, updatedAt: $updatedAt, userImage: $userImage, userName: $userName, walletAddresses: $walletAddresses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FirestoreUser &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.blockCount, blockCount) ||
                other.blockCount == blockCount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.ethAddress, ethAddress) ||
                other.ethAddress == ethAddress) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.isNFTicon, isNFTicon) ||
                other.isNFTicon == isNFTicon) &&
            (identical(other.isOfficial, isOfficial) ||
                other.isOfficial == isOfficial) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            (identical(other.muteCount, muteCount) ||
                other.muteCount == muteCount) &&
            const DeepCollectionEquality()
                .equals(other._nftIconInfo, _nftIconInfo) &&
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
            (identical(other.userImage, userImage) ||
                other.userImage == userImage) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            const DeepCollectionEquality()
                .equals(other._walletAddresses, _walletAddresses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        accountName,
        bio,
        blockCount,
        const DeepCollectionEquality().hash(createdAt),
        ethAddress,
        followerCount,
        followingCount,
        isAdmin,
        isNFTicon,
        isOfficial,
        isSuspended,
        const DeepCollectionEquality().hash(_links),
        muteCount,
        const DeepCollectionEquality().hash(_nftIconInfo),
        postCount,
        const DeepCollectionEquality().hash(ref),
        reportCount,
        score,
        const DeepCollectionEquality().hash(_searchToken),
        uid,
        const DeepCollectionEquality().hash(updatedAt),
        userImage,
        userName,
        const DeepCollectionEquality().hash(_walletAddresses)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FirestoreUserCopyWith<_$_FirestoreUser> get copyWith =>
      __$$_FirestoreUserCopyWithImpl<_$_FirestoreUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FirestoreUserToJson(
      this,
    );
  }
}

abstract class _FirestoreUser extends FirestoreUser {
  factory _FirestoreUser(
          {required final String accountName,
          required final DetectedText bio,
          required final int blockCount,
          required final dynamic createdAt,
          required final String ethAddress,
          required final int followerCount,
          required final int followingCount,
          required final bool isAdmin,
          required final bool isNFTicon,
          required final bool isOfficial,
          required final bool isSuspended,
          required final List<Map<String, dynamic>> links,
          required final int muteCount,
          required final Map<String, dynamic> nftIconInfo,
          required final int postCount,
          required final dynamic ref,
          required final int reportCount,
          required final double score,
          required final Map<String, dynamic> searchToken,
          required final String uid,
          required final dynamic updatedAt,
          required final DetectedImage userImage,
          required final DetectedText userName,
          required final List<Map<String, dynamic>> walletAddresses}) =
      _$_FirestoreUser;
  _FirestoreUser._() : super._();

  factory _FirestoreUser.fromJson(Map<String, dynamic> json) =
      _$_FirestoreUser.fromJson;

  @override
  String get accountName;
  @override
  DetectedText get bio;
  @override
  int get blockCount;
  @override
  dynamic get createdAt;
  @override
  String get ethAddress;
  @override
  int get followerCount;
  @override
  int get followingCount;
  @override
  bool get isAdmin;
  @override
  bool get isNFTicon;
  @override
  bool get isOfficial;
  @override
  bool get isSuspended;
  @override
  List<Map<String, dynamic>> get links;
  @override // TODO: クラスにしろ
  int get muteCount;
  @override
  Map<String, dynamic> get nftIconInfo;
  @override // TODO: クラスにしろ
  int get postCount;
  @override
  dynamic get ref;
  @override
  int get reportCount;
  @override
  double get score;
  @override
  Map<String, dynamic> get searchToken;
  @override
  String get uid;
  @override
  dynamic get updatedAt;
  @override
  DetectedImage get userImage;
  @override
  DetectedText get userName;
  @override
  List<Map<String, dynamic>> get walletAddresses;
  @override
  @JsonKey(ignore: true)
  _$$_FirestoreUserCopyWith<_$_FirestoreUser> get copyWith =>
      throw _privateConstructorUsedError;
}