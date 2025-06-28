#!/bin/bash

# 実行: source original/android_clear.sh

rm -rf ~/.gradle/caches/

flutter clean

flutter pub cache repair

flutter pub get

flutter run --flavor dev