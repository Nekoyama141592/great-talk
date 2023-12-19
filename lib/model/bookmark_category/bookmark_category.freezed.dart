// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookmarkCategory _$BookmarkCategoryFromJson(Map<String, dynamic> json) {
  return _BookmarkCategory.fromJson(json);
}

/// @nodoc
mixin _$BookmarkCategory {
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Map<String, dynamic> get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  dynamic get ref => throw _privateConstructorUsedError;
  dynamic get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookmarkCategoryCopyWith<BookmarkCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkCategoryCopyWith<$Res> {
  factory $BookmarkCategoryCopyWith(
          BookmarkCategory value, $Res Function(BookmarkCategory) then) =
      _$BookmarkCategoryCopyWithImpl<$Res, BookmarkCategory>;
  @useResult
  $Res call(
      {dynamic createdAt,
      String id,
      Map<String, dynamic> image,
      String title,
      dynamic ref,
      dynamic updatedAt});
}

/// @nodoc
class _$BookmarkCategoryCopyWithImpl<$Res, $Val extends BookmarkCategory>
    implements $BookmarkCategoryCopyWith<$Res> {
  _$BookmarkCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? image = null,
    Object? title = null,
    Object? ref = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_BookmarkCategoryCopyWith<$Res>
    implements $BookmarkCategoryCopyWith<$Res> {
  factory _$$_BookmarkCategoryCopyWith(
          _$_BookmarkCategory value, $Res Function(_$_BookmarkCategory) then) =
      __$$_BookmarkCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      String id,
      Map<String, dynamic> image,
      String title,
      dynamic ref,
      dynamic updatedAt});
}

/// @nodoc
class __$$_BookmarkCategoryCopyWithImpl<$Res>
    extends _$BookmarkCategoryCopyWithImpl<$Res, _$_BookmarkCategory>
    implements _$$_BookmarkCategoryCopyWith<$Res> {
  __$$_BookmarkCategoryCopyWithImpl(
      _$_BookmarkCategory _value, $Res Function(_$_BookmarkCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? image = null,
    Object? title = null,
    Object? ref = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_BookmarkCategory(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_BookmarkCategory implements _BookmarkCategory {
  const _$_BookmarkCategory(
      {required this.createdAt,
      required this.id,
      required final Map<String, dynamic> image,
      required this.title,
      required this.ref,
      required this.updatedAt})
      : _image = image;

  factory _$_BookmarkCategory.fromJson(Map<String, dynamic> json) =>
      _$$_BookmarkCategoryFromJson(json);

  @override
  final dynamic createdAt;
  @override
  final String id;
  final Map<String, dynamic> _image;
  @override
  Map<String, dynamic> get image {
    if (_image is EqualUnmodifiableMapView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_image);
  }

  @override
  final String title;
  @override
  final dynamic ref;
  @override
  final dynamic updatedAt;

  @override
  String toString() {
    return 'BookmarkCategory(createdAt: $createdAt, id: $id, image: $image, title: $title, ref: $ref, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookmarkCategory &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      id,
      const DeepCollectionEquality().hash(_image),
      title,
      const DeepCollectionEquality().hash(ref),
      const DeepCollectionEquality().hash(updatedAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookmarkCategoryCopyWith<_$_BookmarkCategory> get copyWith =>
      __$$_BookmarkCategoryCopyWithImpl<_$_BookmarkCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookmarkCategoryToJson(
      this,
    );
  }
}

abstract class _BookmarkCategory implements BookmarkCategory {
  const factory _BookmarkCategory(
      {required final dynamic createdAt,
      required final String id,
      required final Map<String, dynamic> image,
      required final String title,
      required final dynamic ref,
      required final dynamic updatedAt}) = _$_BookmarkCategory;

  factory _BookmarkCategory.fromJson(Map<String, dynamic> json) =
      _$_BookmarkCategory.fromJson;

  @override
  dynamic get createdAt;
  @override
  String get id;
  @override
  Map<String, dynamic> get image;
  @override
  String get title;
  @override
  dynamic get ref;
  @override
  dynamic get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_BookmarkCategoryCopyWith<_$_BookmarkCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
