// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flutterLocalNotificationsPluginHash() =>
    r'5012bb087ba16f70c0b479f4f83169aed9e1b683';

/// FlutterLocalNotificationsPluginのインスタンスを提供するProvider
/// アプリが生きている間は常にインスタンスを保持する
///
/// Copied from [flutterLocalNotificationsPlugin].
@ProviderFor(flutterLocalNotificationsPlugin)
final flutterLocalNotificationsPluginProvider =
    Provider<FlutterLocalNotificationsPlugin>.internal(
      flutterLocalNotificationsPlugin,
      name: r'flutterLocalNotificationsPluginProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$flutterLocalNotificationsPluginHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FlutterLocalNotificationsPluginRef =
    ProviderRef<FlutterLocalNotificationsPlugin>;
String _$notificationHash() => r'e73bd0d3a1912606e1854f69cb285ccaf2a9e1be';

/// 通知関連のロジックを管理するNotifier
///
/// Copied from [Notification].
@ProviderFor(Notification)
final notificationProvider =
    AsyncNotifierProvider<Notification, Notification>.internal(
      Notification.new,
      name: r'notificationProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$notificationHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Notification = AsyncNotifier<Notification>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
