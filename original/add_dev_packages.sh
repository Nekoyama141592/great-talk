#!/bin/bash

# Flutterのdev_dependenciesにパッケージを追加するスクリプト

# 開発用パッケージの配列を定義
dev_packages=(
  "auto_route_generator"
  "build_runner"
  "custom_lint"
  "flutter_launcher_icons"
  "flutter_lints"
  "freezed"
  "json_serializable"
  "retrofit_generator"
  "riverpod_generator"
  "riverpod_lint"
)

# Loop through each package and add it as a dev dependency
for package_name in "${dev_packages[@]}"; do
  echo "Adding ${package_name}..."
  flutter pub add --dev "${package_name}"
done

flutter pub add 'dev:integration_test:{"sdk":"flutter"}'

echo "All specified development packages have been added."