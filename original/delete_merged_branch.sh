#!/bin/sh

# 実行コマンド
# source original/delete_merged_branch.sh

## TODO: 古いブランチ名を入力
branch_name="feature/widget_test"

git checkout main
git pull origin main
git branch -d "${branch_name}"
git branch