/// Utility class for common list operations in ViewModels and Notifiers
class ListOperationsUtil {
  /// Adds unique items to a list, preventing duplicates based on a key extractor
  /// This is the most common pattern seen in posts_view_model.dart and timelines_view_model.dart
  static List<T> addUniqueItems<T, K>(
    List<T> currentList,
    List<T> newItems,
    K Function(T) keyExtractor,
  ) {
    final existingKeys = currentList.map(keyExtractor).toSet();
    final uniqueNewItems =
        newItems
            .where((item) => !existingKeys.contains(keyExtractor(item)))
            .toList();
    return [...currentList, ...uniqueNewItems];
  }

  /// Appends new items to an existing list (pagination pattern)
  /// Used for adding more items when loading more content
  static List<T> appendItems<T>(List<T> currentList, List<T> newItems) {
    return [...currentList, ...newItems];
  }

  /// Removes items from a list based on a condition
  static List<T> removeWhere<T>(List<T> list, bool Function(T) condition) {
    return list.where((item) => !condition(item)).toList();
  }

  /// Removes items from a list based on a key match
  static List<T> removeByKey<T, K>(
    List<T> list,
    K keyToRemove,
    K Function(T) keyExtractor,
  ) {
    return list.where((item) => keyExtractor(item) != keyToRemove).toList();
  }

  /// Removes items from a list based on multiple keys
  static List<T> removeByKeys<T, K>(
    List<T> list,
    Set<K> keysToRemove,
    K Function(T) keyExtractor,
  ) {
    return list
        .where((item) => !keysToRemove.contains(keyExtractor(item)))
        .toList();
  }

  /// Updates an item in a list based on a key match
  static List<T> updateByKey<T, K>(
    List<T> list,
    K key,
    T newItem,
    K Function(T) keyExtractor,
  ) {
    return list.map((item) {
      if (keyExtractor(item) == key) {
        return newItem;
      }
      return item;
    }).toList();
  }

  /// Updates an item in a list based on a key match using a transformer function
  static List<T> updateByKeyTransform<T, K>(
    List<T> list,
    K key,
    T Function(T) transformer,
    K Function(T) keyExtractor,
  ) {
    return list.map((item) {
      if (keyExtractor(item) == key) {
        return transformer(item);
      }
      return item;
    }).toList();
  }

  /// Finds an item in a list based on a key
  static T? findByKey<T, K>(List<T> list, K key, K Function(T) keyExtractor) {
    try {
      return list.firstWhere((item) => keyExtractor(item) == key);
    } catch (e) {
      return null;
    }
  }

  /// Checks if a list contains an item with a specific key
  static bool containsKey<T, K>(
    List<T> list,
    K key,
    K Function(T) keyExtractor,
  ) {
    return list.any((item) => keyExtractor(item) == key);
  }

  /// Merges two lists and removes duplicates based on a key extractor
  /// The second list takes precedence in case of duplicates
  static List<T> mergeLists<T, K>(
    List<T> list1,
    List<T> list2,
    K Function(T) keyExtractor,
  ) {
    final result = <T>[];
    final keys = <K>{};

    // Add items from list2 first (higher precedence)
    for (final item in list2) {
      final key = keyExtractor(item);
      if (!keys.contains(key)) {
        result.add(item);
        keys.add(key);
      }
    }

    // Add items from list1 that don't conflict
    for (final item in list1) {
      final key = keyExtractor(item);
      if (!keys.contains(key)) {
        result.add(item);
        keys.add(key);
      }
    }

    return result;
  }

  /// Splits a list into chunks of specified size
  static List<List<T>> chunkList<T>(List<T> list, int chunkSize) {
    if (chunkSize <= 0) return [list];

    final chunks = <List<T>>[];
    for (int i = 0; i < list.length; i += chunkSize) {
      chunks.add(
        list.sublist(
          i,
          i + chunkSize > list.length ? list.length : i + chunkSize,
        ),
      );
    }
    return chunks;
  }

  /// Filters a list and returns both matching and non-matching items
  static ListPartition<T> partitionList<T>(
    List<T> list,
    bool Function(T) condition,
  ) {
    final matching = <T>[];
    final nonMatching = <T>[];

    for (final item in list) {
      if (condition(item)) {
        matching.add(item);
      } else {
        nonMatching.add(item);
      }
    }

    return ListPartition(matching: matching, nonMatching: nonMatching);
  }

  /// Safely gets the last item from a list
  static T? getLastItem<T>(List<T> list) {
    return list.isEmpty ? null : list.last;
  }

  /// Safely gets the first item from a list
  static T? getFirstItem<T>(List<T> list) {
    return list.isEmpty ? null : list.first;
  }

  /// Extracts unique keys from a list
  static Set<K> extractKeys<T, K>(List<T> list, K Function(T) keyExtractor) {
    return list.map(keyExtractor).toSet();
  }
}

/// Result class for list partitioning operations
class ListPartition<T> {
  const ListPartition({required this.matching, required this.nonMatching});

  final List<T> matching;
  final List<T> nonMatching;

  /// Total count of items in both partitions
  int get totalCount => matching.length + nonMatching.length;

  /// Returns true if there are matching items
  bool get hasMatching => matching.isNotEmpty;

  /// Returns true if there are non-matching items
  bool get hasNonMatching => nonMatching.isNotEmpty;
}
