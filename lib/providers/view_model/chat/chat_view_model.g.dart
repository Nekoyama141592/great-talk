// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatViewModelHash() => r'd32e820aa13ef846792e305858105cb74bdde421';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChatViewModel
    extends BuildlessAutoDisposeAsyncNotifier<ChatState> {
  late final String uid;
  late final String postId;

  FutureOr<ChatState> build(String uid, String postId);
}

/// See also [ChatViewModel].
@ProviderFor(ChatViewModel)
const chatViewModelProvider = ChatViewModelFamily();

/// See also [ChatViewModel].
class ChatViewModelFamily extends Family<AsyncValue<ChatState>> {
  /// See also [ChatViewModel].
  const ChatViewModelFamily();

  /// See also [ChatViewModel].
  ChatViewModelProvider call(String uid, String postId) {
    return ChatViewModelProvider(uid, postId);
  }

  @override
  ChatViewModelProvider getProviderOverride(
    covariant ChatViewModelProvider provider,
  ) {
    return call(provider.uid, provider.postId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatViewModelProvider';
}

/// See also [ChatViewModel].
class ChatViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChatViewModel, ChatState> {
  /// See also [ChatViewModel].
  ChatViewModelProvider(String uid, String postId)
    : this._internal(
        () =>
            ChatViewModel()
              ..uid = uid
              ..postId = postId,
        from: chatViewModelProvider,
        name: r'chatViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$chatViewModelHash,
        dependencies: ChatViewModelFamily._dependencies,
        allTransitiveDependencies:
            ChatViewModelFamily._allTransitiveDependencies,
        uid: uid,
        postId: postId,
      );

  ChatViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
    required this.postId,
  }) : super.internal();

  final String uid;
  final String postId;

  @override
  FutureOr<ChatState> runNotifierBuild(covariant ChatViewModel notifier) {
    return notifier.build(uid, postId);
  }

  @override
  Override overrideWith(ChatViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatViewModelProvider._internal(
        () =>
            create()
              ..uid = uid
              ..postId = postId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChatViewModel, ChatState>
  createElement() {
    return _ChatViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatViewModelProvider &&
        other.uid == uid &&
        other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatViewModelRef on AutoDisposeAsyncNotifierProviderRef<ChatState> {
  /// The parameter `uid` of this provider.
  String get uid;

  /// The parameter `postId` of this provider.
  String get postId;
}

class _ChatViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ChatViewModel, ChatState>
    with ChatViewModelRef {
  _ChatViewModelProviderElement(super.provider);

  @override
  String get uid => (origin as ChatViewModelProvider).uid;
  @override
  String get postId => (origin as ChatViewModelProvider).postId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
