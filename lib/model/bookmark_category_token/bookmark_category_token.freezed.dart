// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_category_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookmarkCategoryToken _$BookmarkCategoryTokenFromJson(
    Map<String, dynamic> json) {
  return _BookmarkCategoryToken.fromJson(json);
}

/// @nodoc
mixin _$BookmarkCategoryToken {
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  Map<String, dynamic> get image => throw _privateConstructorUsedError;
  dynamic get ref => throw _privateConstructorUsedError;
  dynamic get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkCategoryTokenCopyWith<BookmarkCategoryToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkCategoryTokenCopyWith<$Res> {
  factory $BookmarkCategoryTokenCopyWith(BookmarkCategoryToken value,
          $Res Function(BookmarkCategoryToken) then) =
      _$BookmarkCategoryTokenCopyWithImpl<$Res, BookmarkCategoryToken>;
  @useResult
  $Res call(
      {dynamic createdAt,
      String categoryName,
      String categoryId,
      Map<String, dynamic> image,
      dynamic ref,
      dynamic updatedAt});
}

/// @nodoc
class _$BookmarkCategoryTokenCopyWithImpl<$Res,
        $Val extends BookmarkCategoryToken>
    implements $BookmarkCategoryTokenCopyWith<$Res> {
  _$BookmarkCategoryTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? categoryName = null,
    Object? categoryId = null,
    Object? image = null,
    Object? ref = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookmarkCategoryTokenCopyWith<$Res>
    implements $BookmarkCategoryTokenCopyWith<$Res> {
  factory _$$_BookmarkCategoryTokenCopyWith(_$_BookmarkCategoryToken value,
          $Res Function(_$_BookmarkCategoryToken) then) =
      __$$_BookmarkCategoryTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      String categoryName,
      String categoryId,
      Map<String, dynamic> image,
      dynamic ref,
      dynamic updatedAt});
}

/// @nodoc
class __$$_BookmarkCategoryTokenCopyWithImpl<$Res>
    extends _$BookmarkCategoryTokenCopyWithImpl<$Res, _$_BookmarkCategoryToken>
    implements _$$_BookmarkCategoryTokenCopyWith<$Res> {
  __$$_BookmarkCategoryTokenCopyWithImpl(_$_BookmarkCategoryToken _value,
      $Res Function(_$_BookmarkCategoryToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? categoryName = null,
    Object? categoryId = null,
    Object? image = null,
    Object? ref = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_BookmarkCategoryToken(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      ref: freezed == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookmarkCategoryToken implements _BookmarkCategoryToken {
  const _$_BookmarkCategoryToken(
      {required this.createdAt,
      required this.categoryName,
      required this.categoryId,
      required final Map<String, dynamic> image,
      required this.ref,
      required this.updatedAt})
      : _image = image;

  factory _$_BookmarkCategoryToken.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkCategoryTokenFromJson(json);

  @override
  final dynamic createdAt;
  @override
  final String categoryName;
  @override
  final String categoryId;
  final Map<String, dynamic> _image;
  @override
  Map<String, dynamic> get image {
    if (_image is EqualUnmodifiableMapView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_image);
  }

  @override
  final dynamic ref;
  @override
  final dynamic updatedAt;

  @override
  String toString() {
    return 'BookmarkCategoryToken(createdAt: $createdAt, categoryName: $categoryName, categoryId: $categoryId, image: $image, ref: $ref, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookmarkCategoryToken &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      categoryName,
      categoryId,
      const DeepCollectionEquality().hash(_image),
      const DeepCollectionEquality().hash(ref),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookmarkCategoryTokenCopyWith<_$_BookmarkCategoryToken> get copyWith =>
      __$$_BookmarkCategoryTokenCopyWithImpl<_$_BookmarkCategoryToken>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookmarkCategoryTokenToJson(
      this,
    );
  }
}

abstract class _BookmarkCategoryToken implements BookmarkCategoryToken {
  const factory _BookmarkCategoryToken(
      {required final dynamic createdAt,
      required final String categoryName,
      required final String categoryId,
      required final Map<String, dynamic> image,
      required final dynamic ref,
      required final dynamic updatedAt}) = _$_BookmarkCategoryToken;

  factory _BookmarkCategoryToken.fromJson(Map<String, dynamic> json) =
      _$_BookmarkCategoryToken.fromJson;

  @override
  dynamic get createdAt;
  @override
  String get categoryName;
  @override
  String get categoryId;
  @override
  Map<String, dynamic> get image;
  @override
  dynamic get ref;
  @override
  dynamic get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_BookmarkCategoryTokenCopyWith<_$_BookmarkCategoryToken> get copyWith =>
      throw _privateConstructorUsedError;
}
