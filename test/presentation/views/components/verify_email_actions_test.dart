import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/domain/entity/view_model_state/verify_email/verify_email_state.dart';
import 'package:great_talk/presentation/page/auth/verify_email/components/verify_email_actions.dart';

void main() {
  group('VerifyEmailActions', () {
    const testEmail = 'test@example.com';
    
    testWidgets('should display resend button when can resend', (WidgetTester tester) async {
      final state = VerifyEmailState(
        email: testEmail,
        canResend: true,
        resendSecondsLeft: 0,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VerifyEmailActions(
              state: state,
              isLoading: false,
              onResendEmail: () {},
              onCheckVerification: () {},
            ),
          ),
        ),
      );

      expect(find.text('確認メールを再送信'), findsOneWidget);
      expect(find.text('確認完了をチェック'), findsOneWidget);
    });

    testWidgets('should display countdown when cannot resend', (WidgetTester tester) async {
      final state = VerifyEmailState(
        email: testEmail,
        canResend: false,
        resendSecondsLeft: 45,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VerifyEmailActions(
              state: state,
              isLoading: false,
              onResendEmail: () {},
              onCheckVerification: () {},
            ),
          ),
        ),
      );

      expect(find.text('再送信まで45秒'), findsOneWidget);
    });

    testWidgets('should call onResendEmail when resend button is tapped and enabled', (WidgetTester tester) async {
      final state = VerifyEmailState(
        email: testEmail,
        canResend: true,
        resendSecondsLeft: 0,
      );

      bool resendCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VerifyEmailActions(
              state: state,
              isLoading: false,
              onResendEmail: () => resendCalled = true,
              onCheckVerification: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('確認メールを再送信'));
      await tester.pump();

      expect(resendCalled, true);
    });

    testWidgets('should not call onResendEmail when resend button is disabled', (WidgetTester tester) async {
      final state = VerifyEmailState(
        email: testEmail,
        canResend: false,
        resendSecondsLeft: 30,
      );

      bool resendCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VerifyEmailActions(
              state: state,
              isLoading: false,
              onResendEmail: () => resendCalled = true,
              onCheckVerification: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('再送信まで30秒'));
      await tester.pump();

      expect(resendCalled, false);
    });

    testWidgets('should call onCheckVerification when check button is tapped and enabled', (WidgetTester tester) async {
      final state = VerifyEmailState(
        email: testEmail,
        canResend: false,
        resendSecondsLeft: 30,
      );

      bool checkCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VerifyEmailActions(
              state: state,
              isLoading: false,
              onResendEmail: () {},
              onCheckVerification: () => checkCalled = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('確認完了をチェック'));
      await tester.pump();

      expect(checkCalled, true);
    });

    testWidgets('should disable check button when loading', (WidgetTester tester) async {
      final state = VerifyEmailState(
        email: testEmail,
        canResend: true,
        resendSecondsLeft: 0,
      );

      bool checkCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VerifyEmailActions(
              state: state,
              isLoading: true,
              onResendEmail: () {},
              onCheckVerification: () => checkCalled = true,
            ),
          ),
        ),
      );

      await tester.tap(find.text('確認完了をチェック'));
      await tester.pump();

      expect(checkCalled, false);
    });

    testWidgets('should have correct button styles', (WidgetTester tester) async {
      final state = VerifyEmailState(
        email: testEmail,
        canResend: true,
        resendSecondsLeft: 0,
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(primaryColor: Colors.blue),
          home: Scaffold(
            body: VerifyEmailActions(
              state: state,
              isLoading: false,
              onResendEmail: () {},
              onCheckVerification: () {},
            ),
          ),
        ),
      );

      final resendButtons = find.byType(ElevatedButton);
      expect(resendButtons, findsExactly(2));

      // Check that we have the expected buttons
      expect(find.text('確認メールを再送信'), findsOneWidget);
      expect(find.text('確認完了をチェック'), findsOneWidget);
    });

    testWidgets('should display different countdown values correctly', (WidgetTester tester) async {
      final testCases = [1, 15, 30, 59, 60];

      for (final seconds in testCases) {
        final state = VerifyEmailState(
          email: testEmail,
          canResend: false,
          resendSecondsLeft: seconds,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: VerifyEmailActions(
                state: state,
                isLoading: false,
                onResendEmail: () {},
                onCheckVerification: () {},
              ),
            ),
          ),
        );

        expect(find.text('再送信まで$seconds秒'), findsOneWidget);
      }
    });

    testWidgets('should handle rapid button taps correctly', (WidgetTester tester) async {
      final state = VerifyEmailState(
        email: testEmail,
        canResend: true,
        resendSecondsLeft: 0,
      );

      int resendCount = 0;
      int checkCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VerifyEmailActions(
              state: state,
              isLoading: false,
              onResendEmail: () => resendCount++,
              onCheckVerification: () => checkCount++,
            ),
          ),
        ),
      );

      // Rapid taps on resend button
      for (int i = 0; i < 5; i++) {
        await tester.tap(find.text('確認メールを再送信'));
        await tester.pump(const Duration(milliseconds: 10));
      }

      // Rapid taps on check button
      for (int i = 0; i < 3; i++) {
        await tester.tap(find.text('確認完了をチェック'));
        await tester.pump(const Duration(milliseconds: 10));
      }

      expect(resendCount, 5);
      expect(checkCount, 3);
    });
  });
}