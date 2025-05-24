// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_completion_sse.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatCompletionSseHash() => r'8b889ac58d03b3211878e41ab427bf5094325b10';

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

/// See also [chatCompletionSse].
@ProviderFor(chatCompletionSse)
const chatCompletionSseProvider = ChatCompletionSseFamily();

/// See also [chatCompletionSse].
class ChatCompletionSseFamily extends Family<AsyncValue<String>> {
  /// See also [chatCompletionSse].
  const ChatCompletionSseFamily();

  /// See also [chatCompletionSse].
  ChatCompletionSseProvider call({required ChatCompleteText request}) {
    return ChatCompletionSseProvider(request: request);
  }

  @override
  ChatCompletionSseProvider getProviderOverride(
    covariant ChatCompletionSseProvider provider,
  ) {
    return call(request: provider.request);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatCompletionSseProvider';
}

/// See also [chatCompletionSse].
class ChatCompletionSseProvider extends AutoDisposeStreamProvider<String> {
  /// See also [chatCompletionSse].
  ChatCompletionSseProvider({required ChatCompleteText request})
    : this._internal(
        (ref) =>
            chatCompletionSse(ref as ChatCompletionSseRef, request: request),
        from: chatCompletionSseProvider,
        name: r'chatCompletionSseProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$chatCompletionSseHash,
        dependencies: ChatCompletionSseFamily._dependencies,
        allTransitiveDependencies:
            ChatCompletionSseFamily._allTransitiveDependencies,
        request: request,
      );

  ChatCompletionSseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.request,
  }) : super.internal();

  final ChatCompleteText request;

  @override
  Override overrideWith(
    Stream<String> Function(ChatCompletionSseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatCompletionSseProvider._internal(
        (ref) => create(ref as ChatCompletionSseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<String> createElement() {
    return _ChatCompletionSseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatCompletionSseProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatCompletionSseRef on AutoDisposeStreamProviderRef<String> {
  /// The parameter `request` of this provider.
  ChatCompleteText get request;
}

class _ChatCompletionSseProviderElement
    extends AutoDisposeStreamProviderElement<String>
    with ChatCompletionSseRef {
  _ChatCompletionSseProviderElement(super.provider);

  @override
  ChatCompleteText get request => (origin as ChatCompletionSseProvider).request;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
