// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docs_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$docsViewModelHash() => r'ac84cb9497ee5e50b85357ea7e921f21e4f8d860';

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

abstract class _$DocsViewModel
    extends BuildlessAutoDisposeAsyncNotifier<PostsState> {
  late final bool isRankingPosts;

  FutureOr<PostsState> build(bool isRankingPosts);
}

/// See also [DocsViewModel].
@ProviderFor(DocsViewModel)
const docsViewModelProvider = DocsViewModelFamily();

/// See also [DocsViewModel].
class DocsViewModelFamily extends Family<AsyncValue<PostsState>> {
  /// See also [DocsViewModel].
  const DocsViewModelFamily();

  /// See also [DocsViewModel].
  DocsViewModelProvider call(bool isRankingPosts) {
    return DocsViewModelProvider(isRankingPosts);
  }

  @override
  DocsViewModelProvider getProviderOverride(
    covariant DocsViewModelProvider provider,
  ) {
    return call(provider.isRankingPosts);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'docsViewModelProvider';
}

/// See also [DocsViewModel].
class DocsViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<DocsViewModel, PostsState> {
  /// See also [DocsViewModel].
  DocsViewModelProvider(bool isRankingPosts)
    : this._internal(
        () => DocsViewModel()..isRankingPosts = isRankingPosts,
        from: docsViewModelProvider,
        name: r'docsViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$docsViewModelHash,
        dependencies: DocsViewModelFamily._dependencies,
        allTransitiveDependencies:
            DocsViewModelFamily._allTransitiveDependencies,
        isRankingPosts: isRankingPosts,
      );

  DocsViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.isRankingPosts,
  }) : super.internal();

  final bool isRankingPosts;

  @override
  FutureOr<PostsState> runNotifierBuild(covariant DocsViewModel notifier) {
    return notifier.build(isRankingPosts);
  }

  @override
  Override overrideWith(DocsViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: DocsViewModelProvider._internal(
        () => create()..isRankingPosts = isRankingPosts,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        isRankingPosts: isRankingPosts,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DocsViewModel, PostsState>
  createElement() {
    return _DocsViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DocsViewModelProvider &&
        other.isRankingPosts == isRankingPosts;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, isRankingPosts.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DocsViewModelRef on AutoDisposeAsyncNotifierProviderRef<PostsState> {
  /// The parameter `isRankingPosts` of this provider.
  bool get isRankingPosts;
}

class _DocsViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DocsViewModel, PostsState>
    with DocsViewModelRef {
  _DocsViewModelProviderElement(super.provider);

  @override
  bool get isRankingPosts => (origin as DocsViewModelProvider).isRankingPosts;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
