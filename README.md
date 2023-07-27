# great_talk

## iOS
https://apps.apple.com/us/app/great-talk/id1667705303

## Android
https://play.google.com/store/apps/details?id=com.firebaseapp.great_talk&pli=1

## 実行コード

### dev
flutter run --flavor dev -t lib/main_dev.dart

### prod
flutter run --flavor prod -t lib/main_prod.dart

## Build

### iOS
flutter build ios --flavor prod -t lib/main_prod.dart --release

### Android
flutter build appbundle --flavor dev -t lib/main_dev.dart
flutter build appbundle --flavor prod -t lib/main_prod.dart

## デザイン

### Figma
https://www.figma.com/file/qs4GuQPJS4Xn7GrpkYtwQv/Gemukura?node-id=0%3A1&t=OkCbEjNeCuO87DGW-1

## フォーマット
dart format --set-exit-if-changed .

flutter analyze .

## 自動生成
flutter pub run build_runner build --delete-conflicting-outputs
## 一括アップデート
flutter pub upgrade --major-versions
# frontend
