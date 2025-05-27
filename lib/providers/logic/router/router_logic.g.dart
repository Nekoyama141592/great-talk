// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'e4eaa94c2ff989bd19277dbeb36e13bae6282dd8';

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

/// See also [router].
@ProviderFor(router)
const routerProvider = RouterFamily();

/// See also [router].
class RouterFamily extends Family<StackRouter> {
  /// See also [router].
  const RouterFamily();

  /// See also [router].
  RouterProvider call(BuildContext context) {
    return RouterProvider(context);
  }

  @override
  RouterProvider getProviderOverride(covariant RouterProvider provider) {
    return call(provider.context);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'routerProvider';
}

/// See also [router].
class RouterProvider extends AutoDisposeProvider<StackRouter> {
  /// See also [router].
  RouterProvider(BuildContext context)
    : this._internal(
        (ref) => router(ref as RouterRef, context),
        from: routerProvider,
        name: r'routerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
        dependencies: RouterFamily._dependencies,
        allTransitiveDependencies: RouterFamily._allTransitiveDependencies,
        context: context,
      );

  RouterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(StackRouter Function(RouterRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: RouterProvider._internal(
        (ref) => create(ref as RouterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<StackRouter> createElement() {
    return _RouterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RouterProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RouterRef on AutoDisposeProviderRef<StackRouter> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _RouterProviderElement extends AutoDisposeProviderElement<StackRouter>
    with RouterRef {
  _RouterProviderElement(super.provider);

  @override
  BuildContext get context => (origin as RouterProvider).context;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
