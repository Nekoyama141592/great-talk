#!/bin/sh

rm -rf ios/Pods

rm -rf ~/Library/Developer/Xcode/DerivedData/

flutter clean

flutter pub cache repair

rm ios/Podfile.lock

flutter pub get

cd ios

pod repo update

pod install

cd ..

# アプリ実行
flutter run --flavor dev