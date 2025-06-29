#!/bin/sh

# テスト完了を通知するシェル
# 実行コマンド source original/flutter_integration_test.sh
flutter test integration_test
echo "\a"