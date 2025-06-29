import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:great_talk/presentation/page/auth/verify_email/components/verify_email_header.dart';

void main() {
  group('VerifyEmailHeader', () {
    testWidgets('should display email icon and title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerifyEmailHeader(),
          ),
        ),
      );

      expect(find.byIcon(Icons.email_outlined), findsOneWidget);
      expect(find.text('メールアドレスの確認'), findsOneWidget);
    });

    testWidgets('should have correct icon size and color', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerifyEmailHeader(),
          ),
        ),
      );

      final icon = tester.widget<Icon>(find.byIcon(Icons.email_outlined));
      expect(icon.size, 80);
      expect(icon.color, Colors.blue);
    });

    testWidgets('should have correct text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerifyEmailHeader(),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('メールアドレスの確認'));
      expect(text.style?.fontSize, 24);
      expect(text.style?.fontWeight, FontWeight.bold);
    });
  });
}