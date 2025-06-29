import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/auth/verify_email/components/verify_email_content.dart';

void main() {
  group('VerifyEmailContent', () {
    const testEmail = 'test@example.com';

    testWidgets('should display email address correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerifyEmailContent(email: testEmail),
          ),
        ),
      );

      expect(find.text('$testEmail\nに確認メールを送信しました。'), findsOneWidget);
    });

    testWidgets('should display instruction text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerifyEmailContent(email: testEmail),
          ),
        ),
      );

      expect(
        find.text('メール内のリンクをクリックして\nメールアドレスを確認してください。'),
        findsOneWidget,
      );
    });

    testWidgets('should have correct text styles', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerifyEmailContent(email: testEmail),
          ),
        ),
      );

      final emailText = tester.widget<Text>(
        find.text('$testEmail\nに確認メールを送信しました。'),
      );
      expect(emailText.style?.fontSize, 16);
      expect(emailText.textAlign, TextAlign.center);

      final instructionText = tester.widget<Text>(
        find.text('メール内のリンクをクリックして\nメールアドレスを確認してください。'),
      );
      expect(instructionText.style?.fontSize, 14);
      expect(instructionText.style?.color, Colors.grey);
      expect(instructionText.textAlign, TextAlign.center);
    });

    testWidgets('should handle different email formats', (WidgetTester tester) async {
      const longEmail = 'very.long.email.address@example.domain.com';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerifyEmailContent(email: longEmail),
          ),
        ),
      );

      expect(find.text('$longEmail\nに確認メールを送信しました。'), findsOneWidget);
    });

    testWidgets('should handle short email addresses', (WidgetTester tester) async {
      const shortEmail = 'a@b.c';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerifyEmailContent(email: shortEmail),
          ),
        ),
      );

      expect(find.text('$shortEmail\nに確認メールを送信しました。'), findsOneWidget);
    });

    testWidgets('should handle empty email', (WidgetTester tester) async {
      const emptyEmail = '';
      
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerifyEmailContent(email: emptyEmail),
          ),
        ),
      );

      expect(find.text('$emptyEmail\nに確認メールを送信しました。'), findsOneWidget);
    });

    testWidgets('should have proper spacing with BasicHeightBox', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerifyEmailContent(email: testEmail),
          ),
        ),
      );

      expect(find.byType(Column), findsOneWidget);
      // BasicHeightBox creates SizedBox widgets
      expect(find.byType(SizedBox), findsAtLeastNWidgets(3));
    });
  });
}