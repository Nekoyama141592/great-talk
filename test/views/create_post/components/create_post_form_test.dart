import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/state/create_post/create_post_state.dart';
import 'package:great_talk/presentation/page/create_post/components/create_post_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('CreatePostForm', () {
    testWidgets('should display all form fields', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CreatePostForm(
                formKey: formKey,
                state: null,
                deviceHeight: 800,
              ),
            ),
          ),
        ),
      );

      expect(find.text('システムプロンプト'), findsOneWidget);
      expect(find.text('説明/使い方(AIの一言目)'), findsOneWidget);
      expect(find.text('タイトル'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(3));
    });

    testWidgets('should display initial values from state', (
      WidgetTester tester,
    ) async {
      final formKey = GlobalKey<FormState>();
      final state = CreatePostState(
        systemPrompt: 'Test system prompt',
        description: 'Test description',
        title: 'Test title',
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CreatePostForm(
                formKey: formKey,
                state: state,
                deviceHeight: 800,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test system prompt'), findsOneWidget);
      expect(find.text('Test description'), findsOneWidget);
      expect(find.text('Test title'), findsOneWidget);
    });

    testWidgets('should have proper form structure', (
      WidgetTester tester,
    ) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CreatePostForm(
                formKey: formKey,
                state: null,
                deviceHeight: 800,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);

      // Verify the form uses the provided form key
      final form = tester.widget<Form>(find.byType(Form));
      expect(form.key, formKey);
    });

    testWidgets('should have correct height constraint', (
      WidgetTester tester,
    ) async {
      final formKey = GlobalKey<FormState>();
      const deviceHeight = 1000.0;

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CreatePostForm(
                formKey: formKey,
                state: null,
                deviceHeight: deviceHeight,
              ),
            ),
          ),
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find
            .ancestor(of: find.byType(Form), matching: find.byType(SizedBox))
            .first,
      );
      expect(sizedBox.height, deviceHeight * 0.50);
    });

    testWidgets('should be scrollable', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CreatePostForm(
                formKey: formKey,
                state: null,
                deviceHeight: 400, // Small height to force scrolling
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('should handle null state gracefully', (
      WidgetTester tester,
    ) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CreatePostForm(
                formKey: formKey,
                state: null,
                deviceHeight: 800,
              ),
            ),
          ),
        ),
      );

      // Should not crash and should display default values
      expect(find.byType(TextFormField), findsNWidgets(3));
      expect(find.text('システムプロンプト'), findsOneWidget);
      expect(find.text('説明/使い方(AIの一言目)'), findsOneWidget);
      expect(find.text('タイトル'), findsOneWidget);
    });

    testWidgets('should validate form properly', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CreatePostForm(
                formKey: formKey,
                state: null,
                deviceHeight: 800,
              ),
            ),
          ),
        ),
      );

      // Try to validate empty form
      expect(formKey.currentState?.validate(), false);
    });

    testWidgets('should have scrollable layout', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: CreatePostForm(
                formKey: formKey,
                state: null,
                deviceHeight: 800,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });
  });
}
