# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Running the Application
```bash
# Development environment
flutter run --flavor dev

# Verification environment
flutter run --flavor verification

# Production environment  
flutter run --flavor prod
```

### Building the Application
```bash
# iOS builds
flutter build ios --flavor dev --release --no-tree-shake-icons
flutter build ios --flavor verification --release --no-tree-shake-icons
flutter build ios --flavor prod --release --no-tree-shake-icons

# Android builds
flutter build appbundle --flavor dev --no-tree-shake-icons
flutter build appbundle --flavor verification --no-tree-shake-icons
flutter build appbundle --flavor prod --no-tree-shake-icons
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

### Testing
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter test integration_test/
```

### Dependency Management
```bash
# Install dependencies
flutter pub get

# Update dependencies
flutter pub upgrade --major-versions
```

## Architecture Overview

### Project Structure
This is a Flutter application called "ShareAI" (great_talk) - an AI-powered social platform where users can create posts, interact with AI, and engage with the community.

**Key Architecture Components:**
- **Clean Architecture**: Implements Domain-Driven Design with clear separation of concerns
- **State Management**: Riverpod with hooks_riverpod for reactive state management
- **Routing**: Auto Route for declarative navigation with flavor-specific routing
- **Data Layer**: Firebase (Firestore, Auth, Storage, Functions) with repository pattern
- **Code Generation**: Freezed for immutable data classes, build_runner for code generation

### Clean Architecture Structure
```
lib/
├── core/                    # Shared utilities and extensions
├── domain/                  # Business logic and entities
│   ├── entity/             # Domain models
│   ├── repository_interface/   # Abstract repository contracts
│   └── use_case_interface/    # Abstract use case contracts
├── application/             # Application layer
│   └── use_case/           # Concrete use case implementations
├── infrastructure/          # Data layer
│   ├── model/              # Data models and DTOs
│   └── repository/         # Concrete repository implementations
└── presentation/           # UI layer
    ├── page/               # Screen widgets
    ├── component/          # Reusable UI components
    ├── notifier/           # State notifiers (ViewModels)
    └── state/              # UI state models
```

### Flavors
The app supports three build flavors:
- `dev`: Development environment (`ShareAI Dev`)
- `verification`: Testing environment (`ShareAI Verification`) 
- `prod`: Production environment (`ShareAI`)

Each flavor has its own Firebase configuration and bundle identifiers.

### Core Libraries & Dependencies
- **UI Framework**: Flutter with Material Design
- **State Management**: Riverpod (hooks_riverpod, riverpod_annotation)
- **Navigation**: Auto Route for type-safe routing
- **Data Serialization**: Freezed + JSON annotation for immutable models
- **Code Generation**: Build Runner for automated code generation
- **Networking**: Retrofit for REST API calls
- **Backend**: Firebase (Firestore, Auth, Storage, Functions, Crashlytics, Remote Config)
- **Authentication**: Firebase Auth with Google Sign-In and Apple Sign-In
- **Image Processing**: Image picker, cropper, and compression
- **Purchases**: In-App Purchase for subscription management
- **Notifications**: Firebase Messaging with local notifications
- **Testing**: Mockito, fake_cloud_firestore for unit testing

### Key Directories
- `lib/core/`: Shared utilities, extensions, and providers
- `lib/domain/`: Business entities, repository interfaces, and use case interfaces
- `lib/application/`: Concrete use case implementations
- `lib/infrastructure/`: Data models, repositories, and external service integrations
- `lib/presentation/`: UI components, pages, state notifiers, and navigation
- `lib/gen/`: Generated Firebase configuration files

### Firebase Integration
The app heavily integrates with Firebase services:
- **Firestore**: Real-time database for posts, users, and social interactions
- **Cloud Functions**: Server-side business logic and AI integration
- **Firebase Auth**: User authentication and session management
- **Firebase Storage**: Image and file uploads
- **Remote Config**: Feature flags and dynamic configuration
- **Crashlytics**: Crash reporting and error tracking
- **Messaging**: Push notifications for user engagement

### State Management Pattern
Uses Riverpod with the following pattern:
- **Providers**: Located in `lib/core/provider/` with auto-generation
- **Notifiers**: Located in `lib/presentation/notifier/` for UI state management
- **State Classes**: Immutable state models using Freezed
- **Repository Pattern**: Abstract interfaces in domain, concrete implementations in infrastructure

## Testing

### Test Structure
The project includes comprehensive testing:
- **Unit Tests**: Core utilities, extensions, repositories, and use cases
- **Integration Tests**: End-to-end user flow testing
- **Widget Tests**: UI component testing
- **Repository Tests**: Data layer testing with mocks

### Test Coverage
- Focus on business logic in `lib/core/util/`
- Repository layer testing with Firebase mocks
- Use case testing with dependency injection
- Extension method testing for utility functions

### Test Commands
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run specific test file
flutter test test/core/util/date_util_test.dart

# Run integration tests
flutter test integration_test/e2e_test.dart
```

### Test Helpers
Use mock repositories and providers for testing:
```dart
import 'package:mockito/mockito.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
```

## Environment Configuration

### Flavor Management
The app uses flutter_flavor and flutter_flavorizr for flavor management:
- Flavor configuration in `pubspec.yaml`
- Flavor-specific assets and icons
- Environment-specific Firebase configurations

### Firebase Configuration
- `lib/gen/firebase_options_dev.dart`: Development environment
- `lib/gen/firebase_options_verification.dart`: Verification environment  
- `lib/gen/firebase_options_prod.dart`: Production environment

### Build Configuration
- App icons configured per flavor using flutter_launcher_icons
- Platform-specific configurations in `android/` and `ios/`
- Gradle flavor configuration for Android builds

## Code Generation

### Required Generators
Run these commands after making changes to models or providers:
```bash
# Generate all code
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes (development)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Generated Files
- `*.g.dart`: JSON serialization and Riverpod providers
- `*.freezed.dart`: Immutable data classes and unions
- `app_router.gr.dart`: Auto Route navigation code

## Development Workflow

### Code Style
- Follow Flutter/Dart conventions
- Use analyzer rules defined in `analysis_options.yaml`
- Generated files are excluded from analysis
- Custom lint rules with riverpod_lint

### Git Workflow
- Feature branches for new development
- Current branch: `feature/icon` (icon-related updates)
- Main branch for production releases

### Key Files to Understand
- `lib/application/app/flavors.dart`: Flavor configuration
- `lib/application/app/my_app.dart`: App root widget
- `lib/presentation/navigation/app_router.dart`: Navigation setup
- `lib/core/provider/`: Riverpod provider definitions
- `lib/infrastructure/repository/`: Data access implementations

## Common Operations

### Adding New Features
1. Define domain entities in `lib/domain/entity/`
2. Create repository interfaces in `lib/domain/repository_interface/`
3. Implement repositories in `lib/infrastructure/repository/`
4. Create use cases in `lib/application/use_case/`
5. Build UI in `lib/presentation/page/` and `lib/presentation/component/`
6. Add state management with notifiers in `lib/presentation/notifier/`

### Working with Firebase
- Use repository pattern for all Firebase operations
- Implement proper error handling with Result pattern
- Mock Firebase services for testing
- Follow Firebase security rules for data access

### Debugging Tips
- Use Flutter Inspector for UI debugging
- Firebase Crashlytics for production error tracking
- Riverpod Inspector for state management debugging
- Use flavor-specific builds for testing different environments