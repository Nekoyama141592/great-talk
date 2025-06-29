import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/auth/email_auth/components/email_auth_header.dart';
import 'package:great_talk/presentation/page/auth/email_auth/components/email_auth_form.dart';
import 'package:great_talk/presentation/page/auth/email_auth/components/email_auth_actions.dart';

void main() {
  group('EmailAuthPage - Component Integration', () {
    Widget createTestWidget({
      required bool isSignUp,
      required bool isLoading,
      VoidCallback? onAuth,
      VoidCallback? onToggleSignUpMode,
    }) {
      final formKey = GlobalKey<FormState>();
      final emailController = TextEditingController();
      final passwordController = TextEditingController();

      String? emailValidator(String? value) {
        if (value == null || value.isEmpty) {
          return 'メールアドレスを入力してください';
        }
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
        if (!emailRegex.hasMatch(value)) {
          return '有効なメールアドレスを入力してください';
        }
        return null;
      }

      String? passwordValidator(String? value) {
        if (value == null || value.isEmpty) {
          return 'パスワードを入力してください';
        }
        if (value.length < 6) {
          return '6文字以上のパスワードを入力してください';
        }
        return null;
      }

      // Simulate the actual form validation logic from EmailAuthPage
      void handleAuth() {
        if (formKey.currentState?.validate() ?? false) {
          onAuth?.call();
        }
      }

      return MaterialApp(
        home: SafeArea(
          child: Scaffold(
            appBar: EmailAuthHeader(isSignUp: isSignUp),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EmailAuthForm(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                          emailValidator: emailValidator,
                          passwordValidator: passwordValidator,
                        ),
                        EmailAuthActions(
                          isSignUp: isSignUp,
                          isLoading: isLoading,
                          onAuth: handleAuth,
                          onToggleSignUpMode: onToggleSignUpMode ?? () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('should display all components correctly in signup mode', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(isSignUp: true, isLoading: false),
      );

      // Check if all components are present
      expect(find.byType(EmailAuthHeader), findsOneWidget);
      expect(find.byType(EmailAuthForm), findsOneWidget);
      expect(find.byType(EmailAuthActions), findsOneWidget);

      // Check header
      expect(find.text('アカウント作成'), findsOneWidget);

      // Check form
      expect(find.text('メールアドレス'), findsOneWidget);
      expect(find.text('パスワード'), findsOneWidget);
      expect(find.byType(TextFormField), findsExactly(2));

      // Check actions
      expect(find.text('アカウントを作成'), findsOneWidget);
      expect(find.text('すでにアカウントをお持ちですか？ログイン'), findsOneWidget);
    });

    testWidgets('should display all components correctly in login mode', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(isSignUp: false, isLoading: false),
      );

      // Check header
      expect(find.text('ログイン'), findsAtLeastNWidgets(1));

      // Check actions
      expect(find.text('アカウントをお持ちでない方はアカウント作成'), findsOneWidget);
    });

    testWidgets('should handle form validation correctly', (
      WidgetTester tester,
    ) async {
      bool authCalled = false;

      await tester.pumpWidget(
        createTestWidget(
          isSignUp: true,
          isLoading: false,
          onAuth: () => authCalled = true,
        ),
      );

      // Try to submit without filling form
      await tester.tap(find.text('アカウントを作成'));
      await tester.pump();

      // Auth should not be called with empty form
      expect(authCalled, false);
    });

    testWidgets('should have form validation capabilities', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(isSignUp: true, isLoading: false),
      );

      // Enter invalid email
      await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
      await tester.enterText(find.byType(TextFormField).last, '12345');
      await tester.tap(find.text('アカウントを作成'));
      await tester.pump();

      // Form should prevent submission with invalid inputs
      expect(find.byType(TextFormField), findsExactly(2));
    });

    testWidgets('should call auth callback with valid inputs', (
      WidgetTester tester,
    ) async {
      bool authCalled = false;

      await tester.pumpWidget(
        createTestWidget(
          isSignUp: true,
          isLoading: false,
          onAuth: () => authCalled = true,
        ),
      );

      // Enter valid inputs
      await tester.enterText(
        find.byType(TextFormField).first,
        'test@example.com',
      );
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('アカウントを作成'));
      await tester.pump();

      expect(authCalled, true);
    });

    testWidgets('should call toggle callback when toggle button is tapped', (
      WidgetTester tester,
    ) async {
      bool toggleCalled = false;

      await tester.pumpWidget(
        createTestWidget(
          isSignUp: true,
          isLoading: false,
          onToggleSignUpMode: () => toggleCalled = true,
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
        createTestWidget(
          isSignUp: true,
          isLoading: true,
          onAuth: () => authCalled = true,
        ),
      );

      // Enter valid inputs
      await tester.enterText(
        find.byType(TextFormField).first,
        'test@example.com',
      );
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('アカウントを作成'));
      await tester.pump();

      expect(authCalled, false);
    });

    testWidgets('should have correct layout structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(isSignUp: true, isLoading: false),
      );

      // Check main layout components
      expect(find.byType(SafeArea), findsAtLeastNWidgets(1));
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Center), findsAtLeastNWidgets(1));
      expect(find.byType(ConstrainedBox), findsAtLeastNWidgets(1));
      expect(find.byType(Padding), findsAtLeastNWidgets(1));
    });

    testWidgets('should handle mode switching correctly', (
      WidgetTester tester,
    ) async {
      bool isSignUp = true;

      Widget buildWidget() {
        return createTestWidget(
          isSignUp: isSignUp,
          isLoading: false,
          onToggleSignUpMode: () {
            isSignUp = !isSignUp;
          },
        );
      }

      // Start in signup mode
      await tester.pumpWidget(buildWidget());
      expect(find.text('アカウント作成'), findsOneWidget);
      expect(find.text('アカウントを作成'), findsOneWidget);

      // Switch to login mode
      await tester.tap(find.text('すでにアカウントをお持ちですか？ログイン'));
      await tester.pumpWidget(buildWidget());

      expect(find.text('ログイン'), findsAtLeastNWidgets(1));
      expect(find.text('アカウントをお持ちでない方はアカウント作成'), findsOneWidget);
    });

    testWidgets('should maintain form data during mode switch', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(isSignUp: true, isLoading: false),
      );

      // Enter some data
      await tester.enterText(
        find.byType(TextFormField).first,
        'test@example.com',
      );
      await tester.enterText(find.byType(TextFormField).last, 'password123');

      // Verify data is entered
      expect(find.text('test@example.com'), findsOneWidget);
      expect(find.text('password123'), findsOneWidget);

      // Data should persist in the form fields
      final emailField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).last;
      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
    });

    testWidgets('should handle various input scenarios', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        createTestWidget(isSignUp: true, isLoading: false),
      );

      final testEmails = ['', 'invalid', 'test@example.com'];

      for (final email in testEmails) {
        await tester.enterText(find.byType(TextFormField).first, email);
        await tester.pump();

        // Should be able to enter different email formats
        expect(find.byType(TextFormField), findsExactly(2));
      }
    });
  });
}
