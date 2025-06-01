// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Post {

 int get bookmarkCount; dynamic get createdAt; Map<String,dynamic> get customCompleteText; Map<String,dynamic> get description; List<Map<String,dynamic>> get exampleTexts; String get genre; List<String> get hashTags; Map<String,dynamic> get image; int get impressionCount; int get likeCount; List<Map<String,dynamic>> get links; int get msgCount; int get muteCount; String get postId; dynamic get ref; int get reportCount; double get score; Map<String,dynamic> get searchToken; Map<String,dynamic> get title; String get uid; dynamic get updatedAt; int get userCount;
/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCopyWith<Post> get copyWith => _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Post&&(identical(other.bookmarkCount, bookmarkCount) || other.bookmarkCount == bookmarkCount)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&const DeepCollectionEquality().equals(other.customCompleteText, customCompleteText)&&const DeepCollectionEquality().equals(other.description, description)&&const DeepCollectionEquality().equals(other.exampleTexts, exampleTexts)&&(identical(other.genre, genre) || other.genre == genre)&&const DeepCollectionEquality().equals(other.hashTags, hashTags)&&const DeepCollectionEquality().equals(other.image, image)&&(identical(other.impressionCount, impressionCount) || other.impressionCount == impressionCount)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.msgCount, msgCount) || other.msgCount == msgCount)&&(identical(other.muteCount, muteCount) || other.muteCount == muteCount)&&(identical(other.postId, postId) || other.postId == postId)&&const DeepCollectionEquality().equals(other.ref, ref)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.searchToken, searchToken)&&const DeepCollectionEquality().equals(other.title, title)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt)&&(identical(other.userCount, userCount) || other.userCount == userCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,bookmarkCount,const DeepCollectionEquality().hash(createdAt),const DeepCollectionEquality().hash(customCompleteText),const DeepCollectionEquality().hash(description),const DeepCollectionEquality().hash(exampleTexts),genre,const DeepCollectionEquality().hash(hashTags),const DeepCollectionEquality().hash(image),impressionCount,likeCount,const DeepCollectionEquality().hash(links),msgCount,muteCount,postId,const DeepCollectionEquality().hash(ref),reportCount,score,const DeepCollectionEquality().hash(searchToken),const DeepCollectionEquality().hash(title),uid,const DeepCollectionEquality().hash(updatedAt),userCount]);

@override
String toString() {
  return 'Post(bookmarkCount: $bookmarkCount, createdAt: $createdAt, customCompleteText: $customCompleteText, description: $description, exampleTexts: $exampleTexts, genre: $genre, hashTags: $hashTags, image: $image, impressionCount: $impressionCount, likeCount: $likeCount, links: $links, msgCount: $msgCount, muteCount: $muteCount, postId: $postId, ref: $ref, reportCount: $reportCount, score: $score, searchToken: $searchToken, title: $title, uid: $uid, updatedAt: $updatedAt, userCount: $userCount)';
}


}

/// @nodoc
abstract mixin class $PostCopyWith<$Res>  {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) = _$PostCopyWithImpl;
@useResult
$Res call({
 int bookmarkCount, dynamic createdAt, Map<String,dynamic> customCompleteText, Map<String,dynamic> description, List<Map<String,dynamic>> exampleTexts, String genre, List<String> hashTags, Map<String,dynamic> image, int impressionCount, int likeCount, List<Map<String,dynamic>> links, int msgCount, int muteCount, String postId, dynamic ref, int reportCount, double score, Map<String,dynamic> searchToken, Map<String,dynamic> title, String uid, dynamic updatedAt, int userCount
});




}
/// @nodoc
class _$PostCopyWithImpl<$Res>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bookmarkCount = null,Object? createdAt = freezed,Object? customCompleteText = null,Object? description = null,Object? exampleTexts = null,Object? genre = null,Object? hashTags = null,Object? image = null,Object? impressionCount = null,Object? likeCount = null,Object? links = null,Object? msgCount = null,Object? muteCount = null,Object? postId = null,Object? ref = freezed,Object? reportCount = null,Object? score = null,Object? searchToken = null,Object? title = null,Object? uid = null,Object? updatedAt = freezed,Object? userCount = null,}) {
  return _then(_self.copyWith(
bookmarkCount: null == bookmarkCount ? _self.bookmarkCount : bookmarkCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,customCompleteText: null == customCompleteText ? _self.customCompleteText : customCompleteText // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,exampleTexts: null == exampleTexts ? _self.exampleTexts : exampleTexts // ignore: cast_nullable_to_non_nullable
as List<Map<String,dynamic>>,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String,hashTags: null == hashTags ? _self.hashTags : hashTags // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,impressionCount: null == impressionCount ? _self.impressionCount : impressionCount // ignore: cast_nullable_to_non_nullable
as int,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<Map<String,dynamic>>,msgCount: null == msgCount ? _self.msgCount : msgCount // ignore: cast_nullable_to_non_nullable
as int,muteCount: null == muteCount ? _self.muteCount : muteCount // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,ref: freezed == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as dynamic,reportCount: null == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,searchToken: null == searchToken ? _self.searchToken : searchToken // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,userCount: null == userCount ? _self.userCount : userCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Post extends Post {
  const _Post({this.bookmarkCount = 0, required this.createdAt, required final  Map<String,dynamic> customCompleteText, required final  Map<String,dynamic> description, final  List<Map<String,dynamic>> exampleTexts = const [], this.genre = "", final  List<String> hashTags = const [], required final  Map<String,dynamic> image, this.impressionCount = 0, this.likeCount = 0, final  List<Map<String,dynamic>> links = const [], this.msgCount = 0, this.muteCount = 0, required this.postId, required this.ref, this.reportCount = 0, this.score = 0.0, required final  Map<String,dynamic> searchToken, required final  Map<String,dynamic> title, required this.uid, required this.updatedAt, this.userCount = 0}): _customCompleteText = customCompleteText,_description = description,_exampleTexts = exampleTexts,_hashTags = hashTags,_image = image,_links = links,_searchToken = searchToken,_title = title,super._();
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

@override@JsonKey() final  int bookmarkCount;
@override final  dynamic createdAt;
 final  Map<String,dynamic> _customCompleteText;
@override Map<String,dynamic> get customCompleteText {
  if (_customCompleteText is EqualUnmodifiableMapView) return _customCompleteText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_customCompleteText);
}

 final  Map<String,dynamic> _description;
@override Map<String,dynamic> get description {
  if (_description is EqualUnmodifiableMapView) return _description;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_description);
}

 final  List<Map<String,dynamic>> _exampleTexts;
@override@JsonKey() List<Map<String,dynamic>> get exampleTexts {
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

 final  Map<String,dynamic> _image;
@override Map<String,dynamic> get image {
  if (_image is EqualUnmodifiableMapView) return _image;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_image);
}

@override@JsonKey() final  int impressionCount;
@override@JsonKey() final  int likeCount;
 final  List<Map<String,dynamic>> _links;
@override@JsonKey() List<Map<String,dynamic>> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override@JsonKey() final  int msgCount;
@override@JsonKey() final  int muteCount;
@override final  String postId;
@override final  dynamic ref;
@override@JsonKey() final  int reportCount;
@override@JsonKey() final  double score;
 final  Map<String,dynamic> _searchToken;
@override Map<String,dynamic> get searchToken {
  if (_searchToken is EqualUnmodifiableMapView) return _searchToken;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_searchToken);
}

 final  Map<String,dynamic> _title;
@override Map<String,dynamic> get title {
  if (_title is EqualUnmodifiableMapView) return _title;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_title);
}

@override final  String uid;
@override final  dynamic updatedAt;
@override@JsonKey() final  int userCount;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCopyWith<_Post> get copyWith => __$PostCopyWithImpl<_Post>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Post&&(identical(other.bookmarkCount, bookmarkCount) || other.bookmarkCount == bookmarkCount)&&const DeepCollectionEquality().equals(other.createdAt, createdAt)&&const DeepCollectionEquality().equals(other._customCompleteText, _customCompleteText)&&const DeepCollectionEquality().equals(other._description, _description)&&const DeepCollectionEquality().equals(other._exampleTexts, _exampleTexts)&&(identical(other.genre, genre) || other.genre == genre)&&const DeepCollectionEquality().equals(other._hashTags, _hashTags)&&const DeepCollectionEquality().equals(other._image, _image)&&(identical(other.impressionCount, impressionCount) || other.impressionCount == impressionCount)&&(identical(other.likeCount, likeCount) || other.likeCount == likeCount)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.msgCount, msgCount) || other.msgCount == msgCount)&&(identical(other.muteCount, muteCount) || other.muteCount == muteCount)&&(identical(other.postId, postId) || other.postId == postId)&&const DeepCollectionEquality().equals(other.ref, ref)&&(identical(other.reportCount, reportCount) || other.reportCount == reportCount)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._searchToken, _searchToken)&&const DeepCollectionEquality().equals(other._title, _title)&&(identical(other.uid, uid) || other.uid == uid)&&const DeepCollectionEquality().equals(other.updatedAt, updatedAt)&&(identical(other.userCount, userCount) || other.userCount == userCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,bookmarkCount,const DeepCollectionEquality().hash(createdAt),const DeepCollectionEquality().hash(_customCompleteText),const DeepCollectionEquality().hash(_description),const DeepCollectionEquality().hash(_exampleTexts),genre,const DeepCollectionEquality().hash(_hashTags),const DeepCollectionEquality().hash(_image),impressionCount,likeCount,const DeepCollectionEquality().hash(_links),msgCount,muteCount,postId,const DeepCollectionEquality().hash(ref),reportCount,score,const DeepCollectionEquality().hash(_searchToken),const DeepCollectionEquality().hash(_title),uid,const DeepCollectionEquality().hash(updatedAt),userCount]);

@override
String toString() {
  return 'Post(bookmarkCount: $bookmarkCount, createdAt: $createdAt, customCompleteText: $customCompleteText, description: $description, exampleTexts: $exampleTexts, genre: $genre, hashTags: $hashTags, image: $image, impressionCount: $impressionCount, likeCount: $likeCount, links: $links, msgCount: $msgCount, muteCount: $muteCount, postId: $postId, ref: $ref, reportCount: $reportCount, score: $score, searchToken: $searchToken, title: $title, uid: $uid, updatedAt: $updatedAt, userCount: $userCount)';
}


}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) = __$PostCopyWithImpl;
@override @useResult
$Res call({
 int bookmarkCount, dynamic createdAt, Map<String,dynamic> customCompleteText, Map<String,dynamic> description, List<Map<String,dynamic>> exampleTexts, String genre, List<String> hashTags, Map<String,dynamic> image, int impressionCount, int likeCount, List<Map<String,dynamic>> links, int msgCount, int muteCount, String postId, dynamic ref, int reportCount, double score, Map<String,dynamic> searchToken, Map<String,dynamic> title, String uid, dynamic updatedAt, int userCount
});




}
/// @nodoc
class __$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bookmarkCount = null,Object? createdAt = freezed,Object? customCompleteText = null,Object? description = null,Object? exampleTexts = null,Object? genre = null,Object? hashTags = null,Object? image = null,Object? impressionCount = null,Object? likeCount = null,Object? links = null,Object? msgCount = null,Object? muteCount = null,Object? postId = null,Object? ref = freezed,Object? reportCount = null,Object? score = null,Object? searchToken = null,Object? title = null,Object? uid = null,Object? updatedAt = freezed,Object? userCount = null,}) {
  return _then(_Post(
bookmarkCount: null == bookmarkCount ? _self.bookmarkCount : bookmarkCount // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as dynamic,customCompleteText: null == customCompleteText ? _self._customCompleteText : customCompleteText // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,description: null == description ? _self._description : description // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,exampleTexts: null == exampleTexts ? _self._exampleTexts : exampleTexts // ignore: cast_nullable_to_non_nullable
as List<Map<String,dynamic>>,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String,hashTags: null == hashTags ? _self._hashTags : hashTags // ignore: cast_nullable_to_non_nullable
as List<String>,image: null == image ? _self._image : image // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,impressionCount: null == impressionCount ? _self.impressionCount : impressionCount // ignore: cast_nullable_to_non_nullable
as int,likeCount: null == likeCount ? _self.likeCount : likeCount // ignore: cast_nullable_to_non_nullable
as int,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<Map<String,dynamic>>,msgCount: null == msgCount ? _self.msgCount : msgCount // ignore: cast_nullable_to_non_nullable
as int,muteCount: null == muteCount ? _self.muteCount : muteCount // ignore: cast_nullable_to_non_nullable
as int,postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,ref: freezed == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as dynamic,reportCount: null == reportCount ? _self.reportCount : reportCount // ignore: cast_nullable_to_non_nullable
as int,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,searchToken: null == searchToken ? _self._searchToken : searchToken // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,title: null == title ? _self._title : title // ignore: cast_nullable_to_non_nullable
as Map<String,dynamic>,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as dynamic,userCount: null == userCount ? _self.userCount : userCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
