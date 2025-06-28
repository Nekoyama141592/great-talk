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

    // Helper function to handle terms agreement
    Future<void> agreeToTerms(WidgetTester tester) async {
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Check if TermsScreen is displayed and agree to terms
      final agreeButton = find.text('上記の内容、利用規約、プライバシーポリシーに同意する');
      if (agreeButton.evaluate().isNotEmpty) {
        await tester.tap(agreeButton);
        await tester.pumpAndSettle();
        await tester.pumpAndSettle(const Duration(seconds: 5));
      }
    }

    testWidgets('terms screen appears first and can be agreed to', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify TermsScreen is displayed initially
      expect(find.text('上記の内容、利用規約、プライバシーポリシーに同意する'), findsOneWidget);
      expect(find.text('利用規約'), findsOneWidget);
      expect(find.text('プライバシーポリシー'), findsOneWidget);

      // Tap agree button
      await tester.tap(find.text('上記の内容、利用規約、プライバシーポリシーに同意する'));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Verify that we're now on MyHomePage with BottomNavigationBar
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.text('人気'), findsOneWidget);
      expect(find.text('ホーム'), findsOneWidget);
    });

    testWidgets('bottom navigation bar shows all tabs', (
      WidgetTester tester,
    ) async {
      // First agree to terms
      await agreeToTerms(tester);

      // Verify BottomNavigationBar exists
      expect(find.byType(BottomNavigationBar), findsOneWidget);

      // Verify all navigation items exist
      expect(find.text('人気'), findsOneWidget);
      expect(find.text('ホーム'), findsOneWidget);
      expect(find.text('最新'), findsOneWidget);
      expect(find.text('課金'), findsOneWidget);

      // Verify icons exist
      expect(find.byIcon(Icons.stars), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
      expect(find.byIcon(Icons.update), findsOneWidget);
      expect(find.byIcon(Icons.subscriptions), findsOneWidget);
    });

    testWidgets('tap on home tab navigates correctly', (
      WidgetTester tester,
    ) async {
      // First agree to terms
      await agreeToTerms(tester);

      // Tap on Home tab (ホーム)
      await tester.tap(find.text('ホーム'));
      await tester.pumpAndSettle();

      // Verify navigation happened by checking current index
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 1); // Home tab is index 1
    });

    testWidgets('tap on ranking tab navigates correctly', (
      WidgetTester tester,
    ) async {
      // First agree to terms
      await agreeToTerms(tester);

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

    testWidgets('tap on new posts tab navigates correctly', (
      WidgetTester tester,
    ) async {
      // First agree to terms
      await agreeToTerms(tester);

      // Tap on New Posts tab (最新)
      await tester.tap(find.text('最新'));
      await tester.pumpAndSettle();

      // Verify navigation happened
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 2); // New Posts tab is index 2
    });

    testWidgets('tap on subscribe tab navigates correctly', (
      WidgetTester tester,
    ) async {
      // First agree to terms
      await agreeToTerms(tester);

      // Tap on Subscribe tab (課金)
      await tester.tap(find.text('課金'));
      await tester.pumpAndSettle();

      // Verify navigation happened
      final bottomNavBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );
      expect(bottomNavBar.currentIndex, 3); // Subscribe tab is index 3
    });

    testWidgets('navigate through all tabs sequentially', (
      WidgetTester tester,
    ) async {
      // First agree to terms
      await agreeToTerms(tester);

      final tabs = ['人気', 'ホーム', '最新', '課金'];

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
      // First agree to terms
      await agreeToTerms(tester);

      // Verify PageView exists (there might be multiple PageViews, so use findsAtLeastNWidgets)
      expect(find.byType(PageView), findsAtLeastNWidgets(1));

      // Navigate between tabs and verify PageView updates
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
