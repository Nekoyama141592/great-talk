import 'package:great_talk/infrastructure/model/result/result.dart';

/// Utility class for common pagination patterns in ViewModels
class PaginationUtil {
  /// Generic pagination handler for loading more items
  /// Used by RefreshInterface implementations
  static Future<Result<List<T>>> loadMoreItems<T, K>({
    required List<T> currentItems,
    required Future<List<T>> Function(K lastKey) loadMoreFunction,
    required K Function(T) keyExtractor,
    String? emptyListMessage,
  }) async {
    if (currentItems.isEmpty) {
      return Result.failure(emptyListMessage ?? 'リストが空です');
    }

    try {
      final lastItem = currentItems.last;
      final lastKey = keyExtractor(lastItem);
      final newItems = await loadMoreFunction(lastKey);

      final updatedList = [...currentItems, ...newItems];
      return Result.success(updatedList);
    } catch (e) {
      return Result.failure('データの読み込みに失敗しました: $e');
    }
  }

  /// Pagination handler that prevents duplicate items
  /// Combines loading more items with duplicate prevention
  static Future<Result<List<T>>> loadMoreUniqueItems<T, K, U>({
    required List<T> currentItems,
    required Future<List<U>> Function(K lastKey) loadMoreFunction,
    required Future<List<T>> Function(List<U>) transformFunction,
    required K Function(T) keyExtractor,
    required U Function(T) uniqueKeyExtractor,
    String? emptyListMessage,
  }) async {
    if (currentItems.isEmpty) {
      return Result.failure(emptyListMessage ?? 'リストが空です');
    }

    try {
      final lastItem = currentItems.last;
      final lastKey = keyExtractor(lastItem);
      final rawNewItems = await loadMoreFunction(lastKey);
      final newItems = await transformFunction(rawNewItems);

      // Remove duplicates based on unique key
      final existingKeys = currentItems.map(uniqueKeyExtractor).toSet();
      final uniqueNewItems =
          newItems
              .where((item) => !existingKeys.contains(uniqueKeyExtractor(item)))
              .toList();

      final updatedList = [...currentItems, ...uniqueNewItems];
      return Result.success(updatedList);
    } catch (e) {
      return Result.failure('データの読み込みに失敗しました: $e');
    }
  }

  /// Validates that pagination is possible (list is not empty and loading is not in progress)
  static Result<T> validatePaginationPossible<T>(
    T? lastItem,
    bool isLoading, {
    String? loadingMessage,
    String? emptyMessage,
  }) {
    if (isLoading) {
      return Result.failure(loadingMessage ?? 'ロード中です');
    }
    if (lastItem == null) {
      return Result.failure(emptyMessage ?? 'データがありません');
    }
    return Result.success(lastItem);
  }

  /// Gets the last item safely for pagination
  static T? getLastItemSafely<T>(List<T> items) {
    return items.isEmpty ? null : items.last;
  }

  /// Gets the first item safely for reverse pagination
  static T? getFirstItemSafely<T>(List<T> items) {
    return items.isEmpty ? null : items.first;
  }

  /// Calculates if more items should be loaded based on scroll position
  /// Returns true if user is near the end of the list
  static bool shouldLoadMore({
    required int currentIndex,
    required int totalItems,
    int threshold = 3,
  }) {
    return currentIndex >= totalItems - threshold;
  }

  /// Creates a pagination state object
  static PaginationState<T> createPaginationState<T>({
    required List<T> items,
    required bool hasMore,
    required bool isLoading,
    String? error,
  }) {
    return PaginationState(
      items: items,
      hasMore: hasMore,
      isLoading: isLoading,
      error: error,
    );
  }

  /// Updates pagination state with new items
  static PaginationState<T> appendToPaginationState<T>(
    PaginationState<T> currentState,
    List<T> newItems, {
    bool? hasMore,
  }) {
    return PaginationState(
      items: [...currentState.items, ...newItems],
      hasMore: hasMore ?? currentState.hasMore,
      isLoading: false,
      error: null,
    );
  }

  /// Sets loading state for pagination
  static PaginationState<T> setLoadingState<T>(
    PaginationState<T> currentState,
  ) {
    return PaginationState(
      items: currentState.items,
      hasMore: currentState.hasMore,
      isLoading: true,
      error: null,
    );
  }

  /// Sets error state for pagination
  static PaginationState<T> setErrorState<T>(
    PaginationState<T> currentState,
    String error,
  ) {
    return PaginationState(
      items: currentState.items,
      hasMore: currentState.hasMore,
      isLoading: false,
      error: error,
    );
  }

  /// Resets pagination state
  static PaginationState<T> resetPaginationState<T>() {
    return const PaginationState(
      items: [],
      hasMore: true,
      isLoading: false,
      error: null,
    );
  }
}

/// State class for pagination management
class PaginationState<T> {
  const PaginationState({
    required this.items,
    required this.hasMore,
    required this.isLoading,
    this.error,
  });

  final List<T> items;
  final bool hasMore;
  final bool isLoading;
  final String? error;

  /// Returns true if there are items in the list
  bool get hasItems => items.isNotEmpty;

  /// Returns true if there's an error
  bool get hasError => error != null;

  /// Returns true if pagination can continue
  bool get canLoadMore => hasMore && !isLoading && !hasError;

  /// Returns the number of items
  int get itemCount => items.length;

  /// Returns the last item safely
  T? get lastItem => items.isEmpty ? null : items.last;

  /// Returns the first item safely
  T? get firstItem => items.isEmpty ? null : items.first;

  /// Creates a copy with updated values
  PaginationState<T> copyWith({
    List<T>? items,
    bool? hasMore,
    bool? isLoading,
    String? error,
  }) {
    return PaginationState(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'PaginationState(items: ${items.length}, hasMore: $hasMore, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaginationState<T> &&
        other.items == items &&
        other.hasMore == hasMore &&
        other.isLoading == isLoading &&
        other.error == error;
  }

  @override
  int get hashCode {
    return items.hashCode ^
        hasMore.hashCode ^
        isLoading.hashCode ^
        error.hashCode;
  }
}
