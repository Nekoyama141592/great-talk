# Gretal

## 概要

「Gretal」は、さまざまなAIエージェントと簡単に会話を楽しむことができるアプリケーションです。このアプリケーションを使用することで、異なるAIモデルとのインタラクションを通じて、さまざまな体験や学習を行うことができます。

## 主な機能

- **複数のAIエージェント**：異なるAIモデルを選択して会話を楽しむことができます。
- **リアルタイム会話**：リアルタイムでAIとスムーズに会話できます。
- **履歴の保存**：会話の履歴を保存し、後で参照することができます。
- **カスタマイズ可能な設定**：ユーザーはAIの設定をカスタマイズし、自分好みの会話体験を設定できます。

### アプリケーションへのアクセス

ブラウザを開き、以下のURLにアクセスします。
- **iOS**：https://apps.apple.com/us/app/great-talk/id1667705303s

- **Android**：https://play.google.com/store/apps/details?id=com.firebaseapp.great_talk&pli=1

### 前提条件

- Xcode
- Android Studio
- Flutter

### アプリケーションの起動

以下のコマンドでアプリケーションを起動します。

```bash
# dev
flutter run --flavor dev -t lib/main_dev.dart

# prod
flutter run --flavor prod -t lib/main_prod.dart
```

## ディレクトリ構成

```
great_talk/
│
├── android/              # Androidディレクトリ
├── assets/               # アセットディレクトリ
├── cloud_functions/      # Cloud Functionsディレクトリ
├── firestore_rules/      # Firestoreルールディレクトリ
├── ios/                  # iOSディレクトリ
├── lib/                  # ライブラリディレクトリ
│    ├── common/          # 共通ディレクトリ
│    ├── consts/          # 定数ディレクトリ
│    ├── controllers/     # コントローラディレクトリ
│    ├── core/            # コアディレクトリ
│    ├── delegates/       # デリゲートディレクトリ
│    ├── extensions/      # 拡張ディレクトリ
│    ├── iap_constants/   # IAP定数ディレクトリ
│    ├── infrastructure/  # インフラディレクトリ
│    ├── mixin/           # ミックスインディレクトリ
│    ├── model/           # モデルディレクトリ
│    ├── repository/      # リポジトリディレクトリ
│    ├── states/          # ステートディレクトリ
│    ├── themes/          # テーマディレクトリ
│    ├── typedefs/        # 型定義ディレクトリ
│    ├── ui_core/         # UIコアディレクトリ
│    ├── utility/         # ユーティリティディレクトリ
│    ├── validator/       # バリデータディレクトリ
│    ├── views/           # ビューディレクトリ
├── .gitignore            # Git無視ファイル
├── analysis_options.yaml # エラー無視ファイル
├── COMMAND.md            # 使用コマンドファイル
├── pubspec.yaml          # 依存関係ファイル
├── pubspec.lock          # 依存関係ロックファイル
└── README.md             # このREADMEファイル
```

## イラスト素材
https://storyset.com/