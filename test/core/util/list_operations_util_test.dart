import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/core/util/list_operations_util.dart';

class TestItem {
  const TestItem({required this.id, required this.name, required this.value});

  final String id;
  final String name;
  final int value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TestItem &&
        other.id == id &&
        other.name == name &&
        other.value == value;
  }

  @override
  int get hashCode => Object.hash(id, name, value);

  @override
  String toString() => 'TestItem(id: $id, name: $name, value: $value)';
}

void main() {
  group('ListOperationsUtil', () {
    late List<TestItem> testItems;

    setUp(() {
      testItems = [
        const TestItem(id: '1', name: 'Item 1', value: 10),
        const TestItem(id: '2', name: 'Item 2', value: 20),
        const TestItem(id: '3', name: 'Item 3', value: 30),
      ];
    });

    group('addUniqueItems', () {
      test('should add unique items only', () {
        final newItems = [
          const TestItem(
            id: '2',
            name: 'Item 2 Duplicate',
            value: 25,
          ), // Duplicate ID
          const TestItem(id: '4', name: 'Item 4', value: 40), // New item
          const TestItem(id: '5', name: 'Item 5', value: 50), // New item
        ];

        final result = ListOperationsUtil.addUniqueItems(
          testItems,
          newItems,
          (item) => item.id,
        );

        expect(result.length, 5); // 3 original + 2 unique new items
        expect(result.map((e) => e.id), ['1', '2', '3', '4', '5']);
        expect(result.where((e) => e.id == '4').first.name, 'Item 4');
        expect(result.where((e) => e.id == '5').first.name, 'Item 5');
      });

      test('should handle empty current list', () {
        final newItems = [
          const TestItem(id: '1', name: 'Item 1', value: 10),
          const TestItem(id: '2', name: 'Item 2', value: 20),
        ];

        final result = ListOperationsUtil.addUniqueItems(
          <TestItem>[],
          newItems,
          (item) => item.id,
        );

        expect(result.length, 2);
        expect(result, newItems);
      });

      test('should handle empty new items', () {
        final result = ListOperationsUtil.addUniqueItems(
          testItems,
          <TestItem>[],
          (item) => item.id,
        );

        expect(result.length, 3);
        expect(result, testItems);
      });

      test('should work with different key extractors', () {
        final newItems = [
          const TestItem(
            id: '4',
            name: 'Item 2',
            value: 40,
          ), // Same name as existing
          const TestItem(id: '5', name: 'Item 6', value: 50), // New name
        ];

        final result = ListOperationsUtil.addUniqueItems(
          testItems,
          newItems,
          (item) => item.name, // Using name as key instead of id
        );

        expect(result.length, 4); // 3 original + 1 unique name
        expect(result.map((e) => e.name), [
          'Item 1',
          'Item 2',
          'Item 3',
          'Item 6',
        ]);
      });
    });

    group('appendItems', () {
      test('should append all items', () {
        final newItems = [
          const TestItem(id: '4', name: 'Item 4', value: 40),
          const TestItem(id: '5', name: 'Item 5', value: 50),
        ];

        final result = ListOperationsUtil.appendItems(testItems, newItems);

        expect(result.length, 5);
        expect(result.sublist(0, 3), testItems);
        expect(result.sublist(3), newItems);
      });

      test('should handle empty lists', () {
        final result1 = ListOperationsUtil.appendItems(testItems, <TestItem>[]);
        final result2 = ListOperationsUtil.appendItems(<TestItem>[], testItems);

        expect(result1, testItems);
        expect(result2, testItems);
      });
    });

    group('removeWhere', () {
      test('should remove items matching condition', () {
        final result = ListOperationsUtil.removeWhere(
          testItems,
          (item) => item.value > 15,
        );

        expect(result.length, 1);
        expect(result.first.id, '1');
      });

      test('should return same list when no matches', () {
        final result = ListOperationsUtil.removeWhere(
          testItems,
          (item) => item.value > 100,
        );

        expect(result.length, 3);
        expect(result, testItems);
      });

      test('should return empty list when all match', () {
        final result = ListOperationsUtil.removeWhere(
          testItems,
          (item) => item.value > 0,
        );

        expect(result.isEmpty, true);
      });
    });

    group('removeByKey', () {
      test('should remove item with matching key', () {
        final result = ListOperationsUtil.removeByKey(
          testItems,
          '2',
          (item) => item.id,
        );

        expect(result.length, 2);
        expect(result.map((e) => e.id), ['1', '3']);
      });

      test('should return same list when key not found', () {
        final result = ListOperationsUtil.removeByKey(
          testItems,
          'nonexistent',
          (item) => item.id,
        );

        expect(result.length, 3);
        expect(result, testItems);
      });
    });

    group('removeByKeys', () {
      test('should remove items with matching keys', () {
        final result = ListOperationsUtil.removeByKeys(testItems, {
          '1',
          '3',
        }, (item) => item.id);

        expect(result.length, 1);
        expect(result.first.id, '2');
      });

      test('should handle empty key set', () {
        final result = ListOperationsUtil.removeByKeys(
          testItems,
          <String>{},
          (item) => item.id,
        );

        expect(result.length, 3);
        expect(result, testItems);
      });
    });

    group('updateByKey', () {
      test('should update item with matching key', () {
        const newItem = TestItem(id: '2', name: 'Updated Item 2', value: 99);

        final result = ListOperationsUtil.updateByKey(
          testItems,
          '2',
          newItem,
          (item) => item.id,
        );

        expect(result.length, 3);
        expect(result.where((e) => e.id == '2').first.name, 'Updated Item 2');
        expect(result.where((e) => e.id == '2').first.value, 99);
      });

      test('should return same list when key not found', () {
        const newItem = TestItem(id: 'new', name: 'New Item', value: 99);

        final result = ListOperationsUtil.updateByKey(
          testItems,
          'nonexistent',
          newItem,
          (item) => item.id,
        );

        expect(result.length, 3);
        expect(result, testItems);
      });
    });

    group('updateByKeyTransform', () {
      test('should transform item with matching key', () {
        final result = ListOperationsUtil.updateByKeyTransform(
          testItems,
          '2',
          (item) => TestItem(
            id: item.id,
            name: '${item.name} Transformed',
            value: item.value * 2,
          ),
          (item) => item.id,
        );

        expect(result.length, 3);
        final updatedItem = result.where((e) => e.id == '2').first;
        expect(updatedItem.name, 'Item 2 Transformed');
        expect(updatedItem.value, 40);
      });

      test('should return same list when key not found', () {
        final result = ListOperationsUtil.updateByKeyTransform(
          testItems,
          'nonexistent',
          (item) => TestItem(
            id: item.id,
            name: '${item.name} Transformed',
            value: item.value * 2,
          ),
          (item) => item.id,
        );

        expect(result.length, 3);
        expect(result, testItems);
      });
    });

    group('findByKey', () {
      test('should find item with matching key', () {
        final result = ListOperationsUtil.findByKey(
          testItems,
          '2',
          (item) => item.id,
        );

        expect(result, isNotNull);
        expect(result!.id, '2');
        expect(result.name, 'Item 2');
      });

      test('should return null when key not found', () {
        final result = ListOperationsUtil.findByKey(
          testItems,
          'nonexistent',
          (item) => item.id,
        );

        expect(result, isNull);
      });
    });

    group('containsKey', () {
      test('should return true when key exists', () {
        final result = ListOperationsUtil.containsKey(
          testItems,
          '2',
          (item) => item.id,
        );

        expect(result, true);
      });

      test('should return false when key does not exist', () {
        final result = ListOperationsUtil.containsKey(
          testItems,
          'nonexistent',
          (item) => item.id,
        );

        expect(result, false);
      });
    });

    group('mergeLists', () {
      test('should merge lists with second list taking precedence', () {
        final list1 = [
          const TestItem(id: '1', name: 'Item 1 Original', value: 10),
          const TestItem(id: '2', name: 'Item 2 Original', value: 20),
        ];
        final list2 = [
          const TestItem(id: '2', name: 'Item 2 Updated', value: 25),
          const TestItem(id: '3', name: 'Item 3', value: 30),
        ];

        final result = ListOperationsUtil.mergeLists(
          list1,
          list2,
          (item) => item.id,
        );

        expect(result.length, 3);
        expect(result.map((e) => e.id), ['2', '3', '1']);
        expect(
          result.where((e) => e.id == '2').first.name,
          'Item 2 Updated',
        ); // list2 takes precedence
      });

      test('should handle empty lists', () {
        final result1 = ListOperationsUtil.mergeLists(
          testItems,
          <TestItem>[],
          (item) => item.id,
        );
        final result2 = ListOperationsUtil.mergeLists(
          <TestItem>[],
          testItems,
          (item) => item.id,
        );

        expect(result1, testItems);
        expect(result2, testItems);
      });
    });

    group('chunkList', () {
      test('should split list into chunks', () {
        final result = ListOperationsUtil.chunkList(testItems, 2);

        expect(result.length, 2);
        expect(result[0].length, 2);
        expect(result[1].length, 1);
        expect(result[0], testItems.sublist(0, 2));
        expect(result[1], testItems.sublist(2));
      });

      test('should handle chunk size larger than list', () {
        final result = ListOperationsUtil.chunkList(testItems, 10);

        expect(result.length, 1);
        expect(result[0], testItems);
      });

      test('should handle chunk size of 1', () {
        final result = ListOperationsUtil.chunkList(testItems, 1);

        expect(result.length, 3);
        expect(result[0].length, 1);
        expect(result[1].length, 1);
        expect(result[2].length, 1);
      });

      test('should return original list for invalid chunk size', () {
        final result = ListOperationsUtil.chunkList(testItems, 0);

        expect(result.length, 1);
        expect(result[0], testItems);
      });
    });

    group('partitionList', () {
      test('should partition list based on condition', () {
        final result = ListOperationsUtil.partitionList(
          testItems,
          (item) => item.value > 15,
        );

        expect(result.matching.length, 2);
        expect(result.nonMatching.length, 1);
        expect(result.matching.map((e) => e.id), ['2', '3']);
        expect(result.nonMatching.map((e) => e.id), ['1']);
        expect(result.totalCount, 3);
        expect(result.hasMatching, true);
        expect(result.hasNonMatching, true);
      });

      test('should handle all matching condition', () {
        final result = ListOperationsUtil.partitionList(
          testItems,
          (item) => item.value > 0,
        );

        expect(result.matching.length, 3);
        expect(result.nonMatching.length, 0);
        expect(result.hasMatching, true);
        expect(result.hasNonMatching, false);
      });

      test('should handle no matching condition', () {
        final result = ListOperationsUtil.partitionList(
          testItems,
          (item) => item.value > 100,
        );

        expect(result.matching.length, 0);
        expect(result.nonMatching.length, 3);
        expect(result.hasMatching, false);
        expect(result.hasNonMatching, true);
      });
    });

    group('getLastItem and getFirstItem', () {
      test('should return last and first items', () {
        final last = ListOperationsUtil.getLastItem(testItems);
        final first = ListOperationsUtil.getFirstItem(testItems);

        expect(last?.id, '3');
        expect(first?.id, '1');
      });

      test('should return null for empty list', () {
        final last = ListOperationsUtil.getLastItem(<TestItem>[]);
        final first = ListOperationsUtil.getFirstItem(<TestItem>[]);

        expect(last, isNull);
        expect(first, isNull);
      });
    });

    group('extractKeys', () {
      test('should extract unique keys', () {
        final duplicatedList = [
          ...testItems,
          const TestItem(
            id: '1',
            name: 'Duplicate ID',
            value: 99,
          ), // Duplicate ID
        ];

        final keys = ListOperationsUtil.extractKeys(
          duplicatedList,
          (item) => item.id,
        );

        expect(keys.length, 3); // Should be unique
        expect(keys, {'1', '2', '3'});
      });

      test('should handle empty list', () {
        final keys = ListOperationsUtil.extractKeys(
          <TestItem>[],
          (item) => item.id,
        );

        expect(keys.isEmpty, true);
      });
    });
  });

  group('ListPartition', () {
    test('should provide correct properties', () {
      const partition = ListPartition(matching: ['a', 'b'], nonMatching: ['c']);

      expect(partition.totalCount, 3);
      expect(partition.hasMatching, true);
      expect(partition.hasNonMatching, true);
    });

    test('should handle empty partitions', () {
      const partition = ListPartition<String>(matching: [], nonMatching: []);

      expect(partition.totalCount, 0);
      expect(partition.hasMatching, false);
      expect(partition.hasNonMatching, false);
    });
  });
}
