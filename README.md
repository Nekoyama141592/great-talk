# ShareAI 🤖

> **ユーザーがAI生成コンテンツを作成・共有・体験する新しい形のインテリジェントAIソーシャルプラットフォーム**

[![Flutter](https://img.shields.io/badge/Flutter-3.7.2+-02569B.svg?style=flat&logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Cloud-FFCA28.svg?style=flat&logo=firebase)](https://firebase.google.com)
[![OpenAI](https://img.shields.io/badge/OpenAI-GPT--4-412991.svg?style=flat&logo=openai)](https://openai.com)
[![License](https://img.shields.io/badge/License-Private-red.svg)](LICENSE)

**ShareAI**は、ソーシャルメディアのダイナミクスと最先端のAI機能を組み合わせた本格的なFlutterアプリケーションです。ユーザーは、AIによって強化された投稿の作成、知的な会話への参加、そして直感的なモバイル体験を通じてユニークなビジュアルコンテンツを生成することができます。

## 🚀 リリース済みアプリ

<div align="center">

[![Download on App Store](https://img.shields.io/badge/Download_on-App_Store-000000?style=for-the-badge&logo=apple&logoColor=white)](https://apps.apple.com/us/app/great-talk/id1667705303s)
[![Get it on Google Play](https://img.shields.io/badge/Get_it_on-Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white)](https://play.google.com/store/apps/details?id=com.firebaseapp.great_talk&pli=1)

*2023年2月にバージョン1.0.0リリース*

</div>

---

## 🌟 主な機能

### 🧠 **AI駆動コンテンツ作成**
- **マルチエージェント会話**: 様々な専門AIモデルとのインタラクティブなチャット
- **スマート投稿生成**: カスタムプロンプトによるAI強化コンテンツ作成

### 📱 **ソーシャルプラットフォーム**
- **フィード・発見機能**: コンテンツ推薦機能を備えた無限スクロールタイムライン
- **ソーシャルインタラクション**: いいね、ブックマーク、フォロー、ミュート、シェアなどの機能
- **ユーザープロフィール**: フォロワーシステムを備えた包括的なプロフィール管理
- **コンテンツモデレーション**: ML技術による不適切コンテンツの検出

### 💎 **プレミアム体験**
- **サブスクリプション管理**: 月額・年額プランのフリーミアムモデル
- **クロスプラットフォーム課金**: iOS/Androidに統合されたアプリ内課金システム
- **レシート検証**: セキュアなサーバーサイドでの購入検証
- **機能制御**: サブスクリプション階層に基づいた段階的な機能強化

### 🔒 **エンタープライズレベルセキュリティ**
- **多要素認証**: Google/Apple Sign-InによるFirebase認証
- **コンテンツ安全性**: AWS技術による感情分析・画像モデレーション

---

## 🏗️ 技術アーキテクチャ

### **クリーンアーキテクチャの基盤**
```
┌─────────────────┬─────────────────┬─────────────────┬─────────────────┐
│   Presentation  │   Application   │     Domain      │ Infrastructure  │
│  (UI/Views)     │  (Use Cases)    │  (Interfaces)   │ (Repositories)  │
├─────────────────┼─────────────────┼─────────────────┼─────────────────┤
│ • Pages/Views   │ • Use Case      │ • Repository    │ • Repository    │
│ • Components    │   Implementats  │   Interfaces    │   Implements    │
│ • Notifiers     │ • Business      │ • Use Case      │ • External APIs │
│ • State Models  │   Logic         │   Interfaces    │ • Data Models   │
│ • Riverpod      │ • Workflow      │ • Domain        │ • Firebase      │
│   Providers     │   Coordination  │   Entities      │ • OpenAI/AWS    │
└─────────────────┴─────────────────┴─────────────────┴─────────────────┘
```

### **状態管理**
- **Riverpod+**: コード生成プロバイダー/状態管理や依存性注入
- **リアクティブプログラミング**: ストリームベースのリアルタイム更新
- **楽観的UI**: サーバー調整による即時フィードバック
- **エラー境界**: ユーザーフレンドリーなメッセージによる包括的エラーハンドリング

### **コード生成パイプライン**
- **Freezed**: copy/toJson/fromJsonメソッドを備えたイミュータブルデータクラス
- **Build Runner**: モデル・ネットワーキングの自動コード生成
- **JSON シリアライゼーション**: 型安全なAPI通信
- **Auto Route**: 型安全性を備えた生成ルーティング

---

## 🛠️ 開発環境セットアップ

### **前提条件**
- Flutter SDK `3.32.2`
- Dart SDK `3.8.1`
### **インストール**
```bash
# リポジトリをクローン
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
flutter run --flavor dev

# 本番ビルドを実行
flutter run --flavor prod

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
- **ユニットテスト**: コアビジネスロジック・ユーティリティ
- **ウィジェットテスト**: UIコンポーネントの動作とインタラクション
- **統合テスト**: エンドツーエンドのユーザーワークフロー
- **モックテスト**: 包括的なモッキングによるリポジトリ層のテスト

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
- **開発環境**: デバッグ用Firebaseプロジェクトを使用した`ShareAI Dev`
- **本番環境**: 本番用Firebaseコンフィギュレーションを使用した`ShareAI`

### **クラウドインフラストラクチャ**
- **Firebaseスイート**: Auth、Firestore、Functions、Storage、Crashlytics
- **AWS統合**: S3ストレージ、AIコンテンツモデレーションサービス
- **OpenAI API**: テキスト、画像生成
- **CodeMagic CI/CD**: 自動テスト・デプロイメントパイプライン

### **パフォーマンス最適化**
- **遅延読み込み**: 大規模データセットに対応した効率的なメモリ管理
- **画像キャッシュ**: `cached_network_image`を使用したスマートキャッシュ
- **データベース最適化**: Firestore複合クエリ・インデックス

---

## 🔧 技術スタックハイライト

### **フロントエンド**
- **Flutter** - クロスプラットフォームモバイルフレームワーク
- **Riverpod** - 高度な状態管理
- **Auto Route** - 型安全ナビゲーション
- **Freezed** - イミュータブルデータクラス

### **バックエンド・サービス**
- **Firebase** - 認証、データベース、ストレージ、関数
- **OpenAI API** - テキスト、画像生成
- **AWS S3** - スケーラブル画像ストレージ
- **Node.js** - ビジネスロジック用Cloud Functions

### **開発ツール**
- **Build Runner** - コード生成自動化
- **Custom Lint** - 一貫したコード品質
- **GitHub Actions** - CIパイプライン
- **CodeMagic** - CDパイプライン

---

## 📁 プロジェクト構成

### 🏗️ **クリーンアーキテクチャ実装**

```
lib/
├── application/                      # 【アプリケーション層】ユースケース実装
│   ├── app/                          # アプリケーション設定
│   │   ├── my_app.dart               # メインアプリケーションウィジェット
│   │   ├── flavors.dart              # 環境設定管理（dev/prod）
│   │   ├── router/                   # Auto Route ナビゲーション
│   │   │   ├── app_router.dart       # ルート定義
│   │   │   └── app_router.gr.dart    # 生成されたルーティングコード
│   │   └── run_app.dart              # アプリケーション初期化ロジック
│   └── use_case/                     # ビジネスロジック実装
│       ├── file/                     # ファイル操作ユースケース
│       ├── post/                     # 投稿管理ユースケース
│       ├── posts/                    # 投稿コレクション管理
│       ├── purchase/                 # 課金ワークフロー管理
│       └── user/                     # ユーザー関連操作
│
├── domain/                           # 【ドメイン層】ビジネスルール・インターフェース
│   ├── entity/                       # ドメインエンティティ
│   │   ├── global/                   # グローバル状態エンティティ
│   │   │   ├── current_user/         # 現在ユーザー状態
│   │   │   ├── local_setting/        # ローカル設定
│   │   │   ├── remote_config/        # リモート設定
│   │   │   └── tokens/               # グローバルトークン
│   │   └── view_model_state/         # UI状態エンティティ
│   ├── repository_interface/         # リポジトリインターフェース（依存関係逆転）
│   │   ├── i_api_repository.dart     # API操作インターフェース
│   │   ├── i_auth_repository.dart    # 認証インターフェース
│   │   ├── i_database_repository.dart # データベース操作インターフェース
│   │   ├── i_local_repository.dart   # ローカルストレージインターフェース
│   │   ├── i_purchase_repository.dart # 課金インターフェース
│   │   └── i_remote_config_repository.dart # リモート設定インターフェース
│   ├── use_case_interface/           # ユースケースインターフェース
│   │   ├── file/                     # ファイル操作インターフェース
│   │   ├── post/                     # 投稿管理インターフェース
│   │   ├── posts/                    # 投稿コレクションインターフェース
│   │   ├── purchase/                 # 課金ワークフローインターフェース
│   │   └── user/                     # ユーザー操作インターフェース
│   └── value/                        # 値オブジェクト
│
├── infrastructure/                   # 【インフラストラクチャ層】外部システム統合
│   ├── model/                        # データモデル（Freezed実装）
│   │   ├── database_schema/          # Firestoreデータモデル
│   │   │   ├── post/                 # 投稿関連モデル
│   │   │   ├── public_user/          # 公開ユーザー情報
│   │   │   ├── private_user/         # プライベートユーザー情報
│   │   │   ├── text_message/         # チャットメッセージ
│   │   │   ├── bookmark/             # ブックマーク機能
│   │   │   ├── follower/             # フォロワーシステム
│   │   │   ├── post_like/            # いいね機能
│   │   │   ├── user_mute/            # ミュート機能
│   │   │   └── tokens/               # 各種トークンモデル
│   │   ├── local_schema/             # ローカルストレージモデル
│   │   └── rest_api/                 # REST API用モデル
│   │       ├── open_ai/              # OpenAI API統合
│   │       └── verify_purchase/      # 課金検証API
│   └── repository/                   # リポジトリ実装（インターフェース実装）
│       ├── api_repository.dart       # REST API データソース実装
│       ├── auth_repository.dart      # 認証データソース実装
│       ├── database_repository.dart  # Firestoreデータベース操作実装
│       ├── local_repository.dart     # ローカルストレージ操作実装
│       ├── purchase_repository.dart  # アプリ内課金操作実装
│       ├── remote_config_repository.dart # Firebase Remote Config実装
│       └── result/                   # エラーハンドリングResult実装
│
├── presentation/                     # 【プレゼンテーション層】UI・ユーザーインターフェース
│   ├── component/                    # 再利用可能UIコンポーネント
│   │   ├── async_value_widget/       # 非同期値表示コンポーネント
│   │   ├── custom_text_field/        # カスタムテキストフィールド
│   │   ├── flexible_space_bar/       # フレキシブルスペースバー
│   │   ├── show_simple_dialog/       # シンプルダイアログ
│   │   └── user_avatar/              # ユーザーアバター
│   ├── page/                         # 画面実装
│   │   ├── auth/                     # 認証関連画面
│   │   ├── chat/                     # チャット関連画面
│   │   ├── create_post/              # 投稿作成画面
│   │   ├── generate_image/           # 画像生成画面
│   │   ├── common/                   # 共通画面要素
│   │   └── screen/                   # 画面テンプレート・レイアウト
│   ├── notifier/                     # Riverpod状態管理ノティファイア
│   ├── state/                        # UI状態モデル
│   │   └── common/                   # 共通状態
│   └── common/                       # 共通プレゼンテーション要素
│
├── core/                             # 【共有層】横断的関心事・ユーティリティ
│   ├── provider/                     # Riverpod状態管理プロバイダー
│   │   ├── keep_alive/               # 永続プロバイダー
│   │   │   ├── infrastructure/       # Firebaseサービスプロバイダー
│   │   │   ├── notifier/             # 状態ノティファイア
│   │   │   ├── stream/               # ストリームプロバイダー
│   │   │   └── usecase/              # ユースケースプロバイダー
│   │   ├── view_model/               # 画面固有ビューモデル
│   │   ├── repository/               # リポジトリプロバイダー
│   │   └── stream/                   # リアルタイムデータストリーム
│   ├── util/                         # コアユーティリティ
│   │   ├── auth_core.dart            # 認証ビジネスロジック
│   │   ├── date_core.dart            # 日付・時刻ユーティリティ
│   │   ├── id_core.dart              # ID生成ユーティリティ
│   │   ├── json_core.dart            # JSON処理ユーティリティ
│   │   ├── search_core.dart          # 検索機能ロジック
│   │   ├── purchases_core.dart       # アプリ内課金ロジック
│   │   ├── remote_config_core.dart   # 機能フラグ管理
│   │   └── aws_s3_core.dart          # クラウドストレージ統合
│   ├── extension/                    # Dart拡張メソッド
│   ├── constant/                     # 定数
│   └── theme/                        # テーマ管理・デザインシステム
│
└── gen/                              # 自動生成ファイル
    ├── assets.gen.dart               # アセット定義
    └── firebase_options.dart         # Firebase設定
```

### 🧪 **テストアーキテクチャ**

```
test/
├── core/                      # コアビジネスロジック単体テスト
│   ├── auth_core_test.dart    # 認証ロジックテスト
│   ├── date_core_test.dart    # 日付処理テスト
│   ├── id_core_test.dart      # ID生成テスト
│   ├── json_core_test.dart    # JSON処理テスト
│   └── search_core_test.dart  # 検索機能テスト
│
├── extension/                 # 拡張メソッドテスト
│   ├── double_extension_test.dart
│   └── string_extension_test.dart
│
├── repository/                # データ層テスト（モック使用）
│   ├── database_repository_test.dart
│   ├── auth_repository_test.dart
│   └── result/                # Resultパターンテスト
│
├── use_case/                  # ビジネスロジックテスト
│   ├── user_use_case_test.dart
│   ├── post_use_case_test.dart
│   └── purchase_use_case_test.dart
│
├── views/                     # UIコンポーネントテスト
│   └── components/            # ウィジェット単体テスト
│
├── ui_core/                   # UIコアテスト
│   └── validator/             # バリデーションテスト
│
└── test_utils/                # テストヘルパー・モックツール
    ├── mock_providers.dart    # モックプロバイダー
    └── test_helper.dart       # テストユーティリティ
```

### 🛠️ **設定・インフラストラクチャ**

```
├── android/                   # Android設定（マルチフレーバー対応）
├── ios/                       # iOS設定（複数スキーム対応）
├── web/, linux/, macos/, windows/ # マルチプラットフォーム対応
├── firestore_rules/           # Firestoreセキュリティルール
├── pubspec.yaml              # 依存関係・ビルド設定
├── analysis_options.yaml     # リント・コード解析ルール
└── CLAUDE.md                 # Claude Code用プロジェクト指示書
```

### 🏛️ **アーキテクチャパターン**

#### **1. クリーンアーキテクチャ実装**
- **プレゼンテーション層**: Pages/Components + Notifiers（Riverpod）
- **アプリケーション層**: Use Case Implementations + Business Logic
- **ドメイン層**: Business Rules + Interfaces（依存関係逆転の原則）
- **インフラストラクチャ層**: Repository Implementations + External API Integration
- **依存関係制御**: Domain層がインターフェースを定義し、外側の層が実装

#### **2. 状態管理戦略**
- **Riverpod 2.x** コード生成ベース
- **AsyncValue** ローディング状態管理
- **StateNotifier** 複雑状態管理

#### **3. エラーハンドリング**
- **Resultパターン** 実装
- **カスタムResult<T>** 型による一元的エラー処理

#### **4. コード生成パイプライン**
- **Freezed** イミュータブルデータクラス
- **Riverpod Generator** プロバイダー生成
- **Auto Route** ナビゲーション生成
- **JSON Serializable** APIモデル生成

#### **5. 依存関係逆転の実装**
- **Repository Interfaces**: `domain/repository_interface/` でインターフェース定義
- **Use Case Interfaces**: `domain/use_case_interface/` でビジネスロジックインターフェース定義
- **Implementation**: `infrastructure/repository/` と `application/use_case/` で実装
- **Dependency Injection**: Riverpodによるインターフェースベースの依存注入

---

## 🚀 開発者向けスタートガイド

### **ローカル開発**
1. **環境セットアップ**: Flutterインストールガイドに従ってセットアップ
2. **Firebase設定**: 開発用Firebaseプロジェクトのセットアップ
3. **APIキー**: OpenAI・AWSの認証情報を設定
4. **開発ビルド実行**: 上記のflavorコマンドを使用

### **コントリビューションガイドライン**
- クリーンアーキテクチャ原則に従う
---

<div align="center">

**Flutter製 🚀 | AI駆動 🤖 | スケール設計 📈**

</div>