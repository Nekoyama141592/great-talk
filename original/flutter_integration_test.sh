#!/bin/sh

# テスト完了を通知するシェル
# 実行コマンド source original/flutter_integration_test.sh
# TODO: lib/presentation/page/check_page/first_page.dartのVerifyEmailPageをコメントアウトする
flutter test integration_test
echo "\a"