import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/auth/email_auth/components/email_auth_actions.dart';
import 'package:great_talk/presentation/component/rounded_button.dart';

void main() {
  group('EmailAuthActions', () {
    testWidgets('should display signup button when isSignUp is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: false,
              onAuth: () {},
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      expect(find.text('アカウントを作成'), findsOneWidget);
      expect(find.text('すでにアカウントをお持ちですか？ログイン'), findsOneWidget);
    });

    testWidgets('should display login button when isSignUp is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: false,
              isLoading: false,
              onAuth: () {},
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      expect(find.text('ログイン'), findsOneWidget);
      expect(find.text('アカウントをお持ちでない方はアカウント作成'), findsOneWidget);
    });

    testWidgets('should call onAuth when auth button is tapped', (
      WidgetTester tester,
    ) async {
      bool authCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: false,
              onAuth: () => authCalled = true,
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('アカウントを作成'));
      await tester.pump();

      expect(authCalled, true);
    });

    testWidgets('should call onToggleSignUpMode when toggle button is tapped', (
      WidgetTester tester,
    ) async {
      bool toggleCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: false,
              onAuth: () {},
              onToggleSignUpMode: () => toggleCalled = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('すでにアカウントをお持ちですか？ログイン'));
      await tester.pump();

      expect(toggleCalled, true);
    });

    testWidgets('should disable auth button when loading', (
      WidgetTester tester,
    ) async {
      bool authCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: true,
              onAuth: () => authCalled = true,
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('アカウントを作成'));
      await tester.pump();

      expect(authCalled, false);
    });

    testWidgets('should enable auth button when not loading', (
      WidgetTester tester,
    ) async {
      bool authCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: false,
              onAuth: () => authCalled = true,
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('アカウントを作成'));
      await tester.pump();

      expect(authCalled, true);
    });

    testWidgets('should have correct button styles', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: Colors.blue),
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: false,
              onAuth: () {},
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      // Should have one RoundedButton for auth and one TextButton for toggle
      expect(find.byType(RoundedButton), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('should display different texts for login and signup modes', (
      WidgetTester tester,
    ) async {
      // Test signup mode
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: false,
              onAuth: () {},
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      expect(find.text('アカウントを作成'), findsOneWidget);
      expect(find.text('すでにアカウントをお持ちですか？ログイン'), findsOneWidget);

      // Test login mode
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: false,
              isLoading: false,
              onAuth: () {},
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      expect(find.text('ログイン'), findsOneWidget);
      expect(find.text('アカウントをお持ちでない方はアカウント作成'), findsOneWidget);
    });

    testWidgets('should handle rapid button taps correctly', (
      WidgetTester tester,
    ) async {
      int authCount = 0;
      int toggleCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: false,
              onAuth: () => authCount++,
              onToggleSignUpMode: () => toggleCount++,
            ),
          ),
        ),
      );

      // Rapid taps on auth button
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.text('アカウントを作成'));
        await tester.pump(const Duration(milliseconds: 10));
      }

      // Rapid taps on toggle button
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.text('すでにアカウントをお持ちですか？ログイン'));
        await tester.pump(const Duration(milliseconds: 10));
      }

      expect(authCount, 5);
      expect(toggleCount, 3);
    });

    testWidgets('should maintain state correctly across rebuilds', (
      WidgetTester tester,
    ) async {
      bool isSignUp = true;
      bool isLoading = false;

      Widget buildWidget() {
        return MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: isSignUp,
              isLoading: isLoading,
              onAuth: () {},
              onToggleSignUpMode: () {
                isSignUp = !isSignUp;
              },
            ),
          ),
        );
      }

      await tester.pumpWidget(buildWidget());
      expect(find.text('アカウントを作成'), findsOneWidget);

      // Simulate toggle
      await tester.tap(find.text('すでにアカウントをお持ちですか？ログイン'));
      await tester.pumpWidget(buildWidget());

      expect(find.text('ログイン'), findsOneWidget);
    });

    testWidgets('should have proper spacing between elements', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: false,
              onAuth: () {},
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
      // BasicHeightBox creates SizedBox widgets for spacing
      expect(find.byType(SizedBox), findsAtLeastNWidgets(1));
    });

    testWidgets('should handle different loading states correctly', (
      WidgetTester tester,
    ) async {
      bool authCalled = false;

      // Test with loading = false
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: false,
              onAuth: () => authCalled = true,
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('アカウントを作成'));
      await tester.pump();
      expect(authCalled, true);

      // Reset and test with loading = true
      authCalled = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmailAuthActions(
              isSignUp: true,
              isLoading: true,
              onAuth: () => authCalled = true,
              onToggleSignUpMode: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('アカウントを作成'));
      await tester.pump();
      expect(authCalled, false);
    });
  });
}
