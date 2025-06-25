/// Abstract interface for remote configuration operations including
/// app maintenance messages and forced update version management.
abstract class IRemoteConfigRepository {
  /// Initializes remote config with default settings and values
  Future<void> init();

  /// Fetches the latest config values and activates them
  Future<bool> fetchAndActivate();

  /// Gets the maintenance message from remote config
  String getMaintenanceMsg();

  /// Gets the forced update version number from remote config
  int getForcedUpdateVersion();
}