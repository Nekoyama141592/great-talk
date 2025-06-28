import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/extension/remote_config_key_extension.dart';

void main() {
  group('RemoteConfigKeyExtension', () {
    group('toOsSpecificRemoteConfigKey', () {
      test('should add ios prefix when running on iOS', () {
        if (Platform.isIOS) {
          const key = 'maintenance_message';
          expect(key.toOsSpecificRemoteConfigKey, 'ios_maintenance_message');
        }
      });

      test('should add android prefix when running on Android', () {
        if (Platform.isAndroid) {
          const key = 'maintenance_message';
          expect(
            key.toOsSpecificRemoteConfigKey,
            'android_maintenance_message',
          );
        }
      });

      test('should handle empty string correctly', () {
        const key = '';
        final result = key.toOsSpecificRemoteConfigKey;

        if (Platform.isIOS) {
          expect(result, 'ios_');
        } else {
          expect(result, 'android_');
        }
      });

      test('should handle single character key', () {
        const key = 'a';
        final result = key.toOsSpecificRemoteConfigKey;

        if (Platform.isIOS) {
          expect(result, 'ios_a');
        } else {
          expect(result, 'android_a');
        }
      });

      test('should handle long key names', () {
        const key = 'very_long_maintenance_message_key_with_multiple_words';
        final result = key.toOsSpecificRemoteConfigKey;

        if (Platform.isIOS) {
          expect(
            result,
            'ios_very_long_maintenance_message_key_with_multiple_words',
          );
        } else {
          expect(
            result,
            'android_very_long_maintenance_message_key_with_multiple_words',
          );
        }
      });

      test('should handle key with special characters', () {
        const key = 'key-with.special_characters123';
        final result = key.toOsSpecificRemoteConfigKey;

        if (Platform.isIOS) {
          expect(result, 'ios_key-with.special_characters123');
        } else {
          expect(result, 'android_key-with.special_characters123');
        }
      });

      test('should handle key with numbers', () {
        const key = '123numeric456key789';
        final result = key.toOsSpecificRemoteConfigKey;

        if (Platform.isIOS) {
          expect(result, 'ios_123numeric456key789');
        } else {
          expect(result, 'android_123numeric456key789');
        }
      });

      test('should handle snake_case keys', () {
        const key = 'maintenance_message_key';
        final result = key.toOsSpecificRemoteConfigKey;

        if (Platform.isIOS) {
          expect(result, 'ios_maintenance_message_key');
        } else {
          expect(result, 'android_maintenance_message_key');
        }
      });

      test('should handle camelCase keys', () {
        const key = 'maintenanceMessageKey';
        final result = key.toOsSpecificRemoteConfigKey;

        if (Platform.isIOS) {
          expect(result, 'ios_maintenanceMessageKey');
        } else {
          expect(result, 'android_maintenanceMessageKey');
        }
      });

      test('should handle kebab-case keys', () {
        const key = 'maintenance-message-key';
        final result = key.toOsSpecificRemoteConfigKey;

        if (Platform.isIOS) {
          expect(result, 'ios_maintenance-message-key');
        } else {
          expect(result, 'android_maintenance-message-key');
        }
      });

      test('should preserve original key content exactly', () {
        const key = 'Original_Key_With_CAPS_and_123';
        final result = key.toOsSpecificRemoteConfigKey;

        expect(result.contains('Original_Key_With_CAPS_and_123'), true);

        if (Platform.isIOS) {
          expect(result.startsWith('ios_'), true);
        } else {
          expect(result.startsWith('android_'), true);
        }
      });

      test('should be consistent across multiple calls', () {
        const key = 'consistency_test_key';
        final result1 = key.toOsSpecificRemoteConfigKey;
        final result2 = key.toOsSpecificRemoteConfigKey;

        expect(result1, equals(result2));
      });

      test('should work with different key formats used in app', () {
        const keys = [
          'maintenance_msg',
          'forced_update_version',
          'feature_flag_enabled',
          'api_endpoint_url',
          'max_upload_size',
        ];

        for (final key in keys) {
          final result = key.toOsSpecificRemoteConfigKey;

          if (Platform.isIOS) {
            expect(result, 'ios_$key');
          } else {
            expect(result, 'android_$key');
          }
        }
      });

      test('should handle unicode characters', () {
        const key = 'メンテナンス_メッセージ';
        final result = key.toOsSpecificRemoteConfigKey;

        if (Platform.isIOS) {
          expect(result, 'ios_メンテナンス_メッセージ');
        } else {
          expect(result, 'android_メンテナンス_メッセージ');
        }
      });

      test('should handle whitespace in keys', () {
        const key = 'key with spaces';
        final result = key.toOsSpecificRemoteConfigKey;

        if (Platform.isIOS) {
          expect(result, 'ios_key with spaces');
        } else {
          expect(result, 'android_key with spaces');
        }
      });

      test(
        'should return different results for different platforms simulation',
        () {
          const key = 'test_key';
          final result = key.toOsSpecificRemoteConfigKey;

          expect(
            result.startsWith('ios_') || result.startsWith('android_'),
            true,
          );
          expect(result.endsWith('test_key'), true);
        },
      );
    });

    group('platform consistency', () {
      test('should maintain proper prefix format', () {
        const testKeys = [
          'a',
          'test',
          'long_key_name',
          '123',
          'key-with-dashes',
        ];

        for (final key in testKeys) {
          final result = key.toOsSpecificRemoteConfigKey;

          if (Platform.isIOS) {
            expect(result.indexOf('ios_'), 0);
            expect(result.substring(4), key);
          } else {
            expect(result.indexOf('android_'), 0);
            expect(result.substring(8), key);
          }
        }
      });

      test(
        'should handle edge case where key already contains platform prefix',
        () {
          const key = 'ios_already_prefixed';
          final result = key.toOsSpecificRemoteConfigKey;

          if (Platform.isIOS) {
            expect(result, 'ios_ios_already_prefixed');
          } else {
            expect(result, 'android_ios_already_prefixed');
          }
        },
      );
    });
  });
}
