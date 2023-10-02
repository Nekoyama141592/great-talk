// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bookmark _$BookmarkFromJson(Map<String, dynamic> json) {
  return _Bookmark.fromJson(json);
}

/// @nodoc
mixin _$Bookmark {
  String get activeUid => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get passiveUid => throw _privateConstructorUsedError;
  dynamic get postRef => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  dynamic get ref => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkCopyWith<Bookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkCopyWith<$Res> {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) then) =
      _$BookmarkCopyWithImpl<$Res, Bookmark>;
  @useResult
  $Res call(
      {String activeUid,
      String categoryId,
      dynamic createdAt,
      String passiveUid,
      dynamic postRef,
      String postId,
      dynamic ref});
}

/// @nodoc
class _$BookmarkCopyWithImpl<$Res, $Val extends Bookmark>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? categoryId = null,
    Object? createdAt = freezed,
    Object? passiveUid = null,
    Object? postRef = freezed,
    Object? postId = null,
    Object? ref = freezed,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookmarkCopyWith<$Res> implements $BookmarkCopyWith<$Res> {
  factory _$$_BookmarkCopyWith(
          _$_Bookmark value, $Res Function(_$_Bookmark) then) =
      __$$_BookmarkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      String categoryId,
      dynamic createdAt,
      String passiveUid,
      dynamic postRef,
      String postId,
      dynamic ref});
}

/// @nodoc
class __$$_BookmarkCopyWithImpl<$Res>
    extends _$BookmarkCopyWithImpl<$Res, _$_Bookmark>
    implements _$$_BookmarkCopyWith<$Res> {
  __$$_BookmarkCopyWithImpl(
      _$_Bookmark _value, $Res Function(_$_Bookmark) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? categoryId = null,
    Object? createdAt = freezed,
    Object? passiveUid = null,
    Object? postRef = freezed,
    Object? postId = null,
    Object? ref = freezed,
  }) {
    return _then(_$_Bookmark(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bookmark implements _Bookmark {
  const _$_Bookmark(
      {required this.activeUid,
      required this.categoryId,
      required this.createdAt,
      required this.passiveUid,
      required this.postRef,
      required this.postId,
      required this.ref});

  factory _$_Bookmark.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkFromJson(json);

  @override
  final String activeUid;
  @override
  final String categoryId;
  @override
  final dynamic createdAt;
  @override
  final String passiveUid;
  @override
  final dynamic postRef;
  @override
  final String postId;
  @override
  final dynamic ref;

  @override
  String toString() {
    return 'Bookmark(activeUid: $activeUid, categoryId: $categoryId, createdAt: $createdAt, passiveUid: $passiveUid, postRef: $postRef, postId: $postId, ref: $ref)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bookmark &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.passiveUid, passiveUid) ||
                other.passiveUid == passiveUid) &&
            const DeepCollectionEquality().equals(other.postRef, postRef) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            const DeepCollectionEquality().equals(other.ref, ref));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      categoryId,
      const DeepCollectionEquality().hash(createdAt),
      passiveUid,
      const DeepCollectionEquality().hash(postRef),
      postId,
      const DeepCollectionEquality().hash(ref));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookmarkCopyWith<_$_Bookmark> get copyWith =>
      __$$_BookmarkCopyWithImpl<_$_Bookmark>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookmarkToJson(
      this,
    );
  }
}

abstract class _Bookmark implements Bookmark {
  const factory _Bookmark(
      {required final String activeUid,
      required final String categoryId,
      required final dynamic createdAt,
      required final String passiveUid,
      required final dynamic postRef,
      required final String postId,
      required final dynamic ref}) = _$_Bookmark;

  factory _Bookmark.fromJson(Map<String, dynamic> json) = _$_Bookmark.fromJson;

  @override
  String get activeUid;
  @override
  String get categoryId;
  @override
  dynamic get createdAt;
  @override
  String get passiveUid;
  @override
  dynamic get postRef;
  @override
  String get postId;
  @override
  dynamic get ref;
  @override
  @JsonKey(ignore: true)
  _$$_BookmarkCopyWith<_$_Bookmark> get copyWith =>
      throw _privateConstructorUsedError;
}
