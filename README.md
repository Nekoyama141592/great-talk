# ShareAI

## 概要

「ShareAI」は、さまざまなAIエージェントと簡単に会話を楽しむことができるアプリケーションです。このアプリケーションを使用することで、異なるAIモデルとのインタラクションを通じて、さまざまな体験や学習を行うことができます。

## リリース

2023年2月

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
│    ├── common/          # 共通する画面の構成要素のファイルを格納
│    ├── consts/          # 定数ファイルを格納
│    ├── controllers/     # GetXControllerを使用するファイルを格納
│    ├── core/            # 全体で共通する処理のファイルを格納
│    ├── delegates/       # 抽象クラスのインスタンスを使うために継承
│    ├── env/             # 環境変数を扱うディレクトリ
│    ├── extensions/      # クラスの拡張ファイルを格納
│    ├── iap_constants/   # Mockの課金アイテムに関わるファイルを格納
│    ├── infrastructure/  # 通信に関わるファイルを格納
│    ├── mixin/           # ミックスインを定義したファイルを格納
│    ├── model/           # freezedを使用したmodelのファイルを格納
│    ├── repository/      # 例外処理を行うファイルを格納
│    ├── states/          # StatefulWidgetで使うStateの抽象クラス
│    ├── themes/          # テーマに関わるファイルを格納
│    ├── typedefs/        # typedefsを記述するファイルを格納
│    ├── ui_core/         # 共通する画面の構成要素のファイルを格納
│    ├── utility/         # 全体で共通する処理のファイルを格納
│    ├── validator/       # フォームで使用するバリデータに関するファイルを格納
│    ├── views/           # 画面に関わるファイルを格納
├── .gitignore            # Gitに含めないファイルを記述
├── analysis_options.yaml # コード記述のルールを定める
├── COMMAND.md            # 使用コマンドファイル
├── pubspec.yaml          # 依存関係ファイル
├── pubspec.lock          # 依存関係ロックファイル
└── README.md             # このREADMEファイル
```