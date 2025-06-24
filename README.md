# ShareAI 🤖

> **ユーザーがAI生成コンテンツを作成・共有・体験する新しい形のインテリジェントAIソーシャルプラットフォーム**

[![Flutter](https://img.shields.io/badge/Flutter-3.7.2+-02569B.svg?style=flat&logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Cloud-FFCA28.svg?style=flat&logo=firebase)](https://firebase.google.com)
[![OpenAI](https://img.shields.io/badge/OpenAI-GPT--4-412991.svg?style=flat&logo=openai)](https://openai.com)
[![License](https://img.shields.io/badge/License-Private-red.svg)](LICENSE)

**ShareAI**は、ソーシャルメディアのダイナミクスと最先端のAI機能を組み合わせた本格的なFlutterアプリケーションです。ユーザーはAI強化投稿の作成、知的な会話への参加、直感的なモバイル体験を通じたユニークなビジュアルコンテンツの生成が可能です。

## 🚀 リリース済みアプリ

<div align="center">

[![Download on App Store](https://img.shields.io/badge/Download_on-App_Store-000000?style=for-the-badge&logo=apple&logoColor=white)](https://apps.apple.com/us/app/great-talk/id1667705303s)
[![Get it on Google Play](https://img.shields.io/badge/Get_it_on-Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white)](https://play.google.com/store/apps/details?id=com.firebaseapp.great_talk&pli=1)

*2023年2月にバージョン1.0.0リリース*

</div>

---

## 🌟 主な機能

### 🧠 **AI駆動コンテンツ作成**
- **マルチエージェント会話**: 様々な専門AI モデルとのインタラクティブなチャット
- **スマート投稿生成**: カスタムプロンプトによるAI強化コンテンツ作成

### 📱 **ソーシャルプラットフォーム**
- **フィード・発見機能**: コンテンツ推薦機能付き無限スクロールタイムライン
- **ソーシャルインタラクション**: いいね、ブックマーク、フォロー、ミュート、シェア機能
- **ユーザープロフィール**: フォロワーシステム付き包括的プロフィール管理
- **コンテンツモデレーション**: ML駆動不適切コンテンツ検出

### 💎 **プレミアム体験**
- **サブスクリプション管理**: 月額・年額プランのフリーミアムモデル
- **クロスプラットフォーム課金**: iOS/Android統合アプリ内課金システム
- **レシート検証**: セキュアなサーバーサイド購入検証
- **機能制御**: サブスクリプション階層に基づく段階的機能強化

### 🔒 **エンタープライズレベルセキュリティ**
- **多要素認証**: Google/Apple Sign-In付きFirebase認証
- **コンテンツ安全性**: AWS駆動感情分析・画像モデレーション

---

## 🏗️ 技術アーキテクチャ

### **クリーンアーキテクチャの基盤**
```
┌─────────────────┬─────────────────┬─────────────────┐
│  プレゼンテーション │     ドメイン      │      データ       │
│   (UI/Views)    │   (Use Cases)   │   (Repository)  │
├─────────────────┼─────────────────┼─────────────────┤
│ • Riverpod      │ • ビジネス        │ • Firebase      │
│ • Auto Route    │   ロジック        │ • OpenAI API    │
│ • カスタム        │ • バリデータ      │ • AWS S3        │
│   ウィジェット    │ • 拡張機能        │ • ローカルストレージ │
└─────────────────┴─────────────────┴─────────────────┘
```

### **状態管理**
- **Riverpod 2.6+**: hooks統合付きコード生成プロバイダー
- **リアクティブプログラミング**: ストリームベースのリアルタイム更新
- **楽観的UI**: サーバー調整付き即時フィードバック
- **エラー境界**: ユーザーフレンドリーメッセージ付き包括的エラーハンドリング

### **コード生成パイプライン**
- **Freezed**: copy/equalityメソッド付きイミュータブルデータクラス
- **Build Runner**: モデル・ネットワーキング自動コード生成
- **JSON シリアライゼーション**: 型安全なAPI通信
- **Auto Route**: 型安全性付き生成ルーティング

---

## 🛠️ 開発環境セットアップ

### **前提条件**
- Flutter SDK `3.32.2`
- Dart SDK `3.8.1`
### **インストール**
```bash
# リポジトリ
git clone https://github.com/Nekoyama141592/great-talk
cd great_talk_native

# 依存関係をインストール
flutter pub get

# コード生成
flutter pub run build_runner build --delete-conflicting-outputs

# Firebase設定（Firebaseセットアップガイドに従う）
flutterfire configure
```

### **開発コマンド**
```bash
# 開発ビルドを実行
flutter run --flavor dev -t lib/main_dev.dart

# 本番ビルドを実行
flutter run --flavor prod -t lib/main_prod.dart

# コード生成（監視モード）
flutter pub run build_runner watch --delete-conflicting-outputs

# コードフォーマット
dart format --set-exit-if-changed .

# 静的解析
flutter analyze .

# カバレッジ付きテスト実行
flutter test --coverage
```

### **ビルド・デプロイ**
```bash
# iOSリリースビルド
flutter build ios --flavor prod -t lib/main_prod.dart --release --no-tree-shake-icons

# Androidリリースビルド
flutter build appbundle --flavor prod -t lib/main_prod.dart --no-tree-shake-icons
```

---

## 🧪 テスト戦略

### **包括的テストカバレッジ**
- **ユニットテスト**: コアビジネスロジック・ユーティリテ
- **ウィジェットテスト**: UIコンポーネントの動作・インタラクション
- **統合テスト**: エンドツーエンドユーザーワークフロー
- **モックテスト**: 包括的モッキング付きリポジトリ層

### **テストコマンド**
```bash
# 全テストを実行
flutter test

# カバレッジレポート生成
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html

# 特定のテストスイートを実行
flutter test test/core/
flutter test test/repository/
flutter test test/use_case/
```

---

## 🏢 本番環境アーキテクチャ

### **マルチ環境デプロイメント**
- **開発環境**: デバッグFirebaseプロジェクト付き`ShareAI Dev`
- **本番環境**: 本番Firebaseコンフィギュレーション付き`ShareAI`

### **クラウドインフラストラクチャ**
- **Firebaseスイート**: Auth、Firestore、Functions、Storage、Crashlytics
- **AWS統合**: S3ストレージ、AIコンテンツモデレーションサービス
- **OpenAI API**: テキスト、画像生成
- **CodeMagic CI/CD**: 自動テスト・デプロイメントパイプライン

### **パフォーマンス最適化**
- **遅延読み込み**: 大規模データセット向け効率的メモリ管理
- **画像キャッシュ**: `cached_network_image`によるスマートキャッシュ
- **データベース最適化**: Firestore複合クエリ・インデックス

---

## 🔧 技術スタックハイライト

### **フロントエンド**
- **Flutter** `3.7.2+` - クロスプラットフォームモバイルフレームワーク
- **Riverpod** `2.6+` - 高度な状態管理
- **Auto Route** `10+` - 型安全ナビゲーション
- **Freezed** `3.0+` - イミュータブルデータクラス

### **バックエンド・サービス**
- **Firebase** - 認証、データベース、ストレージ、関数
- **OpenAI API** - gpt-o3,o4-mini-high
- **AWS S3** - スケーラブル画像ストレージ
- **Node.js** - ビジネスロジック用Cloud Functions

### **開発ツール**
- **Build Runner** - コード生成自動化
- **Custom Lint** - 一貫したコード品質
- **CodeMagic** - CI/CDパイプライン
- **Firebase Emulator** - ローカル開発環境

---

## 📁 プロジェクト構成

```
lib/
├── core/              # 共有ビジネスロジック・ユーティリティ
├── model/             # JSON シリアライゼーション付きFreezedデータモデル
├── repository/        # Resultパターン付きデータアクセス層
├── use_case/          # ビジネスロジックユースケース
├── provider/          # Riverpod状態管理プロバイダー
├── views/             # UI画面・再利用可能コンポーネント
├── infrastructure/    # 外部サービス統合
├── extensions/        # Dart拡張メソッド
└── themes/           # Material Designテーマ設定

test/
├── core/             # ビジネスロジックユニットテスト
├── repository/       # モック付きデータ層テスト
├── use_case/         # ビジネスロジックテスト
├── views/            # ウィジェットテスト
└── test_utils/       # テストヘルパー・モックプロバイダー
```

---

## 🚀 開発者向けスタートガイド

### **ローカル開発**
1. **環境セットアップ**: Flutterインストールガイドに従う
2. **Firebase設定**: 開発用Firebaseプロジェクトをセットアップ
3. **APIキー**: OpenAI・AWS認証情報を設定
4. **開発ビルド実行**: 上記flavorコマンドを使用

### **コントリビューションガイドライン**
- クリーンアーキテクチャ原則に従う
---

<div align="center">

**Flutter製 🚀 | AI駆動 🤖 | スケール設計 📈**

</div>