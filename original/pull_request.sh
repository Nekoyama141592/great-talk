#!/bin/sh

# Pull Requestを作成するスクリプト.
# 実行コマンド
# source original/pull_request.sh

## TODO: 新しいブランチ名を入力
branch_name=""

git checkout main
git pull origin main
git checkout -b "${branch_name}"
git commit -m 'make pull request' --allow-empty
git push --set-upstream origin "${branch_name}"