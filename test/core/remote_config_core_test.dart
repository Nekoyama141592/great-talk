import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/util/remote_config_core.dart';

void main() {
  group('RemoteConfigCore', () {
    group('maintenanceMsgKey', () {
      test('should return iOS-specific key on iOS platform', () {
        final result = RemoteConfigCore.maintenanceMsgKey;

        expect(result, isA<String>());
        expect(result.contains('maintenance_msg'), true);

        if (Platform.isIOS) {
          expect(result, 'ios_maintenance_msg');
        } else {
          expect(result, 'android_maintenance_msg');
        }
      });

      test('should be consistent across multiple calls', () {
        final result1 = RemoteConfigCore.maintenanceMsgKey;
        final result2 = RemoteConfigCore.maintenanceMsgKey;

        expect(result1, equals(result2));
      });

      test('should contain base key name', () {
        final result = RemoteConfigCore.maintenanceMsgKey;

        expect(result.contains('maintenance_msg'), true);
      });

      test('should have platform prefix', () {
        final result = RemoteConfigCore.maintenanceMsgKey;

        expect(
          result.startsWith('ios_') || result.startsWith('android_'),
          true,
        );
      });
    });

    group('forcedUpdateVersionKey', () {
      test('should return platform-specific key', () {
        final result = RemoteConfigCore.forcedUpdateVersionKey;

        expect(result, isA<String>());
        expect(result.contains('forced_update_version'), true);

        if (Platform.isIOS) {
          expect(result, 'ios_forced_update_version');
        } else {
          expect(result, 'android_forced_update_version');
        }
      });

      test('should be consistent across multiple calls', () {
        final result1 = RemoteConfigCore.forcedUpdateVersionKey;
        final result2 = RemoteConfigCore.forcedUpdateVersionKey;

        expect(result1, equals(result2));
      });

      test('should contain base key name', () {
        final result = RemoteConfigCore.forcedUpdateVersionKey;

        expect(result.contains('forced_update_version'), true);
      });

      test('should have platform prefix', () {
        final result = RemoteConfigCore.forcedUpdateVersionKey;

        expect(
          result.startsWith('ios_') || result.startsWith('android_'),
          true,
        );
      });
    });

    group('key consistency', () {
      test('should return different keys for different methods', () {
        final maintenanceKey = RemoteConfigCore.maintenanceMsgKey;
        final updateKey = RemoteConfigCore.forcedUpdateVersionKey;

        expect(maintenanceKey, isNot(equals(updateKey)));
      });

      test('should both use same platform prefix', () {
        final maintenanceKey = RemoteConfigCore.maintenanceMsgKey;
        final updateKey = RemoteConfigCore.forcedUpdateVersionKey;

        final maintenancePrefix = maintenanceKey.split('_')[0];
        final updatePrefix = updateKey.split('_')[0];

        expect(maintenancePrefix, equals(updatePrefix));
        expect(['ios', 'android'].contains(maintenancePrefix), true);
      });

      test('should have consistent naming pattern', () {
        final maintenanceKey = RemoteConfigCore.maintenanceMsgKey;
        final updateKey = RemoteConfigCore.forcedUpdateVersionKey;

        expect(maintenanceKey.split('_').length, greaterThanOrEqualTo(2));
        expect(updateKey.split('_').length, greaterThanOrEqualTo(2));
      });
    });

    group('platform behavior simulation', () {
      test('should handle key generation correctly', () {
        final maintenanceKey = RemoteConfigCore.maintenanceMsgKey;
        final updateKey = RemoteConfigCore.forcedUpdateVersionKey;

        expect(maintenanceKey.isNotEmpty, true);
        expect(updateKey.isNotEmpty, true);

        expect(maintenanceKey.contains('maintenance_msg'), true);
        expect(updateKey.contains('forced_update_version'), true);
      });

      test('should work with current platform settings', () {
        final maintenanceKey = RemoteConfigCore.maintenanceMsgKey;
        final updateKey = RemoteConfigCore.forcedUpdateVersionKey;

        expect(maintenanceKey.length, greaterThan(10));
        expect(updateKey.length, greaterThan(10));

        expect(maintenanceKey, isNot('maintenance_msg'));
        expect(updateKey, isNot('forced_update_version'));
      });
    });
  });
}
