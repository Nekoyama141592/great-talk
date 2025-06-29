import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/auth/email_auth/components/email_auth_header.dart';

void main() {
  group('EmailAuthHeader', () {
    testWidgets('should display sign up title when isSignUp is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(appBar: EmailAuthHeader(isSignUp: true)),
        ),
      );

      expect(find.text('アカウント作成'), findsOneWidget);
    });

    testWidgets('should display login title when isSignUp is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(appBar: EmailAuthHeader(isSignUp: false)),
        ),
      );

      expect(find.text('ログイン'), findsOneWidget);
    });

    testWidgets('should implement PreferredSizeWidget correctly', (
      WidgetTester tester,
    ) async {
      const header = EmailAuthHeader(isSignUp: true);

      expect(header.preferredSize, const Size.fromHeight(kToolbarHeight));
    });
  });
}
