// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatState {
  /// AIが応答を生成中かどうか
  bool get isGenerating;

  /// チャットのメッセージリスト
  List<TextMessage> get messages;
  Post get post;
  String? get postImage;
  bool get isPicked;
  String? get pickedImage;
  String get realtimeRes;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatStateCopyWith<ChatState> get copyWith =>
      _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);

  /// Serializes this ChatState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatState &&
            (identical(other.isGenerating, isGenerating) ||
                other.isGenerating == isGenerating) &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.postImage, postImage) ||
                other.postImage == postImage) &&
            (identical(other.isPicked, isPicked) ||
                other.isPicked == isPicked) &&
            (identical(other.pickedImage, pickedImage) ||
                other.pickedImage == pickedImage) &&
            (identical(other.realtimeRes, realtimeRes) ||
                other.realtimeRes == realtimeRes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isGenerating,
      const DeepCollectionEquality().hash(messages),
      post,
      postImage,
      isPicked,
      pickedImage,
      realtimeRes);

  @override
  String toString() {
    return 'ChatState(isGenerating: $isGenerating, messages: $messages, post: $post, postImage: $postImage, isPicked: $isPicked, pickedImage: $pickedImage, realtimeRes: $realtimeRes)';
  }
}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) =
      _$ChatStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isGenerating,
      List<TextMessage> messages,
      Post post,
      String? postImage,
      bool isPicked,
      String? pickedImage,
      String realtimeRes});

  $PostCopyWith<$Res> get post;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isGenerating = null,
    Object? messages = null,
    Object? post = null,
    Object? postImage = freezed,
    Object? isPicked = null,
    Object? pickedImage = freezed,
    Object? realtimeRes = null,
  }) {
    return _then(_self.copyWith(
      isGenerating: null == isGenerating
          ? _self.isGenerating
          : isGenerating // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _self.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<TextMessage>,
      post: null == post
          ? _self.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      postImage: freezed == postImage
          ? _self.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isPicked: null == isPicked
          ? _self.isPicked
          : isPicked // ignore: cast_nullable_to_non_nullable
              as bool,
      pickedImage: freezed == pickedImage
          ? _self.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as String?,
      realtimeRes: null == realtimeRes
          ? _self.realtimeRes
          : realtimeRes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_self.post, (value) {
      return _then(_self.copyWith(post: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ChatState implements ChatState {
  const _ChatState(
      {this.isGenerating = false,
      final List<TextMessage> messages = const [],
      required this.post,
      this.postImage,
      this.isPicked = false,
      this.pickedImage,
      this.realtimeRes = ""})
      : _messages = messages;
  factory _ChatState.fromJson(Map<String, dynamic> json) =>
      _$ChatStateFromJson(json);

  /// AIが応答を生成中かどうか
  @override
  @JsonKey()
  final bool isGenerating;

  /// チャットのメッセージリスト
  final List<TextMessage> _messages;

  /// チャットのメッセージリスト
  @override
  @JsonKey()
  List<TextMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final Post post;
  @override
  final String? postImage;
  @override
  @JsonKey()
  final bool isPicked;
  @override
  final String? pickedImage;
  @override
  @JsonKey()
  final String realtimeRes;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            (identical(other.isGenerating, isGenerating) ||
                other.isGenerating == isGenerating) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.postImage, postImage) ||
                other.postImage == postImage) &&
            (identical(other.isPicked, isPicked) ||
                other.isPicked == isPicked) &&
            (identical(other.pickedImage, pickedImage) ||
                other.pickedImage == pickedImage) &&
            (identical(other.realtimeRes, realtimeRes) ||
                other.realtimeRes == realtimeRes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isGenerating,
      const DeepCollectionEquality().hash(_messages),
      post,
      postImage,
      isPicked,
      pickedImage,
      realtimeRes);

  @override
  String toString() {
    return 'ChatState(isGenerating: $isGenerating, messages: $messages, post: $post, postImage: $postImage, isPicked: $isPicked, pickedImage: $pickedImage, realtimeRes: $realtimeRes)';
  }
}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res>
    implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) _then) =
      __$ChatStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isGenerating,
      List<TextMessage> messages,
      Post post,
      String? postImage,
      bool isPicked,
      String? pickedImage,
      String realtimeRes});

  @override
  $PostCopyWith<$Res> get post;
}

/// @nodoc
class __$ChatStateCopyWithImpl<$Res> implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isGenerating = null,
    Object? messages = null,
    Object? post = null,
    Object? postImage = freezed,
    Object? isPicked = null,
    Object? pickedImage = freezed,
    Object? realtimeRes = null,
  }) {
    return _then(_ChatState(
      isGenerating: null == isGenerating
          ? _self.isGenerating
          : isGenerating // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _self._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<TextMessage>,
      post: null == post
          ? _self.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      postImage: freezed == postImage
          ? _self.postImage
          : postImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isPicked: null == isPicked
          ? _self.isPicked
          : isPicked // ignore: cast_nullable_to_non_nullable
              as bool,
      pickedImage: freezed == pickedImage
          ? _self.pickedImage
          : pickedImage // ignore: cast_nullable_to_non_nullable
              as String?,
      realtimeRes: null == realtimeRes
          ? _self.realtimeRes
          : realtimeRes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_self.post, (value) {
      return _then(_self.copyWith(post: value));
    });
  }
}

// dart format on
