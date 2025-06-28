import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone_latest/flutter_native_timezone_latest.dart';
import 'package:great_talk/presentation/util/flavor_ui_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

// riverpod_generator が生成するファイル
part 'notification_provider.g.dart';

/// FlutterLocalNotificationsPluginのインスタンスを提供するProvider
/// アプリが生きている間は常にインスタンスを保持する
@Riverpod(keepAlive: true)
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin(Ref ref) {
  return FlutterLocalNotificationsPlugin();
}

/// 通知関連のロジックを管理するNotifier
@Riverpod(keepAlive: true)
class Notification extends _$Notification with WidgetsBindingObserver {
  /// buildメソッドで初期化処理とライフサイクル管理を行う
  @override
  Future<Notification> build() async {
    // WidgetsBindingObserverを登録し、Providerが破棄される時に解除する
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(() => WidgetsBinding.instance.removeObserver(this));
    await _init();
    // このNotifier自身のインスタンスを返す
    return this;
  }

  /// アプリのライフサイクルが変更されたときに呼ばれる
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // アプリがフォアグラウンドに戻った時にバッジを消す
      FlutterAppBadger.removeBadge();
    }
  }

  /// すべての通知関連の初期化処理をまとめたメソッド
  Future<void> _init() async {
    await _configureLocalTimeZone();
    await _initializeNotification();
    await cancelAllNotifications();
    await requestPermissions();
    await registerDailyNotification();
  }

  /// タイムゾーンを設定する
  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName =
        await FlutterNativeTimezoneLatest.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  /// 通知プラグインを初期化する
  Future<void> _initializeNotification() async {
    final plugin = ref.read(flutterLocalNotificationsPluginProvider);
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        );
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_notification');

    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );
    await plugin.initialize(initializationSettings);
  }

  /// すべての通知をキャンセルする
  Future<void> cancelAllNotifications() async {
    final plugin = ref.read(flutterLocalNotificationsPluginProvider);
    await plugin.cancelAll();
  }

  /// 通知の権限をリクエストする
  Future<void> requestPermissions() async {
    final plugin = ref.read(flutterLocalNotificationsPluginProvider);
    if (Platform.isIOS) {
      await plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    } else if (Platform.isAndroid) {
      await plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
    }
  }

  /// 毎日の定期通知を登録する
  Future<void> registerDailyNotification() async {
    final plugin = ref.read(flutterLocalNotificationsPluginProvider);
    const message = "今日も面白いAIが投稿されてないか探してみましょう！";
    await plugin.periodicallyShow(
      0,
      FlavorUiUtil.appName(),
      message,
      RepeatInterval.daily,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'periodicNotification',
          '定期的な通知',
          importance: Importance.high,
          priority: Priority.high,
          // ongoing: false, // ongoing: trueだとユーザーが消せなくなるため、定期リマインダーではfalseが一般的
          largeIcon: DrawableResourceAndroidBitmap('ic_notification'),
          styleInformation: BigTextStyleInformation(message),
        ),
        iOS: DarwinNotificationDetails(badgeNumber: 1),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
