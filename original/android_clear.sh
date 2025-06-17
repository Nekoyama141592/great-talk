#!/bin/bash

# 実行: source original/android_clear.sh
flutter clean

flutter pub cache repair

flutter pub get

flutter run --flavor dev -t lib/main_dev.dart