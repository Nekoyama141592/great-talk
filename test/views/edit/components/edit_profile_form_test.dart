import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/model/view_model_state/edit/edit_state.dart';
import 'package:great_talk/views/edit/components/edit_profile_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('EditProfileForm', () {
    testWidgets('should display all form fields', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      final editState = EditState(
        userName: 'Test User',
        bio: 'Test Bio',
        base64: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: EditProfileForm(
                formKey: formKey,
                editModelData: editState,
              ),
            ),
          ),
        ),
      );

      expect(find.text('ニックネーム'), findsOneWidget);
      expect(find.text('紹介文'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
    });

    testWidgets('should display initial values from state', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      final editState = EditState(
        userName: 'Initial Username',
        bio: 'Initial Bio Text',
        base64: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: EditProfileForm(
                formKey: formKey,
                editModelData: editState,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Initial Username'), findsOneWidget);
      expect(find.text('Initial Bio Text'), findsOneWidget);
    });

    testWidgets('should have proper form structure', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      final editState = EditState(
        userName: 'Test User',
        bio: 'Test Bio',
        base64: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: EditProfileForm(
                formKey: formKey,
                editModelData: editState,
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

    testWidgets('should be scrollable', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      final editState = EditState(
        userName: 'Test User',
        bio: 'Test Bio',
        base64: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: EditProfileForm(
                formKey: formKey,
                editModelData: editState,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SingleChildScrollView), findsOneWidget);
    });

    testWidgets('should have proper spacing between fields', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      final editState = EditState(
        userName: 'Test User',
        bio: 'Test Bio',
        base64: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: EditProfileForm(
                formKey: formKey,
                editModelData: editState,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsAtLeastNWidgets(2));
    });

    testWidgets('should validate form properly', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      final editState = EditState(
        userName: '',
        bio: '',
        base64: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: EditProfileForm(
                formKey: formKey,
                editModelData: editState,
              ),
            ),
          ),
        ),
      );

      // Try to validate empty form
      expect(formKey.currentState?.validate(), false);
    });

    testWidgets('should handle different initial values', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      final editState = EditState(
        userName: '日本語ユーザー名',
        bio: '日本語の自己紹介文です。\n複数行のテキストもサポートしています。',
        base64: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: EditProfileForm(
                formKey: formKey,
                editModelData: editState,
              ),
            ),
          ),
        ),
      );

      expect(find.text('日本語ユーザー名'), findsOneWidget);
      expect(find.text('日本語の自己紹介文です。\n複数行のテキストもサポートしています。'), findsOneWidget);
    });

    testWidgets('should have SizedBox container', (WidgetTester tester) async {
      final formKey = GlobalKey<FormState>();
      final editState = EditState(
        userName: 'Test User',
        bio: 'Test Bio',
        base64: null,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: EditProfileForm(
                formKey: formKey,
                editModelData: editState,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });
  });
}