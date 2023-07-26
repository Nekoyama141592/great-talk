// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get descriptionLanguageCode => throw _privateConstructorUsedError;
  double get descriptionNegativeScore => throw _privateConstructorUsedError;
  Map<String, dynamic> get exampleTexts =>
      throw _privateConstructorUsedError; // TODO: クラスにしろ
  String get genre => throw _privateConstructorUsedError;
  List<String> get hashTags => throw _privateConstructorUsedError;
  int get impressionCount => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get links =>
      throw _privateConstructorUsedError; // TODO: クラスにしろ,
  int get msgCount => throw _privateConstructorUsedError;
  OriginalUser get poster => throw _privateConstructorUsedError;
  String get postState => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  int get reportCount => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  String get storagePostName => throw _privateConstructorUsedError;
  Map<String, dynamic> get searchToken => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titleLanguageCode => throw _privateConstructorUsedError;
  double get titleNegativeScore => throw _privateConstructorUsedError;
  dynamic get updatedAt => throw _privateConstructorUsedError;
  int get userCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {dynamic createdAt,
      String description,
      String descriptionLanguageCode,
      double descriptionNegativeScore,
      Map<String, dynamic> exampleTexts,
      String genre,
      List<String> hashTags,
      int impressionCount,
      int likeCount,
      List<Map<String, dynamic>> links,
      int msgCount,
      OriginalUser poster,
      String postState,
      String postId,
      int reportCount,
      double score,
      String storagePostName,
      Map<String, dynamic> searchToken,
      String title,
      String titleLanguageCode,
      double titleNegativeScore,
      dynamic updatedAt,
      int userCount});

  $OriginalUserCopyWith<$Res> get poster;
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? description = null,
    Object? descriptionLanguageCode = null,
    Object? descriptionNegativeScore = null,
    Object? exampleTexts = null,
    Object? genre = null,
    Object? hashTags = null,
    Object? impressionCount = null,
    Object? likeCount = null,
    Object? links = null,
    Object? msgCount = null,
    Object? poster = null,
    Object? postState = null,
    Object? postId = null,
    Object? reportCount = null,
    Object? score = null,
    Object? storagePostName = null,
    Object? searchToken = null,
    Object? title = null,
    Object? titleLanguageCode = null,
    Object? titleNegativeScore = null,
    Object? updatedAt = freezed,
    Object? userCount = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionLanguageCode: null == descriptionLanguageCode
          ? _value.descriptionLanguageCode
          : descriptionLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionNegativeScore: null == descriptionNegativeScore
          ? _value.descriptionNegativeScore
          : descriptionNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      exampleTexts: null == exampleTexts
          ? _value.exampleTexts
          : exampleTexts // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      hashTags: null == hashTags
          ? _value.hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      impressionCount: null == impressionCount
          ? _value.impressionCount
          : impressionCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      msgCount: null == msgCount
          ? _value.msgCount
          : msgCount // ignore: cast_nullable_to_non_nullable
              as int,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as OriginalUser,
      postState: null == postState
          ? _value.postState
          : postState // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      reportCount: null == reportCount
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      storagePostName: null == storagePostName
          ? _value.storagePostName
          : storagePostName // ignore: cast_nullable_to_non_nullable
              as String,
      searchToken: null == searchToken
          ? _value.searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleLanguageCode: null == titleLanguageCode
          ? _value.titleLanguageCode
          : titleLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      titleNegativeScore: null == titleNegativeScore
          ? _value.titleNegativeScore
          : titleNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userCount: null == userCount
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OriginalUserCopyWith<$Res> get poster {
    return $OriginalUserCopyWith<$Res>(_value.poster, (value) {
      return _then(_value.copyWith(poster: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      String description,
      String descriptionLanguageCode,
      double descriptionNegativeScore,
      Map<String, dynamic> exampleTexts,
      String genre,
      List<String> hashTags,
      int impressionCount,
      int likeCount,
      List<Map<String, dynamic>> links,
      int msgCount,
      OriginalUser poster,
      String postState,
      String postId,
      int reportCount,
      double score,
      String storagePostName,
      Map<String, dynamic> searchToken,
      String title,
      String titleLanguageCode,
      double titleNegativeScore,
      dynamic updatedAt,
      int userCount});

  @override
  $OriginalUserCopyWith<$Res> get poster;
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res, _$_Post>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? description = null,
    Object? descriptionLanguageCode = null,
    Object? descriptionNegativeScore = null,
    Object? exampleTexts = null,
    Object? genre = null,
    Object? hashTags = null,
    Object? impressionCount = null,
    Object? likeCount = null,
    Object? links = null,
    Object? msgCount = null,
    Object? poster = null,
    Object? postState = null,
    Object? postId = null,
    Object? reportCount = null,
    Object? score = null,
    Object? storagePostName = null,
    Object? searchToken = null,
    Object? title = null,
    Object? titleLanguageCode = null,
    Object? titleNegativeScore = null,
    Object? updatedAt = freezed,
    Object? userCount = null,
  }) {
    return _then(_$_Post(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionLanguageCode: null == descriptionLanguageCode
          ? _value.descriptionLanguageCode
          : descriptionLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionNegativeScore: null == descriptionNegativeScore
          ? _value.descriptionNegativeScore
          : descriptionNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      exampleTexts: null == exampleTexts
          ? _value._exampleTexts
          : exampleTexts // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      hashTags: null == hashTags
          ? _value._hashTags
          : hashTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      impressionCount: null == impressionCount
          ? _value.impressionCount
          : impressionCount // ignore: cast_nullable_to_non_nullable
              as int,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      msgCount: null == msgCount
          ? _value.msgCount
          : msgCount // ignore: cast_nullable_to_non_nullable
              as int,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as OriginalUser,
      postState: null == postState
          ? _value.postState
          : postState // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      reportCount: null == reportCount
          ? _value.reportCount
          : reportCount // ignore: cast_nullable_to_non_nullable
              as int,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      storagePostName: null == storagePostName
          ? _value.storagePostName
          : storagePostName // ignore: cast_nullable_to_non_nullable
              as String,
      searchToken: null == searchToken
          ? _value._searchToken
          : searchToken // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleLanguageCode: null == titleLanguageCode
          ? _value.titleLanguageCode
          : titleLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      titleNegativeScore: null == titleNegativeScore
          ? _value.titleNegativeScore
          : titleNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userCount: null == userCount
          ? _value.userCount
          : userCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  const _$_Post(
      {required this.createdAt,
      required this.description,
      required this.descriptionLanguageCode,
      required this.descriptionNegativeScore,
      required final Map<String, dynamic> exampleTexts,
      required this.genre,
      required final List<String> hashTags,
      required this.impressionCount,
      required this.likeCount,
      required final List<Map<String, dynamic>> links,
      required this.msgCount,
      required this.poster,
      required this.postState,
      required this.postId,
      required this.reportCount,
      required this.score,
      required this.storagePostName,
      required final Map<String, dynamic> searchToken,
      required this.title,
      required this.titleLanguageCode,
      required this.titleNegativeScore,
      required this.updatedAt,
      required this.userCount})
      : _exampleTexts = exampleTexts,
        _hashTags = hashTags,
        _links = links,
        _searchToken = searchToken;

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  final dynamic createdAt;
  @override
  final String description;
  @override
  final String descriptionLanguageCode;
  @override
  final double descriptionNegativeScore;
  final Map<String, dynamic> _exampleTexts;
  @override
  Map<String, dynamic> get exampleTexts {
    if (_exampleTexts is EqualUnmodifiableMapView) return _exampleTexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_exampleTexts);
  }

// TODO: クラスにしろ
  @override
  final String genre;
  final List<String> _hashTags;
  @override
  List<String> get hashTags {
    if (_hashTags is EqualUnmodifiableListView) return _hashTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashTags);
  }

  @override
  final int impressionCount;
  @override
  final int likeCount;
  final List<Map<String, dynamic>> _links;
  @override
  List<Map<String, dynamic>> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

// TODO: クラスにしろ,
  @override
  final int msgCount;
  @override
  final OriginalUser poster;
  @override
  final String postState;
  @override
  final String postId;
  @override
  final int reportCount;
  @override
  final double score;
  @override
  final String storagePostName;
  final Map<String, dynamic> _searchToken;
  @override
  Map<String, dynamic> get searchToken {
    if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_searchToken);
  }

  @override
  final String title;
  @override
  final String titleLanguageCode;
  @override
  final double titleNegativeScore;
  @override
  final dynamic updatedAt;
  @override
  final int userCount;

  @override
  String toString() {
    return 'Post(createdAt: $createdAt, description: $description, descriptionLanguageCode: $descriptionLanguageCode, descriptionNegativeScore: $descriptionNegativeScore, exampleTexts: $exampleTexts, genre: $genre, hashTags: $hashTags, impressionCount: $impressionCount, likeCount: $likeCount, links: $links, msgCount: $msgCount, poster: $poster, postState: $postState, postId: $postId, reportCount: $reportCount, score: $score, storagePostName: $storagePostName, searchToken: $searchToken, title: $title, titleLanguageCode: $titleLanguageCode, titleNegativeScore: $titleNegativeScore, updatedAt: $updatedAt, userCount: $userCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(
                    other.descriptionLanguageCode, descriptionLanguageCode) ||
                other.descriptionLanguageCode == descriptionLanguageCode) &&
            (identical(
                    other.descriptionNegativeScore, descriptionNegativeScore) ||
                other.descriptionNegativeScore == descriptionNegativeScore) &&
            const DeepCollectionEquality()
                .equals(other._exampleTexts, _exampleTexts) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            const DeepCollectionEquality().equals(other._hashTags, _hashTags) &&
            (identical(other.impressionCount, impressionCount) ||
                other.impressionCount == impressionCount) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            (identical(other.msgCount, msgCount) ||
                other.msgCount == msgCount) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.postState, postState) ||
                other.postState == postState) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.reportCount, reportCount) ||
                other.reportCount == reportCount) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.storagePostName, storagePostName) ||
                other.storagePostName == storagePostName) &&
            const DeepCollectionEquality()
                .equals(other._searchToken, _searchToken) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleLanguageCode, titleLanguageCode) ||
                other.titleLanguageCode == titleLanguageCode) &&
            (identical(other.titleNegativeScore, titleNegativeScore) ||
                other.titleNegativeScore == titleNegativeScore) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            (identical(other.userCount, userCount) ||
                other.userCount == userCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(createdAt),
        description,
        descriptionLanguageCode,
        descriptionNegativeScore,
        const DeepCollectionEquality().hash(_exampleTexts),
        genre,
        const DeepCollectionEquality().hash(_hashTags),
        impressionCount,
        likeCount,
        const DeepCollectionEquality().hash(_links),
        msgCount,
        poster,
        postState,
        postId,
        reportCount,
        score,
        storagePostName,
        const DeepCollectionEquality().hash(_searchToken),
        title,
        titleLanguageCode,
        titleNegativeScore,
        const DeepCollectionEquality().hash(updatedAt),
        userCount
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required final dynamic createdAt,
      required final String description,
      required final String descriptionLanguageCode,
      required final double descriptionNegativeScore,
      required final Map<String, dynamic> exampleTexts,
      required final String genre,
      required final List<String> hashTags,
      required final int impressionCount,
      required final int likeCount,
      required final List<Map<String, dynamic>> links,
      required final int msgCount,
      required final OriginalUser poster,
      required final String postState,
      required final String postId,
      required final int reportCount,
      required final double score,
      required final String storagePostName,
      required final Map<String, dynamic> searchToken,
      required final String title,
      required final String titleLanguageCode,
      required final double titleNegativeScore,
      required final dynamic updatedAt,
      required final int userCount}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  dynamic get createdAt;
  @override
  String get description;
  @override
  String get descriptionLanguageCode;
  @override
  double get descriptionNegativeScore;
  @override
  Map<String, dynamic> get exampleTexts;
  @override // TODO: クラスにしろ
  String get genre;
  @override
  List<String> get hashTags;
  @override
  int get impressionCount;
  @override
  int get likeCount;
  @override
  List<Map<String, dynamic>> get links;
  @override // TODO: クラスにしろ,
  int get msgCount;
  @override
  OriginalUser get poster;
  @override
  String get postState;
  @override
  String get postId;
  @override
  int get reportCount;
  @override
  double get score;
  @override
  String get storagePostName;
  @override
  Map<String, dynamic> get searchToken;
  @override
  String get title;
  @override
  String get titleLanguageCode;
  @override
  double get titleNegativeScore;
  @override
  dynamic get updatedAt;
  @override
  int get userCount;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
