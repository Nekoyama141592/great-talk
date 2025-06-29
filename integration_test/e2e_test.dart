import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:great_talk/application/app/flavors.dart';
import 'package:great_talk/application/app/run_app.dart';
import 'package:great_talk/application/app/my_app.dart';
import 'package:great_talk/core/provider/overrides/prefs/prefs_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Bottom Navigation Tests', () {
    late Widget app;
    const testUserEmail = 'fj6b11kh0j@sute.jp';
    const testUserPassword = 'fj6b11kh0j';
    setUpAll(() async {
      // Set up the test environment
      F.appFlavor = Flavor.dev;

      // Initialize Firebase for testing
      await Firebase.initializeApp(
        options: RunApp.getFirebaseOption(F.appFlavor),
      );

      // Create the app widget
      app = ProviderScope(
        overrides: [
          prefsProvider.overrideWithValue(
            await SharedPreferences.getInstance(),
          ),
        ],
        child: const MyApp(),
      );
    });

    // Helper function to handle terms agreement and login
    Future<void> agreeToTermsAndLogin(WidgetTester tester) async {
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      // Wait for initial load
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Check if TermsScreen is displayed and agree to terms
      final agreeButton = find.text('上記の内容、利用規約、プライバシーポリシーに同意する');
      if (agreeButton.evaluate().isNotEmpty) {
        await tester.tap(agreeButton);
        await tester.pumpAndSettle();

        // Wait for navigation to login screen after terms agreement
        await tester.pumpAndSettle(const Duration(seconds: 5));

        // Look for "メールアドレスで続ける" button on LoginScreen
        await tester.pumpAndSettle();
        final emailContinueButton = find.text('メールアドレスで続ける');

        // Wait a bit more if button not found immediately
        if (emailContinueButton.evaluate().isEmpty) {
          await tester.pumpAndSettle(const Duration(seconds: 3));
        }

        expect(emailContinueButton, findsOneWidget);
        await tester.tap(emailContinueButton);
        await tester.pumpAndSettle();

        // Wait for EmailAuthPage to load
        await tester.pumpAndSettle(const Duration(seconds: 3));

        // Find email and password fields
        final emailFields = find.byType(TextFormField);
        expect(emailFields, findsAtLeast(2));

        // Clear any existing text and enter email
        await tester.tap(emailFields.first);
        await tester.pumpAndSettle();
        await tester.enterText(emailFields.first, '');
        await tester.enterText(emailFields.first, testUserEmail);
        await tester.pumpAndSettle();

        // Clear any existing text and enter password
        await tester.tap(emailFields.last);
        await tester.pumpAndSettle();
        await tester.enterText(emailFields.last, '');
        await tester.enterText(emailFields.last, testUserPassword);
        await tester.pumpAndSettle();

        // Find and tap login button
        final loginButton = find.text('ログイン');
        expect(loginButton, findsOneWidget);
        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        // Wait longer for authentication and navigation to complete
        await tester.pumpAndSettle(const Duration(seconds: 10));
      }
    }

    testWidgets('terms screen appears first and can be agreed to', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      // Wait for initial load
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Verify TermsScreen is displayed initially
      expect(find.text('上記の内容、利用規約、プライバシーポリシーに同意する'), findsOneWidget);
      expect(find.text('利用規約'), findsOneWidget);
      expect(find.text('プライバシーポリシー'), findsOneWidget);

      // Tap agree button
      await tester.tap(find.text('上記の内容、利用規約、プライバシーポリシーに同意する'));
      await tester.pumpAndSettle();

      // Wait for navigation to login screen after terms agreement
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Look for "メールアドレスで続ける" button on LoginScreen
      await tester.pumpAndSettle();
      final emailContinueButton = find.text('メールアドレスで続ける');

      // Wait a bit more if button not found immediately
      if (emailContinueButton.evaluate().isEmpty) {
        await tester.pumpAndSettle(const Duration(seconds: 3));
      }

      expect(emailContinueButton, findsOneWidget);
      await tester.tap(emailContinueButton);
      await tester.pumpAndSettle();

      // Wait for EmailAuthPage to load
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Find email and password fields
      final emailFields = find.byType(TextFormField);
      expect(emailFields, findsAtLeast(2));

      // Clear any existing text and enter email
      await tester.tap(emailFields.first);
      await tester.pumpAndSettle();
      await tester.enterText(emailFields.first, '');
      await tester.enterText(emailFields.first, testUserEmail);
      await tester.pumpAndSettle();

      // Clear any existing text and enter password
      await tester.tap(emailFields.last);
      await tester.pumpAndSettle();
      await tester.enterText(emailFields.last, '');
      await tester.enterText(emailFields.last, testUserPassword);
      await tester.pumpAndSettle();

      // Find and tap login button
      final loginButton = find.text('ログイン');
      expect(loginButton, findsOneWidget);
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Wait longer for authentication and navigation to complete
      await tester.pumpAndSettle(const Duration(seconds: 10));

      // Verify that we're now on MyHomePage with BottomNavigationBar
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.text('人気'), findsOneWidget);
      expect(find.text('ユーザー'), findsOneWidget);
      expect(find.text('ホーム'), findsOneWidget);
    });

    testWidgets('bottom navigation bar shows all tabs', (
      WidgetTester tester,
    ) async {
      // First agree to terms and login
      await agreeToTermsAndLogin(tester);

      // Verify BottomNavigationBar exists
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Verify all navigation items exist
      expect(find.text('人気'), findsOneWidget);
      expect(find.text('ユーザー'), findsOneWidget);
      expect(find.text('ホーム'), findsOneWidget);
      expect(find.text('最新'), findsOneWidget);
      expect(find.text('課金'), findsOneWidget);

      // Verify icons exist
      expect(find.byIcon(Icons.stars), findsOneWidget);
      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.update), findsOneWidget);
      expect(find.byIcon(Icons.subscriptions), findsOneWidget);
    });

    testWidgets('tap on home tab navigates correctly', (
      WidgetTester tester,
    ) async {
      // First agree to terms and login
      await agreeToTermsAndLogin(tester);

      // Tap on Home tab (ホーム)
      await tester.tap(find.text('ホーム'));
      await tester.pumpAndSettle();

      // Verify navigation happened by checking current index
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 2); // Home tab is index 2
    });

    testWidgets('tap on ranking tab navigates correctly', (
      WidgetTester tester,
    ) async {
      // First agree to terms and login
      await agreeToTermsAndLogin(tester);

      // Start from a different tab first
      await tester.tap(find.text('ホーム'));
      await tester.pumpAndSettle();

      // Then tap on Ranking tab (人気)
      await tester.tap(find.text('人気'));
      await tester.pumpAndSettle();

      // Verify navigation happened
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 0); // Ranking tab is index 0
    });

    testWidgets('tap on user tab navigates correctly', (
      WidgetTester tester,
    ) async {
      // First agree to terms and login
      await agreeToTermsAndLogin(tester);

      // Tap on User tab (ユーザー)
      await tester.tap(find.text('ユーザー'));
      await tester.pumpAndSettle();

      // Verify navigation happened
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 1); // User tab is index 1
    });

    testWidgets('tap on new posts tab navigates correctly', (
      WidgetTester tester,
    ) async {
      // First agree to terms and login
      await agreeToTermsAndLogin(tester);

      // Tap on New Posts tab (最新)
      await tester.tap(find.text('最新'));
      await tester.pumpAndSettle();

      // Verify navigation happened
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 3); // New Posts tab is index 3
    });

    testWidgets('tap on subscribe tab navigates correctly', (
      WidgetTester tester,
    ) async {
      // First agree to terms and login
      await agreeToTermsAndLogin(tester);

      // Tap on Subscribe tab (課金)
      await tester.tap(find.text('課金'));
      await tester.pumpAndSettle();

      // Verify navigation happened
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 4); // Subscribe tab is index 4
    });

    testWidgets('navigate through all tabs sequentially', (
      WidgetTester tester,
    ) async {
      // First agree to terms and login
      await agreeToTermsAndLogin(tester);

      final tabs = ['人気', 'ユーザー', 'ホーム', '最新', '課金'];

      for (int i = 0; i < tabs.length; i++) {
        // Tap on each tab
        await tester.tap(find.text(tabs[i]));
        await tester.pumpAndSettle();

        // Verify correct tab is selected
        final bottomNavBar = tester.widget<BottomNavigationBar>(
          find.byType(BottomNavigationBar),
        );
        expect(bottomNavBar.currentIndex, i);
      }
    });

    testWidgets('page view responds to tab changes', (
      WidgetTester tester,
    ) async {
      // First agree to terms and login
      await agreeToTermsAndLogin(tester);

      // Verify PageView exists (there might be multiple PageViews, so use findsAtLeastNWidgets)
      expect(find.byType(PageView), findsAtLeastNWidgets(1));

      // Navigate between tabs and verify PageView updates
      await tester.tap(find.text('ユーザー'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('ホーム'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('最新'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('人気'));
      await tester.pumpAndSettle();

      // Final verification that we're on the ranking tab
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 0);
    });
  });
}
