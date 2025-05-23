// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookmarkCategory {
  dynamic get createdAt;
  String get id;
  SDMap get image;
  String get title;
  dynamic get ref;
  dynamic get updatedAt;

  /// Create a copy of BookmarkCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookmarkCategoryCopyWith<BookmarkCategory> get copyWith =>
      _$BookmarkCategoryCopyWithImpl<BookmarkCategory>(
          this as BookmarkCategory, _$identity);

  /// Serializes this BookmarkCategory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookmarkCategory &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      id,
      const DeepCollectionEquality().hash(image),
      title,
      const DeepCollectionEquality().hash(ref),
      const DeepCollectionEquality().hash(updatedAt));

  @override
  String toString() {
    return 'BookmarkCategory(createdAt: $createdAt, id: $id, image: $image, title: $title, ref: $ref, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $BookmarkCategoryCopyWith<$Res> {
  factory $BookmarkCategoryCopyWith(
          BookmarkCategory value, $Res Function(BookmarkCategory) _then) =
      _$BookmarkCategoryCopyWithImpl;
  @useResult
  $Res call(
      {dynamic createdAt,
      String id,
      SDMap image,
      String title,
      dynamic ref,
      dynamic updatedAt});
}

/// @nodoc
class _$BookmarkCategoryCopyWithImpl<$Res>
    implements $BookmarkCategoryCopyWith<$Res> {
  _$BookmarkCategoryCopyWithImpl(this._self, this._then);

  final BookmarkCategory _self;
  final $Res Function(BookmarkCategory) _then;

  /// Create a copy of BookmarkCategory
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as SDMap,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      ref: freezed == ref
          ? _self.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BookmarkCategory implements BookmarkCategory {
  const _BookmarkCategory(
      {required this.createdAt,
      required this.id,
      required final SDMap image,
      required this.title,
      required this.ref,
      required this.updatedAt})
      : _image = image;
  factory _BookmarkCategory.fromJson(Map<String, dynamic> json) =>
      _$BookmarkCategoryFromJson(json);

  @override
  final dynamic createdAt;
  @override
  final String id;
  final SDMap _image;
  @override
  SDMap get image {
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

  /// Create a copy of BookmarkCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookmarkCategoryCopyWith<_BookmarkCategory> get copyWith =>
      __$BookmarkCategoryCopyWithImpl<_BookmarkCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookmarkCategoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookmarkCategory &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.ref, ref) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      id,
      const DeepCollectionEquality().hash(_image),
      title,
      const DeepCollectionEquality().hash(ref),
      const DeepCollectionEquality().hash(updatedAt));

  @override
  String toString() {
    return 'BookmarkCategory(createdAt: $createdAt, id: $id, image: $image, title: $title, ref: $ref, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$BookmarkCategoryCopyWith<$Res>
    implements $BookmarkCategoryCopyWith<$Res> {
  factory _$BookmarkCategoryCopyWith(
          _BookmarkCategory value, $Res Function(_BookmarkCategory) _then) =
      __$BookmarkCategoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      String id,
      SDMap image,
      String title,
      dynamic ref,
      dynamic updatedAt});
}

/// @nodoc
class __$BookmarkCategoryCopyWithImpl<$Res>
    implements _$BookmarkCategoryCopyWith<$Res> {
  __$BookmarkCategoryCopyWithImpl(this._self, this._then);

  final _BookmarkCategory _self;
  final $Res Function(_BookmarkCategory) _then;

  /// Create a copy of BookmarkCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? image = null,
    Object? title = null,
    Object? ref = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_BookmarkCategory(
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self._image
          : image // ignore: cast_nullable_to_non_nullable
              as SDMap,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      ref: freezed == ref
          ? _self.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as dynamic,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
