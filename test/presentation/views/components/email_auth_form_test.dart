import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/auth/email_auth/components/email_auth_form.dart';

void main() {
  group('EmailAuthForm', () {
    late GlobalKey<FormState> formKey;
    late TextEditingController emailController;
    late TextEditingController passwordController;

    setUp(() {
      formKey = GlobalKey<FormState>();
      emailController = TextEditingController();
      passwordController = TextEditingController();
    });

    tearDown(() {
      emailController.dispose();
      passwordController.dispose();
    });

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

    Widget createTestWidget() {
      return MaterialApp(
        home: Scaffold(
          body: EmailAuthForm(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
            emailValidator: emailValidator,
            passwordValidator: passwordValidator,
          ),
        ),
      );
    }

    testWidgets('should display email and password fields', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(TextFormField), findsExactly(2));
      expect(find.text('メールアドレス'), findsOneWidget);
      expect(find.text('パスワード'), findsOneWidget);
    });

    testWidgets('should have correct field labels', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      // Check that both labels are present in the widget tree
      expect(find.text('メールアドレス'), findsOneWidget);
      expect(find.text('パスワード'), findsOneWidget);
    });

    testWidgets('should have proper form field structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      // Verify we have exactly 2 TextFormField widgets
      expect(find.byType(TextFormField), findsExactly(2));
      expect(find.byType(Form), findsOneWidget);
    });

    testWidgets('should validate empty email field', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      // Trigger validation
      formKey.currentState?.validate();
      await tester.pump();

      expect(find.text('メールアドレスを入力してください'), findsOneWidget);
    });

    testWidgets('should validate invalid email format', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
      formKey.currentState?.validate();
      await tester.pump();

      expect(find.text('有効なメールアドレスを入力してください'), findsOneWidget);
    });

    testWidgets('should validate empty password field', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      // Trigger validation
      formKey.currentState?.validate();
      await tester.pump();

      expect(find.text('パスワードを入力してください'), findsOneWidget);
    });

    testWidgets('should validate short password', (WidgetTester tester) async {
      await tester.pumpWidget(createTestWidget());

      await tester.enterText(find.byType(TextFormField).last, '12345');
      formKey.currentState?.validate();
      await tester.pump();

      expect(find.text('6文字以上のパスワードを入力してください'), findsOneWidget);
    });

    testWidgets('should pass validation with valid inputs', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      await tester.enterText(
        find.byType(TextFormField).first,
        'test@example.com',
      );
      await tester.enterText(find.byType(TextFormField).last, 'password123');

      final isValid = formKey.currentState?.validate() ?? false;
      await tester.pump();

      expect(isValid, true);
      expect(find.text('メールアドレスを入力してください'), findsNothing);
      expect(find.text('パスワードを入力してください'), findsNothing);
    });

    testWidgets('should update controllers when text is entered', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      const email = 'test@example.com';
      const password = 'testpassword';

      await tester.enterText(find.byType(TextFormField).first, email);
      await tester.enterText(find.byType(TextFormField).last, password);

      expect(emailController.text, email);
      expect(passwordController.text, password);
    });

    testWidgets('should accept various valid email formats', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final validEmails = [
        'user@example.com',
        'test.email@domain.co.jp',
        'user+tag@example.org',
        'a@b.c',
      ];

      for (final email in validEmails) {
        emailController.clear();
        await tester.enterText(find.byType(TextFormField).first, email);

        final isValid = emailValidator(email) == null;
        expect(isValid, true, reason: 'Email $email should be valid');
      }
    });

    testWidgets('should reject invalid email formats', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      final invalidEmails = [
        'plainaddress',
        '@missingdomain.com',
        'missing@.com',
        'missing@domain',
      ];

      for (final email in invalidEmails) {
        final isInvalid = emailValidator(email) != null;
        expect(isInvalid, true, reason: 'Email $email should be invalid');
      }
    });

    testWidgets('should have proper form structure', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      expect(find.byType(Form), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(SizedBox), findsAtLeastNWidgets(2));
    });

    testWidgets('should have controllers properly initialized', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestWidget());

      // Controllers should be properly initialized and usable
      expect(emailController.text, isEmpty);
      expect(passwordController.text, isEmpty);

      // Should be able to set text
      emailController.text = 'test';
      passwordController.text = 'password';

      expect(emailController.text, 'test');
      expect(passwordController.text, 'password');
    });
  });
}
