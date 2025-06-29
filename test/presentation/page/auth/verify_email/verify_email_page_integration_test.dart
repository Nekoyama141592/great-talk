import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/domain/entity/view_model_state/verify_email/verify_email_state.dart';
import 'package:great_talk/presentation/page/auth/verify_email/components/verify_email_header.dart';
import 'package:great_talk/presentation/page/auth/verify_email/components/verify_email_content.dart';
import 'package:great_talk/presentation/page/auth/verify_email/components/verify_email_actions.dart';

void main() {
  group('VerifyEmailPage - Component Integration', () {
    Widget createTestWidget({
      required VerifyEmailState state,
      bool isLoading = false,
      VoidCallback? onResendEmail,
      VoidCallback? onCheckVerification,
    }) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('メールアドレス確認'),
            automaticallyImplyLeading: false,
            actions: [TextButton(onPressed: () {}, child: const Text('ログアウト'))],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const VerifyEmailHeader(),
                    VerifyEmailContent(email: state.email),
                    VerifyEmailActions(
                      state: state,
                      isLoading: isLoading,
                      onResendEmail: onResendEmail ?? () {},
                      onCheckVerification: onCheckVerification ?? () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('should display all components correctly when can resend', (
      WidgetTester tester,
    ) async {
      const testState = VerifyEmailState(
        email: 'test@example.com',
        canResend: true,
        resendSecondsLeft: 0,
      );

      await tester.pumpWidget(createTestWidget(state: testState));

      // Check if all components are present
      expect(find.byType(VerifyEmailHeader), findsOneWidget);
      expect(find.byType(VerifyEmailContent), findsOneWidget);
      expect(find.byType(VerifyEmailActions), findsOneWidget);

      // Check app bar
      expect(find.text('メールアドレス確認'), findsOneWidget);
      expect(find.text('ログアウト'), findsOneWidget);

      // Check header content
      expect(find.byIcon(Icons.email_outlined), findsOneWidget);

      // Check content
      expect(find.text('test@example.com\nに確認メールを送信しました。'), findsOneWidget);
      expect(find.text('メール内のリンクをクリックして\nメールアドレスを確認してください。'), findsOneWidget);

      // Check actions
      expect(find.text('確認メールを再送信'), findsOneWidget);
      expect(find.text('確認完了をチェック'), findsOneWidget);
    });

    testWidgets('should display countdown when cannot resend', (
      WidgetTester tester,
    ) async {
      const testState = VerifyEmailState(
        email: 'user@example.com',
        canResend: false,
        resendSecondsLeft: 45,
      );

      await tester.pumpWidget(createTestWidget(state: testState));

      expect(find.text('user@example.com\nに確認メールを送信しました。'), findsOneWidget);
      expect(find.text('再送信まで45秒'), findsOneWidget);
      expect(find.text('確認完了をチェック'), findsOneWidget);
    });

    testWidgets('should call callbacks when buttons are tapped', (
      WidgetTester tester,
    ) async {
      const testState = VerifyEmailState(
        email: 'test@example.com',
        canResend: true,
        resendSecondsLeft: 0,
      );

      bool resendCalled = false;
      bool checkCalled = false;

      await tester.pumpWidget(
        createTestWidget(
          state: testState,
          onResendEmail: () => resendCalled = true,
          onCheckVerification: () => checkCalled = true,
        ),
      );

      await tester.tap(find.text('確認メールを再送信'));
      await tester.pump();
      expect(resendCalled, true);

      await tester.tap(find.text('確認完了をチェック'));
      await tester.pump();
      expect(checkCalled, true);
    });

    testWidgets('should disable buttons appropriately when loading', (
      WidgetTester tester,
    ) async {
      const testState = VerifyEmailState(
        email: 'test@example.com',
        canResend: true,
        resendSecondsLeft: 0,
      );

      bool checkCalled = false;

      await tester.pumpWidget(
        createTestWidget(
          state: testState,
          isLoading: true,
          onCheckVerification: () => checkCalled = true,
        ),
      );

      await tester.tap(find.text('確認完了をチェック'));
      await tester.pump();
      expect(checkCalled, false); // Should not be called when loading
    });

    testWidgets('should handle different email formats correctly', (
      WidgetTester tester,
    ) async {
      final testEmails = [
        'short@a.b',
        'normal.user@example.com',
        'very.long.email.address@subdomain.example.domain.com',
        'user+tag@example.com',
      ];

      for (final email in testEmails) {
        final testState = VerifyEmailState(
          email: email,
          canResend: true,
          resendSecondsLeft: 0,
        );

        await tester.pumpWidget(createTestWidget(state: testState));

        expect(find.text('$email\nに確認メールを送信しました。'), findsOneWidget);
      }
    });

    testWidgets('should have correct layout structure', (
      WidgetTester tester,
    ) async {
      const testState = VerifyEmailState(
        email: 'test@example.com',
        canResend: true,
        resendSecondsLeft: 0,
      );

      await tester.pumpWidget(createTestWidget(state: testState));

      // Check main layout components
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(Center), findsAtLeastNWidgets(1));
      expect(find.byType(Column), findsAtLeastNWidgets(1));
      expect(find.byType(Padding), findsAtLeastNWidgets(1));
    });

    testWidgets('should display header icon and title correctly', (
      WidgetTester tester,
    ) async {
      const testState = VerifyEmailState(
        email: 'test@example.com',
        canResend: true,
        resendSecondsLeft: 0,
      );

      await tester.pumpWidget(createTestWidget(state: testState));

      final icon = tester.widget<Icon>(find.byIcon(Icons.email_outlined));
      expect(icon.size, 80);
      expect(icon.color, Colors.blue);
    });

    testWidgets('should handle different countdown values', (
      WidgetTester tester,
    ) async {
      final countdownValues = [1, 15, 30, 45, 59, 60];

      for (final seconds in countdownValues) {
        final testState = VerifyEmailState(
          email: 'test@example.com',
          canResend: false,
          resendSecondsLeft: seconds,
        );

        await tester.pumpWidget(createTestWidget(state: testState));
        expect(find.text('再送信まで$seconds秒'), findsOneWidget);
      }
    });

    testWidgets('should not call resend callback when button is disabled', (
      WidgetTester tester,
    ) async {
      const testState = VerifyEmailState(
        email: 'test@example.com',
        canResend: false,
        resendSecondsLeft: 30,
      );

      bool resendCalled = false;

      await tester.pumpWidget(
        createTestWidget(
          state: testState,
          onResendEmail: () => resendCalled = true,
        ),
      );

      await tester.tap(find.text('再送信まで30秒'));
      await tester.pump();
      expect(resendCalled, false);
    });
  });
}
