// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postsViewModelHash() => r'ed41a1851377b464d723d0d0dff2ef2cff0fe533';

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

abstract class _$PostsViewModel extends BuildlessAsyncNotifier<PostsState> {
  late final bool isRankingPosts;

  FutureOr<PostsState> build(bool isRankingPosts);
}

/// See also [PostsViewModel].
@ProviderFor(PostsViewModel)
const postsViewModelProvider = PostsViewModelFamily();

/// See also [PostsViewModel].
class PostsViewModelFamily extends Family<AsyncValue<PostsState>> {
  /// See also [PostsViewModel].
  const PostsViewModelFamily();

  /// See also [PostsViewModel].
  PostsViewModelProvider call(bool isRankingPosts) {
    return PostsViewModelProvider(isRankingPosts);
  }

  @override
  PostsViewModelProvider getProviderOverride(
    covariant PostsViewModelProvider provider,
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
  String? get name => r'postsViewModelProvider';
}

/// See also [PostsViewModel].
class PostsViewModelProvider
    extends AsyncNotifierProviderImpl<PostsViewModel, PostsState> {
  /// See also [PostsViewModel].
  PostsViewModelProvider(bool isRankingPosts)
    : this._internal(
        () => PostsViewModel()..isRankingPosts = isRankingPosts,
        from: postsViewModelProvider,
        name: r'postsViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$postsViewModelHash,
        dependencies: PostsViewModelFamily._dependencies,
        allTransitiveDependencies:
            PostsViewModelFamily._allTransitiveDependencies,
        isRankingPosts: isRankingPosts,
      );

  PostsViewModelProvider._internal(
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
  FutureOr<PostsState> runNotifierBuild(covariant PostsViewModel notifier) {
    return notifier.build(isRankingPosts);
  }

  @override
  Override overrideWith(PostsViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostsViewModelProvider._internal(
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
  AsyncNotifierProviderElement<PostsViewModel, PostsState> createElement() {
    return _PostsViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostsViewModelProvider &&
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
mixin PostsViewModelRef on AsyncNotifierProviderRef<PostsState> {
  /// The parameter `isRankingPosts` of this provider.
  bool get isRankingPosts;
}

class _PostsViewModelProviderElement
    extends AsyncNotifierProviderElement<PostsViewModel, PostsState>
    with PostsViewModelRef {
  _PostsViewModelProviderElement(super.provider);

  @override
  bool get isRankingPosts => (origin as PostsViewModelProvider).isRankingPosts;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
