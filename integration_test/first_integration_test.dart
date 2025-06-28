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

  group('First Integration Tests', () {
    testWidgets('app launches and shows main content', (
      WidgetTester tester,
    ) async {
      // Set up the test environment
      F.appFlavor = Flavor.dev;

      // Initialize Firebase for testing
      await Firebase.initializeApp(
        options: RunApp.getFirebaseOption(F.appFlavor),
      );

      // Create the app widget
      final app = ProviderScope(
        overrides: [
          prefsProvider.overrideWithValue(
            await SharedPreferences.getInstance(),
          ),
        ],
        child: const MyApp(),
      );

      // Launch the app
      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      // Wait for app to load
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify that the app has launched by checking for MaterialApp
      expect(find.byType(MaterialApp), findsOneWidget);

      // Verify that we can see some basic UI elements
      expect(find.byType(Scaffold), findsAtLeastNWidgets(1));
    });
  });
}
