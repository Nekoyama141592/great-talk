/// Abstract interface for file operations with caching support.
/// Handles retrieving objects from cloud storage with local caching.
abstract class IFileUseCase {
  /// Retrieves an object from cloud storage with caching support.
  /// Returns cached version if available, otherwise fetches from cloud storage.
  ///
  /// [bucketName] - The name of the storage bucket
  /// [fileName] - The name of the file to retrieve
  ///
  /// Returns the file content as a String, or null if file is empty or not found.
  Future<String?> getObject(String bucketName, String fileName);
}
