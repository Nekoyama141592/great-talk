import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:great_talk/repository/remote_config_repository.dart';
import 'package:great_talk/consts/remote_config_constants.dart';
import 'dart:io';

void main() {
  group('RemoteConfigRepository Tests', () {
    late RemoteConfigRepository repository;
    late MockFirebaseRemoteConfig mockRemoteConfig;

    setUp(() {
      mockRemoteConfig = MockFirebaseRemoteConfig();
      repository = RemoteConfigRepository(mockRemoteConfig);
    });

    group('init', () {
      test('should set config settings and defaults successfully', () async {
        await repository.init();

        expect(mockRemoteConfig.setConfigSettingsCalled, true);
        expect(mockRemoteConfig.setDefaultsCalled, true);
        expect(mockRemoteConfig.configSettings?.fetchTimeout.inMinutes, 1);
        expect(
          mockRemoteConfig.configSettings?.minimumFetchInterval.inSeconds,
          15,
        );
      });

      test('should set correct default values', () async {
        await repository.init();

        final prefix = Platform.isIOS ? 'ios' : 'android';
        final maintenanceKey = '${prefix}_maintenance_msg';
        final versionKey = '${prefix}_forced_update_version';

        expect(mockRemoteConfig.defaults.containsKey(maintenanceKey), true);
        expect(mockRemoteConfig.defaults.containsKey(versionKey), true);
        expect(
          mockRemoteConfig.defaults[maintenanceKey],
          RemoteConfigConstants.maintenanceMsg,
        );
        expect(
          mockRemoteConfig.defaults[versionKey],
          RemoteConfigConstants.appVersion,
        );
      });

      test('should handle exceptions during initialization', () async {
        mockRemoteConfig.throwOnSetConfigSettings = true;

        expect(() => repository.init(), throwsException);
      });
    });

    group('fetchAndActivate', () {
      test('should return true when fetch and activate succeeds', () async {
        mockRemoteConfig.fetchAndActivateResult = true;

        final result = await repository.fetchAndActivate();

        expect(result, true);
        expect(mockRemoteConfig.fetchAndActivateCalled, true);
      });

      test('should return false when fetch and activate fails', () async {
        mockRemoteConfig.fetchAndActivateResult = false;

        final result = await repository.fetchAndActivate();

        expect(result, false);
        expect(mockRemoteConfig.fetchAndActivateCalled, true);
      });

      test('should handle exceptions during fetch and activate', () async {
        mockRemoteConfig.throwOnFetchAndActivate = true;

        expect(() => repository.fetchAndActivate(), throwsException);
      });
    });

    group('getMaintenanceMsg', () {
      test('should return maintenance message', () async {
        const expectedMessage = 'システムメンテナンス中です';
        final prefix = Platform.isIOS ? 'ios' : 'android';
        final key = '${prefix}_maintenance_msg';

        // Initialize with defaults first
        await repository.init();
        mockRemoteConfig.setStringValue(key, expectedMessage);

        final result = repository.getMaintenanceMsg();

        expect(result, expectedMessage);
        expect(mockRemoteConfig.getStringCallCount, 1);
      });

      test('should return default maintenance message when not set', () async {
        await repository.init();

        final result = repository.getMaintenanceMsg();

        expect(result, RemoteConfigConstants.maintenanceMsg);
      });

      test('should use correct platform-specific key', () async {
        await repository.init();
        repository.getMaintenanceMsg();

        final prefix = Platform.isIOS ? 'ios' : 'android';
        final expectedKey = '${prefix}_maintenance_msg';
        expect(mockRemoteConfig.lastStringKey, expectedKey);
      });
    });

    group('getForcedUpdateVersion', () {
      test('should return forced update version', () async {
        const expectedVersion = 250;
        final prefix = Platform.isIOS ? 'ios' : 'android';
        final key = '${prefix}_forced_update_version';

        // Initialize with defaults first
        await repository.init();
        mockRemoteConfig.setIntValue(key, expectedVersion);

        final result = repository.getForcedUpdateVersion();

        expect(result, expectedVersion);
        expect(mockRemoteConfig.getIntCallCount, 1);
      });

      test('should return default version when not set', () async {
        await repository.init();

        final result = repository.getForcedUpdateVersion();

        expect(result, RemoteConfigConstants.appVersion);
      });

      test('should use correct platform-specific key', () async {
        await repository.init();
        repository.getForcedUpdateVersion();

        final prefix = Platform.isIOS ? 'ios' : 'android';
        final expectedKey = '${prefix}_forced_update_version';
        expect(mockRemoteConfig.lastIntKey, expectedKey);
      });
    });

    group('Platform-specific behavior', () {
      test('should use platform-specific keys', () async {
        await repository.init();
        repository.getMaintenanceMsg();
        repository.getForcedUpdateVersion();

        final prefix = Platform.isIOS ? 'ios' : 'android';
        expect(mockRemoteConfig.lastStringKey, '${prefix}_maintenance_msg');
        expect(mockRemoteConfig.lastIntKey, '${prefix}_forced_update_version');
      });
    });

    group('Integration tests', () {
      test('should initialize and fetch remote config successfully', () async {
        mockRemoteConfig.fetchAndActivateResult = true;

        await repository.init();
        final fetchResult = await repository.fetchAndActivate();

        expect(mockRemoteConfig.setConfigSettingsCalled, true);
        expect(mockRemoteConfig.setDefaultsCalled, true);
        expect(fetchResult, true);
      });

      test('should retrieve updated values after fetch', () async {
        // Set initial values
        await repository.init();

        final prefix = Platform.isIOS ? 'ios' : 'android';

        // Update remote values
        mockRemoteConfig.setStringValue(
          '${prefix}_maintenance_msg',
          'メンテナンス更新中',
        );
        mockRemoteConfig.setIntValue('${prefix}_forced_update_version', 300);

        // Fetch and activate
        mockRemoteConfig.fetchAndActivateResult = true;
        await repository.fetchAndActivate();

        final maintenanceMsg = repository.getMaintenanceMsg();
        final updateVersion = repository.getForcedUpdateVersion();

        expect(maintenanceMsg, 'メンテナンス更新中');
        expect(updateVersion, 300);
      });
    });

    group('Error handling', () {
      test('should handle various exception types gracefully', () async {
        final tests = [
          (
            'setConfigSettings',
            () => mockRemoteConfig.throwOnSetConfigSettings = true,
          ),
          ('setDefaults', () => mockRemoteConfig.throwOnSetDefaults = true),
          (
            'fetchAndActivate',
            () => mockRemoteConfig.throwOnFetchAndActivate = true,
          ),
        ];

        for (final (operation, setup) in tests) {
          mockRemoteConfig.reset();
          setup();

          expect(
            () async {
              switch (operation) {
                case 'setConfigSettings':
                case 'setDefaults':
                  await repository.init();
                  break;
                case 'fetchAndActivate':
                  await repository.fetchAndActivate();
                  break;
              }
            },
            throwsException,
            reason: '$operation should throw exception',
          );
        }
      });
    });

    group('Configuration validation', () {
      test('should set correct timeout values', () async {
        await repository.init();

        final settings = mockRemoteConfig.configSettings!;
        expect(settings.fetchTimeout, const Duration(minutes: 1));
        expect(settings.minimumFetchInterval, const Duration(seconds: 15));
      });

      test('should set all required default keys', () async {
        await repository.init();

        final prefix = Platform.isIOS ? 'ios' : 'android';
        final defaults = mockRemoteConfig.defaults;
        expect(defaults.containsKey('${prefix}_maintenance_msg'), true);
        expect(defaults.containsKey('${prefix}_forced_update_version'), true);
        expect(defaults.length, 2);
      });
    });
  });
}

// Mock implementation of FirebaseRemoteConfig
class MockFirebaseRemoteConfig implements FirebaseRemoteConfig {
  final Map<String, dynamic> _values = {};
  final Map<String, dynamic> defaults = {};
  RemoteConfigSettings? configSettings;

  bool setConfigSettingsCalled = false;
  bool setDefaultsCalled = false;
  bool fetchAndActivateCalled = false;
  bool fetchAndActivateResult = true;
  int getStringCallCount = 0;
  int getIntCallCount = 0;
  String? lastStringKey;
  String? lastIntKey;

  bool throwOnSetConfigSettings = false;
  bool throwOnSetDefaults = false;
  bool throwOnFetchAndActivate = false;

  void reset() {
    _values.clear();
    defaults.clear();
    configSettings = null;
    setConfigSettingsCalled = false;
    setDefaultsCalled = false;
    fetchAndActivateCalled = false;
    fetchAndActivateResult = true;
    getStringCallCount = 0;
    getIntCallCount = 0;
    lastStringKey = null;
    lastIntKey = null;
    throwOnSetConfigSettings = false;
    throwOnSetDefaults = false;
    throwOnFetchAndActivate = false;
  }

  void setStringValue(String key, String value) {
    _values[key] = value;
  }

  void setIntValue(String key, int value) {
    _values[key] = value;
  }

  @override
  Future<void> setConfigSettings(RemoteConfigSettings settings) async {
    if (throwOnSetConfigSettings) {
      throw Exception('Failed to set config settings');
    }
    configSettings = settings;
    setConfigSettingsCalled = true;
  }

  @override
  Future<void> setDefaults(Map<String, dynamic> defaultParameters) async {
    if (throwOnSetDefaults) {
      throw Exception('Failed to set defaults');
    }
    defaults.addAll(defaultParameters);
    setDefaultsCalled = true;
  }

  @override
  Future<bool> fetchAndActivate() async {
    if (throwOnFetchAndActivate) {
      throw Exception('Failed to fetch and activate');
    }
    fetchAndActivateCalled = true;
    return fetchAndActivateResult;
  }

  @override
  String getString(String key) {
    lastStringKey = key;
    getStringCallCount++;
    if (_values.containsKey(key)) {
      return _values[key]?.toString() ?? '';
    }
    if (defaults.containsKey(key)) {
      return defaults[key]?.toString() ?? '';
    }
    return '';
  }

  @override
  int getInt(String key) {
    lastIntKey = key;
    getIntCallCount++;
    if (_values.containsKey(key)) {
      return _values[key] ?? 0;
    }
    if (defaults.containsKey(key)) {
      return defaults[key] ?? 0;
    }
    return 0;
  }

  // Unimplemented methods from FirebaseRemoteConfig interface
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
