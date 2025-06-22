# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Running the Application
```bash
# Development environment
flutter run --flavor dev -t lib/main_dev.dart

# Production environment  
flutter run --flavor prod -t lib/main_prod.dart
```

### Building the Application
```bash
# iOS builds
flutter build ios --flavor dev -t lib/main_dev.dart --release --no-tree-shake-icons
flutter build ios --flavor prod -t lib/main_prod.dart --release --no-tree-shake-icons

# Android builds
flutter build appbundle --flavor dev -t lib/main_dev.dart --no-tree-shake-icons
flutter build appbundle --flavor prod -t lib/main_prod.dart --no-tree-shake-icons
```

### Code Quality and Analysis
```bash
# Format code
dart format --set-exit-if-changed .

# Analyze code
flutter analyze .
```

### Code Generation
```bash
# Generate code (one-time)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes and generate code continuously
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Dependency Management
```bash
# Update dependencies
flutter pub upgrade --major-versions
```

## Architecture Overview

### Project Structure
This is a Flutter application called "ShareAI" (great_talk) - an AI chat application that allows users to interact with different AI agents.

**Key Architecture Components:**
- **State Management**: Riverpod with hooks_riverpod for reactive state management
- **Routing**: Auto Route for declarative navigation with flavor-specific routing
- **Data Layer**: Firebase (Firestore, Auth, Storage, Functions) with repository pattern
- **Code Generation**: Freezed for immutable data classes, build_runner for code generation

### Flavors
The app supports multiple build flavors:
- `dev`: Development environment (`ShareAI Dev`)
- `verification`: Testing environment (`ShareAI Verification`) 
- `prod`: Production environment (`ShareAI`)

Each flavor has its own Firebase configuration and environment variables.

### Core Libraries & Patterns
- **UI**: Material Design with custom theming, SVG support
- **Networking**: Retrofit for REST API calls, Firebase for real-time data
- **Storage**: SharedPreferences for local settings, Firebase Storage for files
- **Authentication**: Firebase Auth with Google Sign-In and Apple Sign-In
- **Purchases**: In-App Purchase integration for subscriptions
- **Image Processing**: Image cropping, compression, and generation features

### Key Directories
- `lib/core/`: Shared business logic and utilities
- `lib/provider/`: Riverpod providers for state management
- `lib/repository/`: Data access layer with Result pattern for error handling
- `lib/model/`: Data models with Freezed code generation
- `lib/views/`: UI screens and components
- `lib/use_case/`: Business logic use cases

### Firebase Integration
The app heavily integrates with Firebase services:
- Firestore for chat data and user profiles
- Cloud Functions for server-side logic
- Firebase Auth for user authentication
- Firebase Storage for image uploads
- Remote Config for feature flags and app maintenance

## Testing

### Running Tests
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/core/date_core_test.dart

# Run tests in a specific directory
flutter test test/core/

# Run tests with verbose output
flutter test --verbose

# Generate coverage report (requires lcov)
genhtml coverage/lcov.info -o coverage/html
```

### Test Structure
The project includes comprehensive unit tests covering:

- **Core utilities** (`test/core/`): Business logic, date handling, ID generation, JSON processing, search functionality
- **Extensions** (`test/extension/`): String and double extensions for data processing
- **Repository layer** (`test/repository/`): Result pattern and data access testing
- **Use cases** (`test/use_case/`): Business logic use cases with mocked dependencies
- **UI components** (`test/views/components/`): Widget tests for reusable components
- **Test utilities** (`test/test_utils/`): Mock providers and helper functions

### Test Helpers
Use the provided test utilities:
```dart
// Import test helpers
import 'package:great_talk/test/test_helper.dart';
import 'package:great_talk/test/test_utils/mock_providers.dart';

// Create test widgets with providers
await pumpTestWidgetWithProviders(tester, widget, overrides: [...]);

// Use mock repositories
TestProviderOverrides.mockAuthRepository.setMockUser('test_user');
```

### Coverage Goals
- Aim for >80% code coverage on core business logic
- All public APIs should have unit tests
- Critical user flows should have widget/integration tests

## Environment Files

The app uses `.env` files for environment-specific configuration:
- `dev.env`: Development environment variables
- `prod.env`: Production environment variables

These files are included in the app bundle and loaded at runtime based on the selected flavor.