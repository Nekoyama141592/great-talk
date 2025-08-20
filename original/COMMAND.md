## iOS
https://apps.apple.com/us/app/great-talk/id1667705303

## Android
https://play.google.com/store/apps/details?id=com.firebaseapp.great_talk&pli=1

## 実行コード

### dev
flutter run --flavor dev

### prod
flutter run --flavor prod

## Build

### iOS
flutter build ios --flavor dev --release

flutter build ios --flavor prod --release

### Android
flutter build appbundle --flavor dev
flutter build appbundle --flavor prod

## フォーマット
dart format --set-exit-if-changed .

flutter analyze .
## 自動生成
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch --delete-conflicting-outputs # ずっと起動.
## 一括アップデート
flutter pub upgrade --major-versions

## SHA1の署名鍵
keytool -list -v \-alias androiddebugkey -keystore ~/.android/debug.keystore
keytool -list -v -keystore key.jks -alias key
Play Console -> アプリ -> 設定 -> アプリの署名 -> アプリ署名鍵の証明書 -> SHA1


## Xcodeキャッシュ削除
rm -rf ~/Library/Developer/Xcode/DerivedData
rm -rf ~/Library/Caches/com.apple.dt.Xcode
rm -rf ~/Library/Developer/Xcode/UserData/Previews
rm -rf ~/Library/Developer/XCPGDevices
rm -rf ~/Library/Developer/Xcode/iOS ＼DeviceSupport
