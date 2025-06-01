// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileViewModelHash() => r'8b9efab6d05de3261d19fa9193bc1f44a42526b9';

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

abstract class _$ProfileViewModel
    extends BuildlessAutoDisposeAsyncNotifier<ProfileState> {
  late final String passiveUid;

  FutureOr<ProfileState> build(String passiveUid);
}

/// See also [ProfileViewModel].
@ProviderFor(ProfileViewModel)
const profileViewModelProvider = ProfileViewModelFamily();

/// See also [ProfileViewModel].
class ProfileViewModelFamily extends Family<AsyncValue<ProfileState>> {
  /// See also [ProfileViewModel].
  const ProfileViewModelFamily();

  /// See also [ProfileViewModel].
  ProfileViewModelProvider call(String passiveUid) {
    return ProfileViewModelProvider(passiveUid);
  }

  @override
  ProfileViewModelProvider getProviderOverride(
    covariant ProfileViewModelProvider provider,
  ) {
    return call(provider.passiveUid);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'profileViewModelProvider';
}

/// See also [ProfileViewModel].
class ProfileViewModelProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<ProfileViewModel, ProfileState> {
  /// See also [ProfileViewModel].
  ProfileViewModelProvider(String passiveUid)
    : this._internal(
        () => ProfileViewModel()..passiveUid = passiveUid,
        from: profileViewModelProvider,
        name: r'profileViewModelProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$profileViewModelHash,
        dependencies: ProfileViewModelFamily._dependencies,
        allTransitiveDependencies:
            ProfileViewModelFamily._allTransitiveDependencies,
        passiveUid: passiveUid,
      );

  ProfileViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.passiveUid,
  }) : super.internal();

  final String passiveUid;

  @override
  FutureOr<ProfileState> runNotifierBuild(covariant ProfileViewModel notifier) {
    return notifier.build(passiveUid);
  }

  @override
  Override overrideWith(ProfileViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProfileViewModelProvider._internal(
        () => create()..passiveUid = passiveUid,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        passiveUid: passiveUid,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProfileViewModel, ProfileState>
  createElement() {
    return _ProfileViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileViewModelProvider && other.passiveUid == passiveUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, passiveUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProfileViewModelRef on AutoDisposeAsyncNotifierProviderRef<ProfileState> {
  /// The parameter `passiveUid` of this provider.
  String get passiveUid;
}

class _ProfileViewModelProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<ProfileViewModel, ProfileState>
    with ProfileViewModelRef {
  _ProfileViewModelProviderElement(super.provider);

  @override
  String get passiveUid => (origin as ProfileViewModelProvider).passiveUid;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
