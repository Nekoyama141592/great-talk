// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthRepositoryHash() =>
    r'bb0b85dba80caa7fb1d8afaf50ffe3c7f7f061ca';

/// See also [firebaseAuthRepository].
@ProviderFor(firebaseAuthRepository)
final firebaseAuthRepositoryProvider =
    Provider<FirebaseAuthRepository>.internal(
      firebaseAuthRepository,
      name: r'firebaseAuthRepositoryProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$firebaseAuthRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseAuthRepositoryRef = ProviderRef<FirebaseAuthRepository>;
String _$awsS3RepositoryHash() => r'b1426d77b66b4deb4928c989895ca3382e8c1abc';

/// See also [awsS3Repository].
@ProviderFor(awsS3Repository)
final awsS3RepositoryProvider = Provider<OnCallRepository>.internal(
  awsS3Repository,
  name: r'awsS3RepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$awsS3RepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AwsS3RepositoryRef = ProviderRef<OnCallRepository>;
String _$currentUserNotifierHash() =>
    r'b00f4ecfe5e55d35b62c8b123fc61722e2bd550c';

/// See also [CurrentUserNotifier].
@ProviderFor(CurrentUserNotifier)
final currentUserNotifierProvider =
    AsyncNotifierProvider<CurrentUserNotifier, CurrentUserState>.internal(
      CurrentUserNotifier.new,
      name: r'currentUserNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$currentUserNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CurrentUserNotifier = AsyncNotifier<CurrentUserState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
