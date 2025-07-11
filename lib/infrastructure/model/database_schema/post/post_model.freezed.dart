// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostModel {

 int get bookmarkCount; dynamic get createdAt; Map<String, dynamic> get customCompleteText;@DetectedTextConverter() DetectedText get description; List<Map<String, dynamic>> get exampleTexts; String get genre; List<String> get hashTags;@ModeratedImageConverter() ModeratedImage get image; int get impressionCount; int get likeCount; List<Map<String, dynamic>> get links; int get msgCount; int get muteCount; String get postId; int get reportCount; double get score; Map<String, dynamic> get searchToken;@DetectedTextConverter() DetectedText get title; String get uid; dynamic get updatedAt; int get userCount;
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostModelCopyWith<PostModel> get copyWith => _$PostModelCopyWithImpl<PostModel>(this as PostModel, _$identity);

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostModel&&(identical(other.bookmarkCount, bookmarkCount) || other.bookmarkCount == bookmarkCount)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&const DeepCollectionEquality().equals(other.customCompleteText, customCompleteText)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.exampleTexts, exampleTexts)&&(identical(other.genre, genre) || other.genre == genre)&&const DeepCollectionEquality().equals(other.hashTags, hashTags)&&(identical(other.image, image) || other.image == image)&&(identical(other.impressionCount, impressionCount) || other.impressionCount == impressionCount)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.msgCount, msgCount) || other.msgCount == msgCount)&&(identical(other.muteCount, muteCount) || other.muteCount == muteCount)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.searchToken, searchToken)&&(identical(other.title, title) || other.title == title)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt)&&(identical(other.userCount, userCount) || other.userCount == userCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,bookmarkCount,const DeepCollectionEquality().hash(createdAt),const DeepCollectionEquality().hash(customCompleteText),description,const DeepCollectionEquality().hash(exampleTexts),genre,const DeepCollectionEquality().hash(hashTags),image,impressionCount,likeCount,const DeepCollectionEquality().hash(links),msgCount,muteCount,postId,reportCount,score,const DeepCollectionEquality().hash(searchToken),title,uid,const DeepCollectionEquality().hash(updatedAt),userCount]);

@override
String toString() {
  return 'PostModel(bookmarkCount: $bookmarkCount, createdAt: $createdAt, customCompleteText: $customCompleteText, description: $description, exampleTexts: $exampleTexts, genre: $genre, hashTags: $hashTags, image: $image, impressionCount: $impressionCount, likeCount: $likeCount, links: $links, msgCount: $msgCount, muteCount: $muteCount, postId: $postId, reportCount: $reportCount, score: $score, searchToken: $searchToken, title: $title, uid: $uid, updatedAt: $updatedAt, userCount: $userCount)';
}


}

/// @nodoc
abstract mixin class $PostModelCopyWith<$Res>  {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) _then) = _$PostModelCopyWithImpl;
@useResult
$Res call({
 int bookmarkCount, dynamic createdAt, Map<String, dynamic> customCompleteText,@DetectedTextConverter() DetectedText description, List<Map<String, dynamic>> exampleTexts, String genre, List<String> hashTags,@ModeratedImageConverter() ModeratedImage image, int impressionCount, int likeCount, List<Map<String, dynamic>> links, int msgCount, int muteCount, String postId, int reportCount, double score, Map<String, dynamic> searchToken,@DetectedTextConverter() DetectedText title, String uid, dynamic updatedAt, int userCount
});


$DetectedTextCopyWith<$Res> get description;$ModeratedImageCopyWith<$Res> get image;$DetectedTextCopyWith<$Res> get title;

}
/// @nodoc
class _$PostModelCopyWithImpl<$Res>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._self, this._then);

  final PostModel _self;
  final $Res Function(PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookmarkCount = null,Object? createdAt = freezed,Object? customCompleteText = null,Object? description = null,Object? exampleTexts = null,Object? genre = null,Object? hashTags = null,Object? image = null,Object? impressionCount = null,Object? likeCount = null,Object? links = null,Object? msgCount = null,Object? muteCount = null,Object? postId = null,Object? reportCount = null,Object? score = null,Object? searchToken = null,Object? title = null,Object? uid = null,Object? updatedAt = freezed,Object? userCount = null,}) {
  return _then(_self.copyWith(
bookmarkCount: null == bookmarkCount ? _self.bookmarkCount : bookmarkCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,customCompleteText: null == customCompleteText ? _self.customCompleteText : customCompleteText // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as DetectedText,exampleTexts: null == exampleTexts ? _self.exampleTexts : exampleTexts // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String,hashTags: null == hashTags ? _self.hashTags : hashTags // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ModeratedImage,impressionCount: null == impressionCount ? _self.impressionCount : impressionCount // ignore: cast_nullable_to_non_nullable
as int,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,msgCount: null == msgCount ? _self.msgCount : msgCount // ignore: cast_nullable_to_non_nullable
as int,muteCount: null == muteCount ? _self.muteCount : muteCount // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,reportCount: null == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,searchToken: null == searchToken ? _self.searchToken : searchToken // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as DetectedText,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,userCount: null == userCount ? _self.userCount : userCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get description {
  
  return $DetectedTextCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModeratedImageCopyWith<$Res> get image {
  
  return $ModeratedImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get title {
  
  return $DetectedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _PostModel extends PostModel {
  const _PostModel({this.bookmarkCount = 0, required this.createdAt, required final  Map<String, dynamic> customCompleteText, @DetectedTextConverter() required this.description, final  List<Map<String, dynamic>> exampleTexts = const [], this.genre = "", final  List<String> hashTags = const [], @ModeratedImageConverter() required this.image, this.impressionCount = 0, this.likeCount = 0, final  List<Map<String, dynamic>> links = const [], this.msgCount = 0, this.muteCount = 0, required this.postId, this.reportCount = 0, this.score = 0.0, required final  Map<String, dynamic> searchToken, @DetectedTextConverter() required this.title, required this.uid, required this.updatedAt, this.userCount = 0}): _customCompleteText = customCompleteText,_exampleTexts = exampleTexts,_hashTags = hashTags,_links = links,_searchToken = searchToken,super._();
  factory _PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

@override@JsonKey() final  int bookmarkCount;
@override final  dynamic createdAt;
 final  Map<String, dynamic> _customCompleteText;
@override Map<String, dynamic> get customCompleteText {
  if (_customCompleteText is EqualUnmodifiableMapView) return _customCompleteText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_customCompleteText);
}

@override@DetectedTextConverter() final  DetectedText description;
 final  List<Map<String, dynamic>> _exampleTexts;
@override@JsonKey() List<Map<String, dynamic>> get exampleTexts {
  if (_exampleTexts is EqualUnmodifiableListView) return _exampleTexts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exampleTexts);
}

@override@JsonKey() final  String genre;
 final  List<String> _hashTags;
@override@JsonKey() List<String> get hashTags {
  if (_hashTags is EqualUnmodifiableListView) return _hashTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hashTags);
}

@override@ModeratedImageConverter() final  ModeratedImage image;
@override@JsonKey() final  int impressionCount;
@override@JsonKey() final  int likeCount;
 final  List<Map<String, dynamic>> _links;
@override@JsonKey() List<Map<String, dynamic>> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override@JsonKey() final  int msgCount;
@override@JsonKey() final  int muteCount;
@override final  String postId;
@override@JsonKey() final  int reportCount;
@override@JsonKey() final  double score;
 final  Map<String, dynamic> _searchToken;
@override Map<String, dynamic> get searchToken {
  if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_searchToken);
}

@override@DetectedTextConverter() final  DetectedText title;
@override final  String uid;
@override final  dynamic updatedAt;
@override@JsonKey() final  int userCount;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostModelCopyWith<_PostModel> get copyWith => __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostModel&&(identical(other.bookmarkCount, bookmarkCount) || other.bookmarkCount == bookmarkCount)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&const DeepCollectionEquality().equals(other._customCompleteText, _customCompleteText)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._exampleTexts, _exampleTexts)&&(identical(other.genre, genre) || other.genre == genre)&&const DeepCollectionEquality().equals(other._hashTags, _hashTags)&&(identical(other.image, image) || other.image == image)&&(identical(other.impressionCount, impressionCount) || other.impressionCount == impressionCount)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.msgCount, msgCount) || other.msgCount == msgCount)&&(identical(other.muteCount, muteCount) || other.muteCount == muteCount)&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._searchToken, _searchToken)&&(identical(other.title, title) || other.title == title)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt)&&(identical(other.userCount, userCount) || other.userCount == userCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,bookmarkCount,const DeepCollectionEquality().hash(createdAt),const DeepCollectionEquality().hash(_customCompleteText),description,const DeepCollectionEquality().hash(_exampleTexts),genre,const DeepCollectionEquality().hash(_hashTags),image,impressionCount,likeCount,const DeepCollectionEquality().hash(_links),msgCount,muteCount,postId,reportCount,score,const DeepCollectionEquality().hash(_searchToken),title,uid,const DeepCollectionEquality().hash(updatedAt),userCount]);

@override
String toString() {
  return 'PostModel(bookmarkCount: $bookmarkCount, createdAt: $createdAt, customCompleteText: $customCompleteText, description: $description, exampleTexts: $exampleTexts, genre: $genre, hashTags: $hashTags, image: $image, impressionCount: $impressionCount, likeCount: $likeCount, links: $links, msgCount: $msgCount, muteCount: $muteCount, postId: $postId, reportCount: $reportCount, score: $score, searchToken: $searchToken, title: $title, uid: $uid, updatedAt: $updatedAt, userCount: $userCount)';
}


}

/// @nodoc
abstract mixin class _$PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(_PostModel value, $Res Function(_PostModel) _then) = __$PostModelCopyWithImpl;
@override @useResult
$Res call({
 int bookmarkCount, dynamic createdAt, Map<String, dynamic> customCompleteText,@DetectedTextConverter() DetectedText description, List<Map<String, dynamic>> exampleTexts, String genre, List<String> hashTags,@ModeratedImageConverter() ModeratedImage image, int impressionCount, int likeCount, List<Map<String, dynamic>> links, int msgCount, int muteCount, String postId, int reportCount, double score, Map<String, dynamic> searchToken,@DetectedTextConverter() DetectedText title, String uid, dynamic updatedAt, int userCount
});


@override $DetectedTextCopyWith<$Res> get description;@override $ModeratedImageCopyWith<$Res> get image;@override $DetectedTextCopyWith<$Res> get title;

}
/// @nodoc
class __$PostModelCopyWithImpl<$Res>
    implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(this._self, this._then);

  final _PostModel _self;
  final $Res Function(_PostModel) _then;

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookmarkCount = null,Object? createdAt = freezed,Object? customCompleteText = null,Object? description = null,Object? exampleTexts = null,Object? genre = null,Object? hashTags = null,Object? image = null,Object? impressionCount = null,Object? likeCount = null,Object? links = null,Object? msgCount = null,Object? muteCount = null,Object? postId = null,Object? reportCount = null,Object? score = null,Object? searchToken = null,Object? title = null,Object? uid = null,Object? updatedAt = freezed,Object? userCount = null,}) {
  return _then(_PostModel(
bookmarkCount: null == bookmarkCount ? _self.bookmarkCount : bookmarkCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,customCompleteText: null == customCompleteText ? _self._customCompleteText : customCompleteText // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as DetectedText,exampleTexts: null == exampleTexts ? _self._exampleTexts : exampleTexts // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String,hashTags: null == hashTags ? _self._hashTags : hashTags // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ModeratedImage,impressionCount: null == impressionCount ? _self.impressionCount : impressionCount // ignore: cast_nullable_to_non_nullable
as int,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,msgCount: null == msgCount ? _self.msgCount : msgCount // ignore: cast_nullable_to_non_nullable
as int,muteCount: null == muteCount ? _self.muteCount : muteCount // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,reportCount: null == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,searchToken: null == searchToken ? _self._searchToken : searchToken // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as DetectedText,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,userCount: null == userCount ? _self.userCount : userCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get description {
  
  return $DetectedTextCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModeratedImageCopyWith<$Res> get image {
  
  return $ModeratedImageCopyWith<$Res>(_self.image, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of PostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetectedTextCopyWith<$Res> get title {
  
  return $DetectedTextCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}
}

// dart format on
