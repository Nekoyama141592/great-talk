#!/bin/sh

# テスト完了を通知するシェル
# TODO: first_page.dartのVerifyEmailPageをコメントアウトする
# TODO: e2e_test.dartのemailとpasswordを入力する
# 実行コマンド source original/flutter_integration_test.sh
flutter test integration_test
echo "\a"