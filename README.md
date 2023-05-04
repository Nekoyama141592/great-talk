# great_talk

## 実行コード

### dev
flutter run --flavor dev -t lib/main_dev.dart --no-sound-null-safety

### prod
flutter run --flavor prod -t lib/main_prod.dart --no-sound-null-safety

## Build

### iOS
flutter build ios --flavor prod -t lib/main_prod.dart --release

### Android
flutter build appbundle --flavor prod -t lib/main_prod.dart --no-sound-null-safety

## デザイン

### Figma
https://www.figma.com/file/qs4GuQPJS4Xn7GrpkYtwQv/Gemukura?node-id=0%3A1&t=OkCbEjNeCuO87DGW-1

## フォーマット
dart format --set-exit-if-changed .

flutter analyze .

## 自動生成
flutter pub run build_runner build --delete-conflicting-outputs  

# frontend
