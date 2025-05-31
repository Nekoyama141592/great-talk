// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docs_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$docsViewModelHash() => r'84ec4feda4f11484601240c5b87ef332cb8a700d';

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
    extends BuildlessAutoDisposeAsyncNotifier<DocsState> {
  late final DocsType type;
  late final String? passiveUid;

  FutureOr<DocsState> build(DocsType type, {String? passiveUid});
}

/// See also [DocsViewModel].
@ProviderFor(DocsViewModel)
const docsViewModelProvider = DocsViewModelFamily();

/// See also [DocsViewModel].
class DocsViewModelFamily extends Family<AsyncValue<DocsState>> {
  /// See also [DocsViewModel].
  const DocsViewModelFamily();

  /// See also [DocsViewModel].
  DocsViewModelProvider call(DocsType type, {String? passiveUid}) {
    return DocsViewModelProvider(type, passiveUid: passiveUid);
  }

  @override
  DocsViewModelProvider getProviderOverride(
    covariant DocsViewModelProvider provider,
  ) {
    return call(provider.type, passiveUid: provider.passiveUid);
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
    extends AutoDisposeAsyncNotifierProviderImpl<DocsViewModel, DocsState> {
  /// See also [DocsViewModel].
  DocsViewModelProvider(DocsType type, {String? passiveUid})
    : this._internal(
        () =>
            DocsViewModel()
              ..type = type
              ..passiveUid = passiveUid,
        from: docsViewModelProvider,
        name: r'docsViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$docsViewModelHash,
        dependencies: DocsViewModelFamily._dependencies,
        allTransitiveDependencies:
            DocsViewModelFamily._allTransitiveDependencies,
        type: type,
        passiveUid: passiveUid,
      );

  DocsViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.passiveUid,
  }) : super.internal();

  final DocsType type;
  final String? passiveUid;

  @override
  FutureOr<DocsState> runNotifierBuild(covariant DocsViewModel notifier) {
    return notifier.build(type, passiveUid: passiveUid);
  }

  @override
  Override overrideWith(DocsViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: DocsViewModelProvider._internal(
        () =>
            create()
              ..type = type
              ..passiveUid = passiveUid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        passiveUid: passiveUid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<DocsViewModel, DocsState>
  createElement() {
    return _DocsViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DocsViewModelProvider &&
        other.type == type &&
        other.passiveUid == passiveUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, passiveUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DocsViewModelRef on AutoDisposeAsyncNotifierProviderRef<DocsState> {
  /// The parameter `type` of this provider.
  DocsType get type;

  /// The parameter `passiveUid` of this provider.
  String? get passiveUid;
}

class _DocsViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<DocsViewModel, DocsState>
    with DocsViewModelRef {
  _DocsViewModelProviderElement(super.provider);

  @override
  DocsType get type => (origin as DocsViewModelProvider).type;
  @override
  String? get passiveUid => (origin as DocsViewModelProvider).passiveUid;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
