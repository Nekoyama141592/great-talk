#!/bin/sh

# テスト完了を通知するシェル
# TODO: lib/presentation/page/check_page/first_page.dartのVerifyEmailPageをコメントアウトする
# 実行コマンド source original/flutter_integration_test.sh
flutter test integration_test
echo "\a"