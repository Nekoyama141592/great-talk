import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/component/mosaic_card/components/mosaic_user_child.dart';
import 'package:great_talk/domain/database_schema/public_user/public_user.dart';

void main() {
  group('MosaicUserChild', () {
    late PublicUser testUser;

    setUp(() {
      testUser = PublicUser(
        uid: 'test_uid',
        userName: const {'value': 'Test User'},
        bio: const {'value': 'Test bio'},
        image: const {'value': 'test.jpg'},
        followerCount: 100,
        followingCount: 50,
        postCount: 25,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isOfficial: false,
      );
    });

    testWidgets('should display title and info icon', (
      WidgetTester tester,
    ) async {
      const title = 'Test Title';
      const message = 'Test message';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MosaicUserChild(
              publicUser: testUser,
              msg: message,
              title: title,
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.byIcon(Icons.info), findsOneWidget);
    });

    testWidgets('should have correct layout structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MosaicUserChild(
              publicUser: testUser,
              msg: 'Test message',
              title: 'Test Title',
            ),
          ),
        ),
      );

      expect(find.byType(Row), findsOneWidget);
      expect(find.byType(InkWell), findsOneWidget);

      final row = tester.widget<Row>(find.byType(Row));
      expect(row.mainAxisAlignment, MainAxisAlignment.center);
      expect(row.children.length, 3); // title, width box, inkwell
    });

    testWidgets('should have white info icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MosaicUserChild(
              publicUser: testUser,
              msg: 'Test message',
              title: 'Test Title',
            ),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.info));
      expect(icon.color, Colors.white);
    });

    testWidgets('should display different titles correctly', (
      WidgetTester tester,
    ) async {
      final titles = ['ミュートしている', '不適切なユーザー', 'ブロックされたユーザー', 'テストタイトル'];

      for (final title in titles) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MosaicUserChild(
                publicUser: testUser,
                msg: 'Test message',
                title: title,
              ),
            ),
          ),
        );

        expect(find.text(title), findsOneWidget);
      }
    });

    testWidgets('should handle different message lengths', (
      WidgetTester tester,
    ) async {
      final messages = [
        'Short',
        'このユーザーは不適切なコンテンツを投稿したため、ミュートされています。',
        'A very long message that might wrap to multiple lines and test how the widget handles longer text content.',
        '',
      ];

      for (final message in messages) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MosaicUserChild(
                publicUser: testUser,
                msg: message,
                title: 'Test Title',
              ),
            ),
          ),
        );

        expect(find.text('Test Title'), findsOneWidget);
        expect(find.byIcon(Icons.info), findsOneWidget);
      }
    });

    testWidgets('should handle different user properties', (
      WidgetTester tester,
    ) async {
      final users = [
        PublicUser(
          uid: 'user1',
          userName: const {'value': 'Regular User'},
          bio: const {'value': 'Bio'},
          image: const {'value': ''},
          followerCount: 0,
          followingCount: 0,
          postCount: 0,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isOfficial: false,
        ),
        PublicUser(
          uid: 'user2',
          userName: const {'value': 'Official User'},
          bio: const {'value': 'Official bio'},
          image: const {'value': 'official.jpg'},
          followerCount: 10000,
          followingCount: 100,
          postCount: 500,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          isOfficial: true,
        ),
      ];

      for (final user in users) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MosaicUserChild(
                publicUser: user,
                msg: 'Message for ${user.nameValue}',
                title: 'User Title',
              ),
            ),
          ),
        );

        expect(find.text('User Title'), findsOneWidget);
        expect(find.byIcon(Icons.info), findsOneWidget);
      }
    });

    testWidgets('should be tappable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MosaicUserChild(
              publicUser: testUser,
              msg: 'Test message',
              title: 'Test Title',
            ),
          ),
        ),
      );

      expect(find.byType(InkWell), findsOneWidget);

      // Verify that the InkWell has an onTap callback
      final inkWell = tester.widget<InkWell>(find.byType(InkWell));
      expect(inkWell.onTap, isNotNull);
    });

    testWidgets('should handle empty strings gracefully', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MosaicUserChild(publicUser: testUser, msg: '', title: ''),
          ),
        ),
      );

      expect(find.text(''), findsOneWidget); // Empty title
      expect(find.byIcon(Icons.info), findsOneWidget);
    });

    testWidgets('should maintain layout consistency across different content', (
      WidgetTester tester,
    ) async {
      final testCases = [
        {'title': 'Short', 'msg': 'Short'},
        {
          'title': 'Very Long Title That Might Wrap',
          'msg': 'Very long message',
        },
        {'title': '日本語タイトル', 'msg': '日本語メッセージ'},
        {'title': '🚫 Emoji Title', 'msg': '⚠️ Emoji message'},
      ];

      for (final testCase in testCases) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MosaicUserChild(
                publicUser: testUser,
                msg: testCase['msg']!,
                title: testCase['title']!,
              ),
            ),
          ),
        );

        // Verify consistent structure
        expect(find.byType(Row), findsOneWidget);
        expect(find.byIcon(Icons.info), findsOneWidget);
        expect(find.text(testCase['title']!), findsOneWidget);

        final row = tester.widget<Row>(find.byType(Row));
        expect(row.mainAxisAlignment, MainAxisAlignment.center);
      }
    });

    testWidgets('should work with different screen sizes', (
      WidgetTester tester,
    ) async {
      const title = 'Responsive Test Title';
      const message = 'Test message for responsive design';

      final screenSizes = [
        const Size(400, 800), // Mobile
        const Size(768, 1024), // Tablet
        const Size(1200, 800), // Desktop
      ];

      for (final size in screenSizes) {
        await tester.binding.setSurfaceSize(size);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MosaicUserChild(
                publicUser: testUser,
                msg: message,
                title: title,
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();

        expect(find.text(title), findsOneWidget);
        expect(find.byIcon(Icons.info), findsOneWidget);
        expect(find.byType(Row), findsOneWidget);
      }

      // Reset to default size
      await tester.binding.setSurfaceSize(null);
    });

    testWidgets('should work within different parent layouts', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                const Text('Header'),
                Expanded(
                  child: ListView(
                    children: [
                      MosaicUserChild(
                        publicUser: testUser,
                        msg: 'Message 1',
                        title: 'Title 1',
                      ),
                      const SizedBox(height: 10),
                      MosaicUserChild(
                        publicUser: testUser,
                        msg: 'Message 2',
                        title: 'Title 2',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Title 1'), findsOneWidget);
      expect(find.text('Title 2'), findsOneWidget);
      expect(find.byType(MosaicUserChild), findsNWidgets(2));
    });

    testWidgets('should handle theme changes', (WidgetTester tester) async {
      // Test with light theme
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: MosaicUserChild(
              publicUser: testUser,
              msg: 'Light theme message',
              title: 'Light Theme',
            ),
          ),
        ),
      );

      final lightIcon = tester.widget<Icon>(find.byIcon(Icons.info));
      expect(lightIcon.color, Colors.white); // Should always be white

      // Test with dark theme
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: MosaicUserChild(
              publicUser: testUser,
              msg: 'Dark theme message',
              title: 'Dark Theme',
            ),
          ),
        ),
      );

      final darkIcon = tester.widget<Icon>(find.byIcon(Icons.info));
      expect(darkIcon.color, Colors.white); // Should always be white
    });

    group('Edge cases', () {
      testWidgets('should handle null-like values gracefully', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: MosaicUserChild(publicUser: testUser, msg: '', title: ''),
            ),
          ),
        );

        expect(find.byType(MosaicUserChild), findsOneWidget);
        expect(find.byIcon(Icons.info), findsOneWidget);
      });

      testWidgets('should handle very long text content', (
        WidgetTester tester,
      ) async {
        const longTitle = 'Very Long Title';
        const longMessage =
            'This is a very long message that should be handled properly by the dialog system when the info icon is tapped.';

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SizedBox(
                width: 300,
                child: MosaicUserChild(
                  publicUser: testUser,
                  msg: longMessage,
                  title: longTitle,
                ),
              ),
            ),
          ),
        );

        expect(find.text(longTitle), findsOneWidget);
        expect(find.byIcon(Icons.info), findsOneWidget);
      });
    });
  });
}
